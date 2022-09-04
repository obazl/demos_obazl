# 3 "parsing/ocamllex/case100/lexer.mll"
  
# 4 "bazel-out/darwin-fastbuild/bin/parsing/ocamllex/case100/lexer.ml"

let rec __ocaml_lex_refill_buf lexbuf _buf _len _curr _last =
  if lexbuf.Lexing.lex_eof_reached then
    256, _buf, _len, _curr, _last
  else begin
    lexbuf.Lexing.lex_curr_pos <- _curr;
    lexbuf.Lexing.lex_last_pos <- _last;
    lexbuf.Lexing.refill_buff lexbuf;
    let _curr = lexbuf.Lexing.lex_curr_pos in
    let _last = lexbuf.Lexing.lex_last_pos in
    let _len = lexbuf.Lexing.lex_buffer_len in
    let _buf = lexbuf.Lexing.lex_buffer in
    if _curr < _len then
      Char.code (Bytes.unsafe_get _buf _curr), _buf, _len, (_curr + 1), _last
    else
      __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
  end



let rec translate lexbuf =
  let __ocaml_lex_result =
    let _curr = lexbuf.Lexing.lex_curr_pos in
    let _last = _curr in
    let _len = lexbuf.Lexing.lex_buffer_len in
    let _buf = lexbuf.Lexing.lex_buffer in
    let _last_action = -1 in
    lexbuf.Lexing.lex_start_pos <- _curr;
    let next_char, _buf, _len, _curr, _last =
      if _curr >= _len then
        __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
      else
        Char.code (Bytes.unsafe_get _buf _curr),
        _buf, _len, (_curr + 1), _last
    in
    begin match next_char with
      (* |eof *)
      | 256 ->
        (* *)
        lexbuf.Lexing.lex_curr_pos <- _curr;
        lexbuf.Lexing.lex_last_pos <- _last;
        2
      (* |'c' *)
      | 99 ->
        (* *)
        let _last = _curr in
        let _last_action = 1 in
        let next_char, _buf, _len, _curr, _last =
          if _curr >= _len then
            __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
          else
            Char.code (Bytes.unsafe_get _buf _curr),
            _buf, _len, (_curr + 1), _last
        in
        begin match next_char with
          (* |'u' *)
          | 117 ->
            let next_char, _buf, _len, _curr, _last =
              if _curr >= _len then
                __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
              else
                Char.code (Bytes.unsafe_get _buf _curr),
                _buf, _len, (_curr + 1), _last
            in
            begin match next_char with
              (* |'r' *)
              | 114 ->
                let next_char, _buf, _len, _curr, _last =
                  if _curr >= _len then
                    __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                  else
                    Char.code (Bytes.unsafe_get _buf _curr),
                    _buf, _len, (_curr + 1), _last
                in
                begin match next_char with
                  (* |'r' *)
                  | 114 ->
                    let next_char, _buf, _len, _curr, _last =
                      if _curr >= _len then
                        __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                      else
                        Char.code (Bytes.unsafe_get _buf _curr),
                        _buf, _len, (_curr + 1), _last
                    in
                    begin match next_char with
                      (* |'e' *)
                      | 101 ->
                        let next_char, _buf, _len, _curr, _last =
                          if _curr >= _len then
                            __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                          else
                            Char.code (Bytes.unsafe_get _buf _curr),
                            _buf, _len, (_curr + 1), _last
                        in
                        begin match next_char with
                          (* |'n' *)
                          | 110 ->
                            let next_char, _buf, _len, _curr, _last =
                              if _curr >= _len then
                                __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                              else
                                Char.code (Bytes.unsafe_get _buf _curr),
                                _buf, _len, (_curr + 1), _last
                            in
                            begin match next_char with
                              (* |'t' *)
                              | 116 ->
                                let next_char, _buf, _len, _curr, _last =
                                  if _curr >= _len then
                                    __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                  else
                                    Char.code (Bytes.unsafe_get _buf _curr),
                                    _buf, _len, (_curr + 1), _last
                                in
                                begin match next_char with
                                  (* |'_' *)
                                  | 95 ->
                                    let next_char, _buf, _len, _curr, _last =
                                      if _curr >= _len then
                                        __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                      else
                                        Char.code (Bytes.unsafe_get _buf _curr),
                                        _buf, _len, (_curr + 1), _last
                                    in
                                    begin match next_char with
                                      (* |'d' *)
                                      | 100 ->
                                        let next_char, _buf, _len, _curr, _last =
                                          if _curr >= _len then
                                            __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                          else
                                            Char.code (Bytes.unsafe_get _buf _curr),
                                            _buf, _len, (_curr + 1), _last
                                        in
                                        begin match next_char with
                                          (* |'i' *)
                                          | 105 ->
                                            let next_char, _buf, _len, _curr, _last =
                                              if _curr >= _len then
                                                __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                              else
                                                Char.code (Bytes.unsafe_get _buf _curr),
                                                _buf, _len, (_curr + 1), _last
                                            in
                                            begin match next_char with
                                              (* |'r' *)
                                              | 114 ->
                                                let next_char, _buf, _len, _curr, _last =
                                                  if _curr >= _len then
                                                    __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                                  else
                                                    Char.code (Bytes.unsafe_get _buf _curr),
                                                    _buf, _len, (_curr + 1), _last
                                                in
                                                begin match next_char with
                                                  (* |'e' *)
                                                  | 101 ->
                                                    let next_char, _buf, _len, _curr, _last =
                                                      if _curr >= _len then
                                                        __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                                      else
                                                        Char.code (Bytes.unsafe_get _buf _curr),
                                                        _buf, _len, (_curr + 1), _last
                                                    in
                                                    begin match next_char with
                                                      (* |'c' *)
                                                      | 99 ->
                                                        let next_char, _buf, _len, _curr, _last =
                                                          if _curr >= _len then
                                                            __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                                          else
                                                            Char.code (Bytes.unsafe_get _buf _curr),
                                                            _buf, _len, (_curr + 1), _last
                                                        in
                                                        begin match next_char with
                                                          (* |'t' *)
                                                          | 116 ->
                                                            let next_char, _buf, _len, _curr, _last =
                                                              if _curr >= _len then
                                                                __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                                              else
                                                                Char.code (Bytes.unsafe_get _buf _curr),
                                                                _buf, _len, (_curr + 1), _last
                                                            in
                                                            begin match next_char with
                                                              (* |'o' *)
                                                              | 111 ->
                                                                let next_char, _buf, _len, _curr, _last =
                                                                  if _curr >= _len then
                                                                    __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                                                  else
                                                                    Char.code (Bytes.unsafe_get _buf _curr),
                                                                    _buf, _len, (_curr + 1), _last
                                                                in
                                                                begin match next_char with
                                                                  (* |'r' *)
                                                                  | 114 ->
                                                                    let next_char, _buf, _len, _curr, _last =
                                                                      if _curr >= _len then
                                                                        __ocaml_lex_refill_buf lexbuf _buf _len _curr _last
                                                                      else
                                                                        Char.code (Bytes.unsafe_get _buf _curr),
                                                                        _buf, _len, (_curr + 1), _last
                                                                    in
                                                                    begin match next_char with
                                                                      (* |'y' *)
                                                                      | 121 ->
                                                                        (* *)
                                                                        lexbuf.Lexing.lex_curr_pos <- _curr;
                                                                        lexbuf.Lexing.lex_last_pos <- _last;
                                                                        0
                                                                      | _ ->
                                                                        let _curr = _last in
                                                                        lexbuf.Lexing.lex_curr_pos <- _curr;
                                                                        lexbuf.Lexing.lex_last_pos <- _last;
                                                                        1 (* = last_action *)
                                                                    end
                                                                  | _ ->
                                                                    let _curr = _last in
                                                                    lexbuf.Lexing.lex_curr_pos <- _curr;
                                                                    lexbuf.Lexing.lex_last_pos <- _last;
                                                                    1 (* = last_action *)
                                                                end
                                                              | _ ->
                                                                let _curr = _last in
                                                                lexbuf.Lexing.lex_curr_pos <- _curr;
                                                                lexbuf.Lexing.lex_last_pos <- _last;
                                                                1 (* = last_action *)
                                                            end
                                                          | _ ->
                                                            let _curr = _last in
                                                            lexbuf.Lexing.lex_curr_pos <- _curr;
                                                            lexbuf.Lexing.lex_last_pos <- _last;
                                                            1 (* = last_action *)
                                                        end
                                                      | _ ->
                                                        let _curr = _last in
                                                        lexbuf.Lexing.lex_curr_pos <- _curr;
                                                        lexbuf.Lexing.lex_last_pos <- _last;
                                                        1 (* = last_action *)
                                                    end
                                                  | _ ->
                                                    let _curr = _last in
                                                    lexbuf.Lexing.lex_curr_pos <- _curr;
                                                    lexbuf.Lexing.lex_last_pos <- _last;
                                                    1 (* = last_action *)
                                                end
                                              | _ ->
                                                let _curr = _last in
                                                lexbuf.Lexing.lex_curr_pos <- _curr;
                                                lexbuf.Lexing.lex_last_pos <- _last;
                                                1 (* = last_action *)
                                            end
                                          | _ ->
                                            let _curr = _last in
                                            lexbuf.Lexing.lex_curr_pos <- _curr;
                                            lexbuf.Lexing.lex_last_pos <- _last;
                                            1 (* = last_action *)
                                        end
                                      | _ ->
                                        let _curr = _last in
                                        lexbuf.Lexing.lex_curr_pos <- _curr;
                                        lexbuf.Lexing.lex_last_pos <- _last;
                                        1 (* = last_action *)
                                    end
                                  | _ ->
                                    let _curr = _last in
                                    lexbuf.Lexing.lex_curr_pos <- _curr;
                                    lexbuf.Lexing.lex_last_pos <- _last;
                                    1 (* = last_action *)
                                end
                              | _ ->
                                let _curr = _last in
                                lexbuf.Lexing.lex_curr_pos <- _curr;
                                lexbuf.Lexing.lex_last_pos <- _last;
                                1 (* = last_action *)
                            end
                          | _ ->
                            let _curr = _last in
                            lexbuf.Lexing.lex_curr_pos <- _curr;
                            lexbuf.Lexing.lex_last_pos <- _last;
                            1 (* = last_action *)
                        end
                      | _ ->
                        let _curr = _last in
                        lexbuf.Lexing.lex_curr_pos <- _curr;
                        lexbuf.Lexing.lex_last_pos <- _last;
                        1 (* = last_action *)
                    end
                  | _ ->
                    let _curr = _last in
                    lexbuf.Lexing.lex_curr_pos <- _curr;
                    lexbuf.Lexing.lex_last_pos <- _last;
                    1 (* = last_action *)
                end
              | _ ->
                let _curr = _last in
                lexbuf.Lexing.lex_curr_pos <- _curr;
                lexbuf.Lexing.lex_last_pos <- _last;
                1 (* = last_action *)
            end
          | _ ->
            let _curr = _last in
            lexbuf.Lexing.lex_curr_pos <- _curr;
            lexbuf.Lexing.lex_last_pos <- _last;
            1 (* = last_action *)
        end
      | _ ->
        (* *)
        lexbuf.Lexing.lex_curr_pos <- _curr;
        lexbuf.Lexing.lex_last_pos <- _last;
        1
    end
  in
  begin
    let _curr_p = lexbuf.Lexing.lex_curr_p in
    if _curr_p != Lexing.dummy_pos then begin
      lexbuf.Lexing.lex_start_p <- _curr_p;
      lexbuf.Lexing.lex_curr_p <-
        {_curr_p with Lexing.pos_cnum =
         lexbuf.Lexing.lex_abs_pos+lexbuf.Lexing.lex_curr_pos}
    end
  end;
  match __ocaml_lex_result with
  | 0 ->
# 5 "parsing/ocamllex/case100/lexer.mll"
                        ( print_string (Sys.getcwd ()); translate lexbuf )
# 332 "bazel-out/darwin-fastbuild/bin/parsing/ocamllex/case100/lexer.ml"

  | 1 ->
let
# 6 "parsing/ocamllex/case100/lexer.mll"
         c
# 338 "bazel-out/darwin-fastbuild/bin/parsing/ocamllex/case100/lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 6 "parsing/ocamllex/case100/lexer.mll"
            ( print_char c; translate lexbuf )
# 342 "bazel-out/darwin-fastbuild/bin/parsing/ocamllex/case100/lexer.ml"

  | 2 ->
# 7 "parsing/ocamllex/case100/lexer.mll"
          ( exit 0 )
# 347 "bazel-out/darwin-fastbuild/bin/parsing/ocamllex/case100/lexer.ml"

  | _ -> raise (Failure "lexing: empty token")


;;

