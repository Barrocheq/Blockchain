(******************************************************************************)
(*     Copyright (C) OCamlPro SAS                                             *)
(******************************************************************************)

open Types
open Format

let block_reward = 10

let pow_challenge = 20

let hash_string s = Digest.string s |> Digest.to_hex

let hash_file s = Digest.file s |> Digest.to_hex

let sufficient_pow pow b_hash =
    let rec number_of_0 acc x =
        if acc < 1 then x else number_of_0 (acc-1) (x^"0")
    in 
    let s = number_of_0 (pow/4) "" in
    let sub = String.sub b_hash 0 (pow/4) in
        String.equal sub s

let blocks_dir wdir =
    wdir ^ "/foo/"
  
let transactions_dir wdir ~pending =
    (* TODO *)
    assert false

let accounts_dir wdir =
    (* TODO *)
    assert false

let empty_blockchain genesis = 
    let base = {
        blocks = [];
        trans = [];
        pending_trans = [];
        accounts = [] } 
    in {
        genesis = genesis;
        db = base;
        peers_db = Util.MS.empty
}

let mk_block_content b_miner b_transactions previous b_nonce b_pow = {
    b_previous = previous.block_info;
    b_miner = b_miner;
    b_pow = b_pow;
    b_date = Util.Date.now ();
    b_nonce = b_nonce;
    b_transactions = b_transactions
  }

let mk_block_info b_level b_id = {
  b_level = b_level;
  b_id = b_id
}

let block_content_to_string b_content =
  "previous " ^ (string_of_int b_content.b_previous.b_level) ^ "."  ^ b_content.b_previous.b_id ^
  "\nminer " ^ b_content.b_miner ^ 
  "\npow " ^ string_of_int b_content.b_pow ^
  "\ndate " ^ Util.Date.to_string b_content.b_date ^
  "\nnonce " ^ string_of_int b_content.b_nonce ^
  "\ntransaction" 

let info =  {
    b_level = 0;
    b_id = "-1.---" ;
}

let content = {
    b_previous = info;
    b_miner = "God";
    b_pow = 0;
    b_date = Util.Date.of_string "Mon-Jun-12--11:02:03--+00-2000";
    b_nonce = 0;
    b_transactions = []
  }

let block_genesis = {
  block_info = info;
  block_ctt = content
}

let get_genesis = {
  g_block = block_genesis;
  g_accounts = []
}



let check_chain_of_blocks b_list genesis =
  (* TODO *)
  assert false
