let is_even n = 
  n mod 2 = 0;;

let problem_02 limit =
  let rec fib a b acc =
    let n = a + b 
    in if b > limit then acc
       else if is_even b then fib b n (acc + b)
       else fib b n acc
  in fib 1 1 0;;

print_int (problem_02 4000000);;

