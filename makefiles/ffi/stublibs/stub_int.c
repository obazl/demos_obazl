#include <stdio.h>

#define CAML_NAME_SPACE
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include "alpha.h"

CAMLprim value
caml_print_int(value unit)
{
    printf("%d\n", my_int_fn());
    return Val_unit;
}

CAMLprim value
caml_my_int_fn(value unit)
{
    return Val_int(my_int_fn());
}
