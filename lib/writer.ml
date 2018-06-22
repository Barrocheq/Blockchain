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
  let rec save_block blocks = 
  	match blocks with 
  	| previous::c -> write_block previous (block_content_to_string previous.block_ctt);
  					 save_block c
  	| [] -> print_string "Blocks saved"
  in save_block db.blocks
  (* we didn't save transation, pending_trans and accounts *)