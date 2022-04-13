Compose sig A from sigs B and C.

Same as demo signatures/composition/a2, but omits '-open' options to
compile a.mli. Demos a1, a2, a3 show that sigtypes must be opened
before they can be included.

$ make
ocamlc -c b.mli
ocamlc -c c.mli
ocamlc -c a.mli
File "a.mli", line 3, characters 8-9:
3 | include B
            ^
Error: Unbound module type B
Hint: There is a module named B, but modules are not module types
make: *** [asig] Error 2

Note that the error message is inaccurate: there is no "module" B,
only a signature that the compiler interprets as a module.
