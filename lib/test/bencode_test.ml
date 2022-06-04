(* let test_decode () = *)
(*   let expected = "BKiyb3usEE6nr1kwAP4UELUZmV4YzviKZxtq4m6kfNEHmdgEfFs" in *)
(*   let case = " " in *)
(*   Alcotest.(check string) "decode" expected (Bencode.decode case) *)

(* let test_encode () = *)
(*   let expected = "BKiyb3usEE6nr1kwAP4UELUZmV4YzviKZxtq4m6kfNEHmdgEfFs" in *)
(*   let case = "1231" in *)
(*   Alcotest.(check string) "encode" expected (Bencode.encode case) *)

let open_in name = open_in_gen [Open_rdonly; Open_text] 0 name

let test () =
  let ch = open_in "test.torrent" in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  let bencode = Bencode.decode s in
  let encoded = Bencode.encode bencode in
  Printf.printf "Encoded to: %d bytes\n" (String.length encoded);
  (* Alcotest.(check Bencode.t) "test" bencode (Bencode.decode encoded) *)
  if bencode = Bencode.decode encoded then
    print_endline "Pass"
  else
    Alcotest.fail "Fail"

let () =
  let open Alcotest in
  run "TzTool_tests"
    [
      ( "Bencode",
        [
          test_case "test" `Quick test
          (* test_case "encode" `Quick test_encode; *)
          (* test_case "decode" `Quick test_decode; *);
        ] );
    ]
