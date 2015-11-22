let range a b =
  let rec loop n acc =
    if n < a then acc else loop (n - 1) (n :: acc)
  in loop b [];;

let problem_01 n =
  let f x =
    x mod 3 = 0 || x mod 5 = 0
  in List.fold_left (+) 0 (List.filter f (range 0 (n - 1)));;

print_int (problem_01 1000);;

