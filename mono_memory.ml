(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

(* on creer un genesis, et apres une creer une loop pour faire les autres blocks *)

open Types
open Helpers

let forge_block miner_id tr_list previous_block nonce pow = 
	let bc = mk_block_content miner_id tr_list previous_block nonce pow in 
		let bi = mk_block_info (bc.b_previous.b_level+1) (hash_string (block_content_to_string bc)) in
			{block_info = bi; block_ctt = bc} 

let main () = 
	Random.self_init ();
	let genesis = get_genesis in
		let bchain = empty_blockchain genesis in

			let rec fill_blockchain blocklist = 
				match blocklist with 
					| [] -> (* La liste de blocs est vide donc il faut forger le premier bloc a partir de genesis*)
									let fb = forge_block "isd_groupe_4" [] genesis.g_block (Random.bits ()) pow_challenge in
										if sufficient_pow pow_challenge (hash_string (block_content_to_string fb.block_ctt)) 
										then begin
											Format.printf "%s@." (block_content_to_string fb.block_ctt);
								 			print_string "\n";
								 			fill_blockchain (fb :: []) end
								 		else 
								 			fill_blockchain blocklist;
					| bk::tail ->  
										let fb = forge_block "isd_groupe_4" [] bk (Random.bits ()) pow_challenge in
										if sufficient_pow pow_challenge (hash_string (block_content_to_string fb.block_ctt)) 
										then begin
											Format.printf "%s@." (block_content_to_string fb.block_ctt);
								 			print_string "\n";
								 			fill_blockchain (fb :: blocklist) end
								 		else 
								 			fill_blockchain blocklist;
			in fill_blockchain bchain.db.blocks
