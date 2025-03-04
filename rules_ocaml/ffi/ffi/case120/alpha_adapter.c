#include <stdio.h>
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include "alpha.h"

CAMLprim value
my_print_hello(value unit)
{
    printf("my_print_hello: %s\n", alpha_my_str_fn());
    /* return Val_unit; */
    return caml_copy_string(alpha_my_str_fn());
}

CAMLprim value
my_str_fn(value unit)
{
    return caml_copy_string(alpha_my_str_fn());
}

CAMLprim value
my_print_int(value unit)
{
    /* printf("my_print_int: %d\n", alpha_my_int_fn()); */
    /* return Val_unit; */
    return alpha_my_int_fn();
}

/* CAMLprim value */
/* my_int_fn(value unit) */
/* { */
/*     return Val_int(my_int_fn()); */
/* } */
