let range a b =
  let rec aux n acc =
    if n < a then acc else aux (n - 1) (n :: acc)
  in aux b [];;

let problem_01 n =
  let filter x = (x mod 3) = 0 || (x mod 5) = 0
  in List.fold_left (+) 0 (List.filter filter (range 0 (n - 1)));;

print_int (problem_01 1000);;
