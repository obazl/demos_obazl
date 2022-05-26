Demonstrates binding a fixed struct to different sigs.

The struct a.ml has three fields, so it can satisfy any signature
composed of combination of those fields. Each .mli file exposes one
combination.

To run: $ make COMBO=<combo>
where <combo> = x | y | z | xy | xz | yz | xyz

or: $ make all

Note that axyz.mli is the principal signature for a.ml. It is also
the greatest signature for a.ml; extending it by adding more fields
would result in a signature that a.ml could not satisfy.
To verify this, run '$ make COMBO=xyz_extended'. Expected result:

Error: The implementation a.ml does not match the interface a.cmi:
       The value `extra' is required but not provided
       File "a.mli", line 5, characters 0-14: Expected declaration

