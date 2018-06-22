(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

open Format
open Types
open Helpers

let write_block b content =
  let filename = ("foo/blocks/" ^ string_of_int b.block_info.b_level) ^ ".bkc" in
  let oc = open_out filename in 
  	output_string oc content; 
  	close_out oc

let save_database db =
  (* TODO *)
  assert false