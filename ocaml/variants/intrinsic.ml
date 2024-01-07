type fruit  = Apple | Orange | Banana

let string_of_fruit x = match x with
  | Apple -> "apple"
  | Orange -> "orange"
  | Banana -> "banana"

let () = print_endline (string_of_fruit Apple)

type veggy = Carrot | Celery | Broccoli

(*
let f_or_v x = match x with
  | Apple -> "APPLE"
  | Orange -> "ORANGE"
  | Banana -> "BANANA"
  | Carrot -> "Carrot"
 *)
(*
16 |   | Carrot -> "Carrot"
         ^^^^^^
Error: This variant pattern is expected to have type fruit
There is no constructor Carrot within type fruit
 *)

(* If we had coproduct types we could for fruit + veggy, which would
   contain all ctors from each (disjoint union).
 *)

(* in the repl:
# `Cat
- : [> `Cat ] = `Cat *)
(* Here `Cat is a "tagged" constructor. Such constructors are not
   intrinsically typed; it is up to the compiler to derive (construct)
   the type.

   In this case the compiler derives a "variant abstraction", [>
   `Cat]. It denotes the "copower set" of {Cat}: the set of all
   (finite) sets containing Cat.

   It follows that [> `Cat] is not a type expression; it does not
   denote a specific type, but a family of types. When `Cat is used in
   some other expression, the compiler will infer (from the
   context-of-use) which member of the type family has the best fit
   for the context, and use it as the type of Cat.
 *)

let cat = `Feline
(* val cat : [> `Feline ] = `Feline *)
(* we can define a fn to print cat but not to print [> `Feline] *)

let dog = `Canine
(* val dog : [> `Canine ] = `Canine *)

let pets = [cat]
(* val pets : [> `Feline ] list = [`Feline] *)
(* NOTE: the type is [> `Feline] list but the value is just [`Feline]. This
   demonstrates the overloading of [] - the former is a variant
   abstraction expression; the latter is an ordinary list expression. *)

let pets = [cat; dog]
(* val pets : [> `Canine | `Feline ] list = [`Feline; `Canine] *)
(* Demonstrates type reassignment. In the previous example, `Feline
   had type [> `Feline], but here it has type [> `Canine | `Feline].
   The latter subsumes the former, so these are compatible
   assignments. What happens is that the compiler sees that cat and
   dog, being in the same list value, must have the same type. It also
   sees that they are assigned different types ([> `Feline] and [>
   `Canine]); but since those are "open" types, it can derive a new
   type that is compatible with both, namely [> `Canine | `Feline].

   BUT: since these [] expressions are not type constructions, it is
   incorrect to say that cat and dog are assigned types. It's more
   accurate to say they are assigned to type classes (categories,
   kinds, whatever). Or in this case involving [> ...], we might say
   they are assigned the initial type of a family of types. For [<
   ...], we would say "final (co?)type of a family of types." By
   analogy to "initial algebra" and "final coalgebra".

 *)

(* We can construct variant abstraction of one ctor:*)
(*
`Cat;;
- : [> `Cat ] = `Cat
 *)

(* But we cannot construct one with more: *)
(*
# `Cat | `Dog;;
Error: Syntax error
 *)

(* Adding [] just makes ocaml think its a list: *)
(*
# [`Cat];;
- : [> `Cat ] list = [`Cat]
# [`Cat `Dog];;
- : [> `Cat of [> `Dog ] ] list = [`Cat `Dog]
 *)

             (* What we can do is use type abbreviation: *)
(*
# type vabs = [`Cat | `Dog];;
type vabs = [ `Cat | `Dog ]
 *)

(* But this only works for "exact" variant abstractions.
   We cannot define an abbreviation for [> ] or [< ]
 *)
(*
# type vabs = [> `Cat | `Dog];;
Error: A type variable is unbound in this type declaration.
       In type [> `Cat | `Dog ] as 'a the variable 'a is unbound
 *)

             (* functions over variant abstractions *)
let f = function `Cat -> "feline" | `Dog -> "canine"
(* val f : [< `Cat | `Dog ] -> string = <fun> *)
(* REMARKS:
   The type expression here is really a type schema, that
   can be instantiated to several types.

   Domain: OCaml sees that f is defined for two distinct
   ad-hoc constructors, `Cat and `Dog. So it knows it must
   derive a new type that includes both as data ctors,
   -- and no others, since those are the only args for
   which it is defined.

   [< `Cat | `Dog] is a "kind" expression, not a type
   expression. It expresses, not a type, but a collection
   of types: the set of all types whose ctors include
   _at most_ `Cat and `Dog. Which is formed by permuting
   the two constructors: [`Cat], [`Dog], and [`Cat | `Dog].

   This means that f is a family of functions,
   containing one function for each type of kind
   [< `Cat | `Dog] and no others. The functions in
   the family are identical except for the domain type.

   Example: one function in the family is defined over
   the (unnamed) variant type with the single ctor `Cat,
   i.e. the "exact" type [`Cat]. It happens it is also
   defined for `Dog, which is not a value of that type;
   but that's no problem; it just means that the function
   will never return "canine" when applied to values
   of that type.
 *)

(* To demonstrate the last point we can try to apply
   f to a value of type [`Cat].
 *)

let catarg:[`Cat] = `Cat
(* val catarg : [ `Cat ] = `Cat *)
(* # f catarg ;; *)
(* - : string = "feline" *)
let () = print_endline ("f catarg => " ^ f catarg) (* feline *)

let dogarg:[`Dog] = `Dog
(* val dogarg : [ `Dog ] = `Dog *)
let () = print_endline ("f dogarg => " ^ f dogarg) (* canine *)

(* IMPORTANT: we seem to have applied the same function, f,
   to args of different types. But what really happens
   is that f designates a family of functions, and
   OCaml selects the appropriate member of the family,
   based on the arg type (or more precisely the arg kind).
   In other words it makes the selection based on the
   context of use (application).

   This is a kind of dependent typing, where the type
   of the function (specifically its domain type) is
   determined by the type of the argument to which it
   is applied. More commonly dependent typing means that
   the type (and not just the value) of the result of
   a function depends on the value of its arg(s).

   Note that `Cat has kind [> `Cat], not [`Cat]:

# `Cat;;
- : [> `Cat ] = `Cat
 *)
let () = print_endline ("f `Cat => " ^ f `Cat) (* feline *)

(*
   We can also apply f to the "greatest" type in the
   variant abstraction:
 *)

let cat2arg:[`Cat | `Dog] = `Cat
(* val cat2arg : [ `Cat | `Dog ] = `Cat *)
let () = print_endline ("f cat2arg => " ^ f cat2arg) (* feline *)

(*
# let f = function `Cat -> `Feline | `Dog -> `Canine ;;
val f : [< `Cat | `Dog ] -> [> `Canine | `Feline ] = <fun>
 *)
(* Remarks:
 * Same considerations apply to the codomain of this function
 schema.
 *)

(*
  We can expand the domain of f by matching a wildcard value:
 *)
let f = function `Cat -> "pet" | `Dog -> "pet" | _ -> "other"
(* val f : [> `Cat | `Dog ] -> string = <fun> *)
(*
  The domain kind, [> `Cat | `Dog], means: any type
  containing *at least* `Cat and `Dog constructors,
  which means that we can pass *any* adhoc constructor.
  Anything other than `Cat or `Dog will be matched by
  _ -> "other":
 *)
let () = print_endline ("f `Gerbil => " ^ f `Gerbil) (* other *)

(* IMPORTANT: for the "wildcard" in the previous example
   we used '_', but this is not required. Once OCaml sees
   that the domain kind is a variant abstraction, it will
   treat any identifier (without backtick) as an adhoc
   ctor wildcard. If you list more than one, the first
   will be used:
 *)

let g = function
  |`Cat -> "pet"
  | `Dog -> "pet"
  | foo -> "foo"   (* adhoc ctor wildcard *)
  | bar -> "bar"   (* otiose *)
(*
230 |   | bar -> "bar"   (* otiose *)
          ^^^
Warning 11 [redundant-case]: this match case is unused.
 *)

let () = print_endline ("g `Tardigrade => " ^ g `Tardigrade) (* other *)

(*
let g = function
  |`Cat -> "pet"
  | `Dog -> "pet"
  | 99 -> "foo"
 *)
(*
Error: This pattern matches values of type int
       but a pattern was expected which matches values of type
         [? `Cat | `Dog ]
 *)

(* similar error:
let g = function
  |`Cat -> "pet"
  | `Dog -> "pet"
  | "foo" -> "foo"
 *)
