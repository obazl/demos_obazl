type enum = A | B of int | C of bool * int | D of { a : int; b : string }
  [@@deriving show]

type 'a poly = A of enum | B of 'a poly * 'a
  [@@deriving show]

module Test : sig
  type t = A [@@deriving show]
end

