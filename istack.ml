open Core.Std
open Misc

type 'a t = 'a list

let empty = []

let fold = List.fold

let is_empty = List.is_empty

let length = List.length

let map = List.map

let peek = List.hd

let pop = function
  | []      -> None
  | h :: t' -> Some (h, t')

let push t a = a :: t
