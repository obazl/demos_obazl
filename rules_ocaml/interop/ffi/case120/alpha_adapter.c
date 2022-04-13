#include <stdio.h>
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include "alpha.h"

CAMLprim value
caml_print_hello(value unit)
{
    printf("%s\n", my_str_fn());
    return Val_unit;
}

CAMLprim value
caml_my_str_fn(value unit)
{
    return caml_copy_string(my_str_fn());
}

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
