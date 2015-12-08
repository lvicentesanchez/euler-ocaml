open Core.Std

module type S = sig
  type 'a t
  val fold : 'a t -> init:'acc -> f:('acc -> 'a -> 'acc) -> 'acc
end

module type Extension = sig
  type 'a t
  val count       : 'a t -> f:('a -> bool) -> int
  val exists      : 'a t -> f:('a -> bool) -> bool
  val fold_monoid : 'a t -> (module Data.Monoid with type t = 'a) -> 'a
  val for_all     : 'a t -> f:('a -> bool) -> bool
  val iter        : 'a t -> f:('a -> unit) -> unit
  val length      : 'a t -> int
end

module Extend(Arg : S)
  : (Extension with type 'a t := 'a Arg.t) =
struct
  open Arg

  let count t ~f =
    fold t ~init:0  ~f:(fun count x -> count + if f x then 1 else 0)

  let fold_monoid
        (type a)
        (t: a t)
        (module M: Data.Monoid with type t = a)
    =
    fold t ~init:M.zero ~f:M.append

  let iter t ~f =
    fold t ~init:() ~f:(fun () a -> f a)

  let length t =
    fold t ~init:0  ~f:(fun acc _ -> acc + 1)

  exception Short_circuit

  let exists c ~f =
    try iter c ~f:(fun x -> if f x then raise Short_circuit); false
    with Short_circuit -> true

  let for_all c ~f =
    try iter c ~f:(fun x -> if not (f x) then raise Short_circuit); true
    with Short_circuit -> false
end
