let rec foo x0 f = function
  | [] -> 0 | x::xs -> f x (foo x0 f xs)

(*$T foo
  foo  0 ( + ) [1;2;3] = 6
  foo  0 ( * ) [1;2;3] = 0
  foo  1 ( * ) [4;5]   = 20
  foo 12 ( + ) []      = 12
*)
