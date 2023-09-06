Demonstrates binding a fixed signature to different structs.

The sigfile a.mli has one field, so any struct with that field
satisfies the signature. Each structfile file in this directory
implements that field plus some others. Note that ax.ml is the
least struct that will satisfy the signature.

To run: $ make COMBO=<combo>
where <combo> = x | xy | xyz

or: $ make all

