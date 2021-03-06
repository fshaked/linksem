chapter {* Generated by Lem from set_helpers.lem. *}

theory "Lem_set_helpers" 

imports 
 	 Main
	 "Lem_bool" 
	 "Lem_basic_classes" 
	 "Lem_maybe" 
	 "Lem_function" 
	 "Lem_num" 

begin 

(******************************************************************************)
(* Helper functions for sets                                                  *)
(******************************************************************************)

(* Usually there is a something.lem file containing the main definitions and a 
   something_extra.lem one containing functions that might cause problems for
   some backends or are just seldomly used.

   For sets the situation is different. folding is not well defined, since it
   is only sensibly defined for finite sets and the traversal 
   order is underspecified. *) 

(* ========================================================================== *)
(* Header                                                                     *)
(* ========================================================================== *)

(*open import Bool Basic_classes Maybe Function Num*) 

(*open import {coq} `Coq.Lists.List`*)

(* ------------------------ *)
(* fold                     *)
(* ------------------------ *)

(* fold is suspicious, because if given a function, for which
   the order, in which the arguments are given, matters, its
   results are undefined. On the other hand, it is very handy to
   define other - non suspicious functions. 

   Moreover, fold is central for OCaml, since it is used to
   compile set comprehensions *)

(*val fold : forall 'a 'b. ('a -> 'b -> 'b) -> set 'a -> 'b -> 'b*)


end
