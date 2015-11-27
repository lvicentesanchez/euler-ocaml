open Core.Std

let scan_left t ~init ~f =
  let rec loop t x xs = match t with
    | []     -> List.rev xs
    | hd::tl -> let n = f x hd in loop tl n (n :: xs)
  in loop t init [init];;

include List
