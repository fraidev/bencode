include Tree

module Str_conv = struct
  open Printf
  let of_int i = sprintf "i%Lde" i
  let of_string s = sprintf "%d:%s" (String.length s) s
  let of_list ?(c = 'l') s ~f =
    let buf = Buffer.create 10 in
    Buffer.add_char buf c;
    s |> List.iter (fun x -> Buffer.add_string buf (f x));
    Buffer.add_char buf 'e';
    Buffer.contents buf
  let of_dict s ~f =
    of_list ~c:'d'
      (List.sort (fun x y -> compare (fst x) (fst y)) s)
      ~f:(fun (s, e) -> of_string s ^ f e)
end

let rec encode t =
  let open Str_conv in
  match t with
  | Integer x -> of_int x
  | String s -> of_string s
  | List l -> of_list l ~f:encode
  | Dict d -> of_dict d ~f:encode

let decode s = Parser.bencode Lexer.bencode (Lexing.from_string s)
