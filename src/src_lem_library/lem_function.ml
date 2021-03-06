(*Generated by Lem from function.lem.*)
(******************************************************************************)
(* A library for common operations on functions                               *)
(******************************************************************************)

open Lem_bool
open Lem_basic_classes

(* ----------------------- *)
(* identity function       *)
(* ----------------------- *)

(*val id : forall 'a. 'a -> 'a*)
let id x = x


(* ----------------------- *)
(* constant function       *)
(* ----------------------- *)

(*val const : forall 'a 'b. 'a -> 'b -> 'a*)


(* ----------------------- *)
(* function composition    *)
(* ----------------------- *)

(*val comb : forall 'a 'b 'c. ('b -> 'c) -> ('a -> 'b) -> ('a -> 'c)*)
let comb f g = (fun x -> f (g x))


(* ----------------------- *)
(* function application    *)
(* ----------------------- *)

(*val $ [apply] : forall 'a 'b. ('a -> 'b) -> ('a -> 'b)*)
(*let $ f = (fun x -> f x)*)

(* ----------------------- *)
(* flipping argument order *)
(* ----------------------- *)

(*val flip : forall 'a 'b 'c. ('a -> 'b -> 'c) -> ('b -> 'a -> 'c)*)
let flip f = (fun x y -> f y x)


(* currying / uncurrying *)

(*val curry : forall 'a 'b 'c. (('a * 'b) -> 'c) -> 'a -> 'b -> 'c*)
let curry f = (fun a b -> f (a, b))

(*val uncurry : forall 'a 'b 'c. ('a -> 'b -> 'c) -> ('a * 'b -> 'c)*)
let uncurry f (a,b) = (f a b)
