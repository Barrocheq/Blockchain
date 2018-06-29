(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

open Types
open Format
open Options

type database = {
  blocks : block list;
  trans : transaction list;
  pending_trans : transaction list;
  accounts : account list;
}

let forge_block2 miner_id tr_list previous_block nonce pow date = 
	let bc = mk_block_content miner_id tr_list previous_block nonce pow in 
		let bi = mk_block_info (bc.b_previous.b_level+1) (hash_string (block_content_to_string bc)) in
			{block_info = bi; block_ctt = bc} 


let rec build_block_list wdir file =
	if no_next_file 
		then 
			begin
				open_in file;
				let previous = String.sub (input_line file) 9 ((String.legnth (input_line file))-9);
				let miner = String.sub (input_line file) 6 ((String.legnth (input_line file))-6);
				let pow = String.sub (input_line file) 4 ((String.legnth (input_line file))-4);
				let date = String.sub (input_line file) 5 ((String.legnth (input_line file))-5);
				let nonce = String.sub (input_line file) 6 ((String.legnth (input_line file))-6);
				let trans = String.sub (input_line file) 13 ((String.legnth (input_line file))-13) in
					 
			end
		else
			build_block_list next_file

let load_database wdir =
	let block_list = build_block_list wdir "1.bkc" in
		let load_db = 
			{
				blocks = block_list;
				trans = [];
				pending_trans = [];
				accounts []
			}

	let file = "1.bkc"
		let ic = open_in file in
			let line = input_line ic in  (* read line from in_channel and discard \n *)
				print_endline line;          (* write the result to stdout *)
				flush stdout;                (* write on the underlying device now *)
				close_in ic                  (* close the input channel *)
