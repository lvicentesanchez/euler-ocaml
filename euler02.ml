#!/usr/bin/env ocamlscript
Ocaml.ocamlflags := [ "-thread" ];
Ocaml.packs := []
--

let is_even n =
  n mod 2 = 0

let problem_02 limit =
  let rec fib acc a = function
    | b when b > limit -> acc
    | b when is_even b -> fib (acc + b) b (a + b)
    | b                -> fib acc b (a + b)
  in fib 0 1 1

let () =
  print_int (problem_02 4000000)
