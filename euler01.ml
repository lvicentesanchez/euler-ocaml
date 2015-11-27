#!/usr/bin/env ocamlscript
Ocaml.ocamlflags := [ "-thread" ];
Ocaml.packs := [ "core" ]
--

open Core.Std

let problem_01 n =
  let f x =
    x mod 3 = 0 || x mod 5 = 0
  in List.fold_left ~init:0 ~f:(+) (List.filter ~f (List.range 0 n));;

let () =
  print_int (problem_01 1000);;

