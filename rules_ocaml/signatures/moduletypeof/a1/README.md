Compose sig A from sigs B and C, using module types

Demos a1, a2, a3 together show that sigfiles may be composed
_provided_ that:

1) the component sigfiles (b.mli, c.mli) declare a module type (NB:
not a sig type) whose name matches the filename;

2) the components are 'opened', either by:

    a) 'open' directives in the composite sigfile, or
    b) '-open' options passed to the compile action for the composite sigfile;

3. the composite sigfile (a.mli) contains 'include' directives for the
   components.


