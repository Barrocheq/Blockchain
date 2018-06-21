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
		let bc = empty_blockchain first_block in 

		let rec create_blockchain l =
			match l with 
			| previous::c -> let content = mk_block_content "isd_groupe_4" [] previous 0 20 in 
							 let info = mk_block_info (previous.block_info.b_level + 1) (hash_string (block_content_to_string content)) in
							 let block = {block_info = info; block_ctt = content} in 
							 print_string (block_content_to_string block.block_ctt); 
							 create_blockchain (block::c)
			| _ -> let content = mk_block_content "isd_groupe_4" [] first_block.g_block 0 20 in 
				   let info = mk_block_info (first_block.g_block.block_info.b_level + 1) (hash_string (block_content_to_string content)) in
				   let block = {block_info = info; block_ctt = content} in 
				   		print_string (block_content_to_string block.block_ctt);
				   		create_blockchain (block::l)
		in create_blockchain bc.db.blocks
