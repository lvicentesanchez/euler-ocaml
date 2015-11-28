open Core.Std

include List

let scan_left t ~init ~f =
  let rec loop xs x = function
    | []     -> rev xs
    | hd::tl -> let n = f x hd in loop (n :: xs) n tl
  in loop [init] init t;;

