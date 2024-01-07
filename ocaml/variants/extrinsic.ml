(* extrinsic variant types (aka "polymorphic variants") *)

(* Variant data constructors are simple identifiers *)
(* type fruit = Apple | Orange *)

(* this defines the ctors Apple and Orange, so they count as bound
   vars. In the repl:

# type fruit = Apple | Orange ;;
type fruit = Apple | Orange
# Apple;;
- : fruit = Apple

Which tells us that Apple is now a constant bound to a value whose
print representation (the RHS) is also Apple.
 *)

(* But a capitalized identifier that has not been declared as a data
   constructor for any type is just an unbound ctor:

# Asfd ;;
Error: Unbound constructor Asfd

and an uncapitalized identifier is interpreted as an "unbound value":

# asfd;;
Error: Unbound value asfd

Which tells us that the repl assumes that such undefined identifiers
must be value constants, like 3 or "foo".  The compiler, by contrast,
will just report "Syntax error" for this at the top level:

asdf

 *)

(* But identifiers decorated by a backtick, capitalized or not, are
   treated differently. The backtick marks them as extrinsically
   typed, i.e. polymorphic variant constructors. When it sees a
   backtick decoration, the compiler will engage the type inference
   engine to determine the "kind" of the constructor.
 *)

`Cat
(* - : [> `Cat ] = `Cat *)

(* Unlike standard (intrinsically typed) variant constructors,
   backticked constructors need not be capitalized: *)
`cat
(* - : [> `cat ] = `cat *)

(* For conciseness we call these "ad-hoc ctors" rather than
   "extrinsically typed polymorphic variant type data constructors".
   Justification of the term "ad-hoc" will become clear in what
   follows. *)

(* Since ad-hoc constructors are not intrinsically typed, it is up to
   the compiler to derive (construct) their types. Unfortunately,
   the backticked identifier alone does not provide enough information
   to make this possible.  That's because extrinsic typing means that
   ctors can be assigned multiple types, even in the same program, so
   long as they are "compatible". So instead the inference engine
   does the next best thing: it infers the _kind_ of the ad-hoc ctor.

   A (pv-) kind is a sort of abstraction over ad-hoc ctors.

   In the case of `Cat, the compiler derives kind [> `Cat].
   This denotes the set of all types whose ctors include at
   least `Cat.  It includes, for example, [`Cat], [`Cat | `Dog],
   and so on ad infinitum.

   (NOTE: [> ...] and [< ...] are kind expressions, but [...]
   is a determinate type expression (assuming its contents are
   all ad-hoc ctors.)

   It follows that [> `Cat] is not a type expression; it does not
   denote a specific type, but a "kind" (not "family") of types.
   When `Cat is used in some other expression, e.g. as the arg
   of a function application, the compiler will see that it has
   kind [> `Cat], and since that kind includes multiple types,
   it will infer (from the context-of-use) which type in the
   kind has the best fit for the context, and use it as the type
   of `Cat.
 *)


let cat = `Feline
(* val cat : [> `Feline ] = `Feline *)

let dog = `Canine
(* val dog : [> `Canine ] = `Canine *)

let pets = [cat]
(* val pets : [> `Feline ] list = [`Feline] *)
(* NOTE: the type/kind is "[> `Feline] list" but the value is just
   [`Feline]. This demonstrates the overloading of [] - [> `Feline]
   is a kind expression; but [`Feline] is an ordinary list expression.
 *)

let pets = [cat; dog]
(* val pets : [> `Canine | `Feline ] list = [`Feline; `Canine] *)
(* Demonstrates type reassignment. In the previous example, `Feline
   had type [> `Feline], but here it has type [> `Canine | `Feline].
   The latter subsumes the former, so these are compatible
   assignments. What happens is that the compiler sees that cat and
   dog, being in the same list value, must have the same type. It also
   sees that they are assigned different kinds ([> `Feline] and
   [> `Canine]); but since those are "open" kinds, it can derive a new
   kind that is compatible with both, namely [> `Canine | `Feline].

   BUT: since these [] expressions are not type constructions, it is
   incorrect to say that cat and dog are assigned types. It's more
   accurate to say they are assigned to type kinds (categories,
   kinds, whatever). Or in this case involving [> ...], we might say
   they are assigned the initial type of a kind of types. For [<
   ...], we would say "final (co?)type of a kind of types." By
   analogy to "initial algebra" and "final coalgebra".

 *)

(* OCaml can infer the kind of a single ad-hoc ctor:*)
(*
`Cat;;
- : [> `Cat ] = `Cat
 *)

(* But it cannot do so directly for a disjunction: *)
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

(* However we can define a type abbreviation: *)
(*
# type vabs = [`Cat | `Dog];;
type vabs = [ `Cat | `Dog ]
 *)

(* But this only works for "exact" kinds like [`Cat | `Dog],
   which makes sense, since an exact kind corresponds exactly
   to a determinate type.  Since [>...] and  [<...] do not
   designate determinate types, we cannot write type abbreviations
   for them.

# type vabs = [> `Cat | `Dog];;
Error: A type variable is unbound in this type declaration.
       In type [> `Cat | `Dog ] as 'a the variable 'a is unbound

The mysterious "type variable" and 'a in this message will be
explained below.
 *)

             (* functions over variant abstractions *)
let f = function `Cat -> "feline" | `Dog -> "canine"
(* val f : [< `Cat | `Dog ] -> string = <fun> *)
(* REMARKS:
   The type expression here is really a type schema, that
   can be instantiated to several types. (???)

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

(*
  Note that `Gerbil has type [> `Gerbil], but the domain type is [>
  `Cat | `Dog]. But this works since the expansion of [> `Gerbil]
  would include types containing `Cat or `Dog.

  But what if we try [`Gerbil]?
 *)
let gerb:[`Gerbil] = `Gerbil
(* val gerb : [ `Gerbil ] = `Gerbil *)
(*
let () = print_endline ("f gerb => " ^ f gerb)
271 | let () = print_endline ("f gerb => " ^ f gerb)
                                               ^^^^
Error: This expression has type [ `Gerbil ]
       but an expression was expected of type [> `Cat | `Dog ]
       The first variant type does not allow tag(s) `Cat, `Dog
 *)

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
