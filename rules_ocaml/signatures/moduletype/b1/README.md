Compose sig A from sig types B1 and C1 without module types

Demonstrates that a signature (A) may be composed from a module type
declared in sigfiles whose names do not match the module type name.

For example, here b.mli contains 'module type B1 = sig...end', and
c.mli contains 'module type C1 = sig...end'.

Sigfile then contains an 'open' directive for the signature types B
and C, and 'include' directives for the module types B1 and C1.

Compare with demo a1, where the modue type name matches the mli file name.
