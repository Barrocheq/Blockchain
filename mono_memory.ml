(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

(* on creer un genesis, et apres une creer une loop pour faire les autres blocks

list = empty_blockchain get_genesis
while true do
  new block in 
    list::block

*)

open Types
open Helpers

let main () =
	let first_block = get_genesis in
		print_string (block_content_to_string get_genesis.g_block.block_ctt)
