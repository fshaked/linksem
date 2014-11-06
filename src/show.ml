(*Generated by Lem from show.lem.*)
(** [show.lem] exports the typeclass [Show] and associated functions for pretty
  * printing arbitrary values.
  *)

open Lem_function
open Lem_list
open Lem_maybe
open Lem_num
open Lem_string

open Missing_pervasives

type 'a show_class={
  show_method : 'a -> string
}

(** [string_of_bool b] produces a string representation of boolean [b].
  *)
(*val string_of_bool : bool -> string*)
let string_of_bool b =  
((match b with
    | true  -> "true"
    | false -> "false"
  ))

let instance_Show_Show_bool_dict =({

  show_method = string_of_bool})

let instance_Show_Show_string_dict =({

  show_method = id})

(** [string_of_pair p] produces a string representation of pair [p].
  *)
(*val string_of_pair : forall 'a 'b. Show 'a, Show 'b => ('a * 'b) -> string*)
let string_of_pair dict_Show_Show_a dict_Show_Show_b (left, right) =  
("(" ^ (dict_Show_Show_a.show_method left ^ (", " ^ (dict_Show_Show_b.show_method right ^ ")"))))

let instance_Show_Show_tup2_dict dict_Show_Show_a dict_Show_Show_b =({

  show_method = 
  (string_of_pair dict_Show_Show_a dict_Show_Show_b)})

(** [string_of_triple p] produces a string representation of triple [p].
  *)
(*val string_of_triple : forall 'a 'b 'c. Show 'a, Show 'b, Show 'c => ('a * 'b * 'c) -> string*)
let string_of_triple dict_Show_Show_a dict_Show_Show_b dict_Show_Show_c (left, middle, right) =  
("(" ^ (dict_Show_Show_a.show_method left ^ (", " ^ (dict_Show_Show_b.show_method middle ^ (", " ^ (dict_Show_Show_c.show_method right ^ ")"))))))

let instance_Show_Show_tup3_dict dict_Show_Show_a dict_Show_Show_b dict_Show_Show_c =({

  show_method = 
  (string_of_triple dict_Show_Show_a dict_Show_Show_b dict_Show_Show_c)})

(** [string_of_quad p] produces a string representation of quad [p].
  *)
(*val string_of_quad : forall 'a 'b 'c 'd. Show 'a, Show 'b, Show 'c, Show 'd => ('a * 'b * 'c * 'd) -> string*)
let string_of_quad dict_Show_Show_a dict_Show_Show_b dict_Show_Show_c dict_Show_Show_d (left, middle1, middle2, right) =  
("(" ^ (dict_Show_Show_a.show_method left ^ (", " ^ (dict_Show_Show_b.show_method middle1 ^ (", " ^ (dict_Show_Show_c.show_method middle2 ^ (", " ^ (dict_Show_Show_d.show_method right ^ ")"))))))))

let instance_Show_Show_tup4_dict dict_Show_Show_a dict_Show_Show_b dict_Show_Show_c dict_Show_Show_d =({

  show_method = 
  (string_of_quad dict_Show_Show_a dict_Show_Show_b dict_Show_Show_c
     dict_Show_Show_d)})

(** [string_of_list l] produces a string representation of list [l].
  *)
(*val string_of_list : forall 'a. Show 'a => list 'a -> string*)
let string_of_list dict_Show_Show_a l =  
(let result = (intercalate "," (List.map  
  dict_Show_Show_a.show_method l)) in
  let folded = (List.fold_right (^) result "") in
    "[" ^ (folded ^ "]"))

let instance_Show_Show_list_dict dict_Show_Show_a =({

  show_method = 
  (string_of_list dict_Show_Show_a)})

(*val string_of_maybe : forall 'a. Show 'a => maybe 'a -> string*)
let string_of_maybe dict_Show_Show_a m =  
((match m with
    | None -> "Nothing"
    | Some e  -> "Just " ^ 
  dict_Show_Show_a.show_method e
  ))

let instance_Show_Show_Maybe_maybe_dict dict_Show_Show_a =({

  show_method = 
  (string_of_maybe dict_Show_Show_a)})

let instance_Show_Show_nat_dict =({

  show_method = string_of_int})

let instance_Show_Show_Num_natural_dict =({

  show_method = Big_int.string_of_big_int})
