(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

open Types
open Helpers
open Writer

let main () =
	print_string "\n";
	Random.self_init ();
	let first_block = get_genesis in
		let bc = empty_blockchain first_block in  
		let rec create_blockchain l =
			match l with 
			| previous::c -> let content = mk_block_content "isd_groupe_4" [] previous (Random.bits ()) pow_challenge in 
							 let info = mk_block_info (previous.block_info.b_level + 1) (hash_string (block_content_to_string content)) in
							 let block = {block_info = info; block_ctt = content} in 
							  if sufficient_pow pow_challenge info.b_id then 
							 	begin 
							 		let block_content = block_content_to_string block.block_ctt in
								 	Format.printf "%s@." block_content;
								 	print_string "\n";
								 	write_block block block_content;
								 	create_blockchain (block::l)
								end
							else 
								begin
								 	create_blockchain l
								end
			| _ -> let content = mk_block_content "isd_groupe_4" [] first_block.g_block (Random.bits ()) pow_challenge in 
				   let info = mk_block_info (first_block.g_block.block_info.b_level + 1) (hash_string (block_content_to_string content)) in
				   let block = {block_info = info; block_ctt = content} in 
				   let block_content = block_content_to_string block.block_ctt in
				   		print_string (block_content_to_string block.block_ctt);
				   		print_string "\n\n";
				   		write_block block block_content;
				   		create_blockchain (block::l)
		in create_blockchain bc.db.blocks
 