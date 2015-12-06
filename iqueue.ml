open Core.Std
open Misc

type 'a t = 'a list * 'a list

let rec dequeue = function
  | ([], []     ) -> None
  | (i , h :: t') -> Some (h, (i, t'))
  | (i , []     ) -> dequeue ([], List.rev i)

let empty = ([], [])

let fold (i, o) ~init ~f =
  let partial = List.fold ~init ~f o in
  List.fold_right ~init:partial ~f:(fun a acc -> f acc a) i

let is_empty = function
  | ([], []) -> true
  | _        -> false

let length (i, o) =
  (List.length i) + (List.length o)

let map (i, o) ~f =
  (List.map i ~f, List.map o ~f)

let peek (_, o) = List.hd o

let queue (i, o) a = (a :: i, o)
