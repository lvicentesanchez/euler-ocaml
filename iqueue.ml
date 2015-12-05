open Core.Std
open Misc

type 'a t = 'a list * 'a list

let rec dequeue = function
  | ([], []     ) -> None
  | (i , h :: t') -> Some (h, (i, t'))
  | (i , []     ) -> dequeue ([], List.rev i)

let empty = ([], [])

let is_empty (i, o) =
  (List.is_empty i) && (List.is_empty o)

let length (i, o) =
  (List.length i) + (List.length o)

let map (i, o) ~f =
  (List.map i ~f, List.map o ~f)

let peek (_, o) = List.hd o

let queue (i, o) a = (i, a :: o)
