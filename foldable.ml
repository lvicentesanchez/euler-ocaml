(*
 * Initial version copied from 'Real World OCaml'
 *)
open Core.Std

module type S = sig
  type 'a t
  val fold : 'a t -> init:'acc -> f:('acc -> 'a -> 'acc) -> 'acc
end

module type Extension = sig
  type 'a t
  val count    : 'a t -> f:('a -> bool) -> int
  val exists   : 'a t -> f:('a -> bool) -> bool
  val fold_map : 'a t -> f:('a -> 'b) -> (module Data.Monoid with type t = 'b) -> 'b
  val for_all  : 'a t -> f:('a -> bool) -> bool
  val iter     : 'a t -> f:('a -> unit) -> unit
  val length   : 'a t -> int
  val sum      : 'a t -> (module Data.Monoid with type t = 'a) -> 'a
end

module Extend(Arg : S)
  : (Extension with type 'a t := 'a Arg.t) =
struct
  open Arg

  let count t ~f =
    fold t ~init:0  ~f:(fun count x -> count + if f x then 1 else 0)

  let fold_map
        (type a)
        (type b)
        (t: a t)
       ~(f: a -> b)
        (module M: Data.Monoid with type t = b)
    =
    let f = fun b a -> M.append b (f a)
    in
    fold t ~init:M.zero ~f

  let iter t ~f =
    fold t ~init:() ~f:(fun () a -> f a)

  let length t =
    fold t ~init:0  ~f:(fun acc _ -> acc + 1)

  let sum
        (type a)
        (t: a t)
        (module M: Data.Monoid with type t = a)
    =
    fold t ~init:M.zero ~f:M.append

  exception Short_circuit

  let exists c ~f =
    try iter c ~f:(fun x -> if f x then raise Short_circuit); false
    with Short_circuit -> true

  let for_all c ~f =
    try iter c ~f:(fun x -> if not (f x) then raise Short_circuit); true
    with Short_circuit -> false
end
