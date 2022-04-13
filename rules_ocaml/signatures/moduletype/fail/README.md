Demonstrates wrong way to compose sig A from sigs B and C.

Compilation fails for a.mli because it tries to 'include' B and C, but
b.mli and c.mli do not include module type declarations of the form:
module type B = sig ... end and module type B = sig ... end, respectively.

Note that the hint message is misleading: "Hint: There is a module
named B, but modules are not module types". But there is no module B,
only a signature (b.mli, b.cmi) that the compiler interprets as a
module. On the other hand it is true that signatures are not signature
types.


