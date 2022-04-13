Compose sig A from sig types B1 and C1.

In this example a.mli depends on module types B1 and C1, but does not
depend on any particular file - the compile command can '-open' any
signature that contains declarations for these types.

