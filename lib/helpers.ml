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
  (* TODO *)
  assert false

let blocks_dir wdir =
  (* TODO *)
  assert false

let transactions_dir wdir ~pending =
  (* TODO *)
  assert false

let accounts_dir wdir =
  (* TODO *)
  assert false

let empty_blockchain genesis =
  (* TODO *)
  assert false

let mk_block_content b_miner b_transactions previous b_nonce b_pow =
  (* TODO *)
  assert false

let block_content_to_string b_content =
  (* TODO *)
  assert false

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
