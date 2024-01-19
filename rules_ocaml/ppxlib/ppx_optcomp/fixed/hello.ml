[%%import "config.mlh"]

[%%if greeting = 1]

let msg = "Hello"

[%%elif greeting = 2]

let msg = "Goodbye"

[%%else]

let msg = "Huh?"

[%%endif]

