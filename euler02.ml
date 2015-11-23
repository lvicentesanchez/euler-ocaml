let is_even n = 
  n mod 2 = 0;;

let problem_02 limit =
  let rec fib a b acc = match b with
    | n when n > limit -> acc
    | n when is_even n -> fib b (a + b) (acc + b)
    | n                -> fib b (a + b) acc
  in fib 1 1 0;;

print_int (problem_02 4000000);;

