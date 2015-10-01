chapter {* Generated by Lem from abis/abi_utilities.lem. *}

theory "Abi_utilities" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_maybe" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Error" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_map" 

begin 

(** [abi_utilities], generic utilities shared between all ABIs.
  *)

(*open import Map*)
(*open import Maybe*)
(*open import Num*)

(*open import Error*)

(** [integer_bit_width] records various bit widths for integral types, as used
  * in relocation calculations. The names are taken directly from the processor
  * supplements to keep the calculations as close as possible
  * to the specification of relocations.
  *)
datatype integer_bit_width
  = I8        (** Signed 8 bit *)
  | I12
  | U12       (** Unsigned 12 bit *)
  | Low14
  | U15       (** Unsigned 15 bit *)
  | I15
  | I16       (** Signed 16 bit *)
  | Half16ds
  | I20       (** Signed 20 bit *)
  | Low24
  | I27
  | Word30
  | I32       (** Signed 32 bit *)
  | I48       (** Signed 48 bit *)
  | I64       (** Signed 64 bit *)
  | I64X2     (** Signed 128 bit *)
  | U16       (** Unsigned 16 bit *)
  | U24       (** Unsigned 24 bit *)
  | U32       (** Unsigned 32 bit *)
  | U48       (** Unsigned 48 bit *)
  | U64       (** Unsigned 64 bit *)
  
(** [natural_of_integer_bit_width i] computes the bit width of integer bit width
  * [i].
  *)
(*val natural_of_integer_bit_width : integer_bit_width -> natural*)
fun natural_of_integer_bit_width  :: " integer_bit_width \<Rightarrow> nat "  where 
     " natural_of_integer_bit_width I8 = (( 8 :: nat))"
|" natural_of_integer_bit_width I12 = (( 12 :: nat))"
|" natural_of_integer_bit_width U12 = (( 12 :: nat))"
|" natural_of_integer_bit_width Low14 = (( 14 :: nat))"
|" natural_of_integer_bit_width I15 = (( 15 :: nat))"
|" natural_of_integer_bit_width U15 = (( 15 :: nat))"
|" natural_of_integer_bit_width I16 = (( 16 :: nat))"
|" natural_of_integer_bit_width Half16ds = (( 16 :: nat))"
|" natural_of_integer_bit_width U16 = (( 16 :: nat))"
|" natural_of_integer_bit_width I20 = (( 20 :: nat))"
|" natural_of_integer_bit_width Low24 = (( 24 :: nat))"
|" natural_of_integer_bit_width U24 = (( 24 :: nat))"
|" natural_of_integer_bit_width I27 = (( 27 :: nat))"
|" natural_of_integer_bit_width Word30 = (( 30 :: nat))"
|" natural_of_integer_bit_width I32 = (( 32 :: nat))"
|" natural_of_integer_bit_width U32 = (( 32 :: nat))"
|" natural_of_integer_bit_width I48 = (( 48 :: nat))"
|" natural_of_integer_bit_width U48 = (( 48 :: nat))"
|" natural_of_integer_bit_width I64 = (( 64 :: nat))"
|" natural_of_integer_bit_width U64 = (( 64 :: nat))"
|" natural_of_integer_bit_width I64X2 = (( 128 :: nat))" 
declare natural_of_integer_bit_width.simps [simp del]

  
(** [relocation_operator] records the operators used to calculate relocations by
  * the various ABIs.  Each ABI will only use a subset of these, and they should
  * be interpreted on a per-ABI basis.  As more ABIs are added, more operators
  * will be needed, and therefore more constructors in this type will need to
  * be added.  These are unary operators, operating on a single integral type.
  *)
datatype relocation_operator
  = TPRel
  | LTOff
  | DTPMod
  | DTPRel
  | Page
  | GDat
  | G
  | GLDM
  | GTPRel
  | GTLSDesc
  | Delta
  | LDM
  | TLSDesc
  | Indirect
  | Lo
  | Hi
  | Ha
  | Higher
  | HigherA
  | Highest
  | HighestA
  
(** [relocation_operator2] is a binary relocation operator, as detailed above.
  *)
datatype relocation_operator2 =
    GTLSIdx
  
(** Generalising and abstracting over relocation calculations and their return
  * types
  *)
  
type_synonym( 'k, 'v) val_map =" ('k, 'v)
  Map.map "

(*val lookupM : forall 'k 'v. MapKeyType 'k => 'k -> val_map 'k 'v -> error 'v*)
definition lookupM  :: " 'k \<Rightarrow>('k,'v)Map.map \<Rightarrow> 'v error "  where 
     " lookupM key val_map = (
  (case   val_map key of
      None => error_fail (''lookupM: key not found in val_map'')
    | Some j  => error_return j
  ))"

  
(** Some relocations may fail, for example:
  * Page 58, Power ABI: relocation types whose Field column is marked with an
  * asterisk are subject to failure is the value computed does not fit in the
  * allocated bits.  [can_fail] type passes this information back to the caller
  * of the relocation application function.
  *)
datatype 'a can_fail
  = CanFail                       (** [CanFail] signals a potential failing relocation calculation when width constraints are invalidated *)
  | CanFailOnTest " ('a \<Rightarrow> bool)" (** [CanFailOnTest p] signals a potentially failing relocation calculation when predicate [p] on the result of the calculation returns [false] *)
  | CannotFail                    (** [CannotFail] states the relocation calculation cannot fail and bit-width constraints should be ignored *)
  
(** [relocation_operator_expression] is an AST of expressions describing a relocation
  * calculation.  An AST is used as it allows us to unify the treatment of relocation
  * calculation: rather than passing in dozens of functions to the calculation function
  * that perform the actual relocation, we can simply return a description (in the form
  * of the AST below) of the calculation to be carried out and have it interpreted
  * separately from the function that produces it.  The type parameter 'a is the
  * type of base integral type.  This AST suffices for the relocation calculations we
  * currently have implemented, but adding more ABIs may require that this type is
  * expanded.
  *)
datatype 'a relocation_operator_expression
  = Lift   " 'a "                                                                                             (** Lift a base type into an AST *)
  | Apply  " (relocation_operator * 'a relocation_operator_expression)"                                      (** Apply a unary operator to an expression *)
  | Apply2 " (relocation_operator2 * 'a relocation_operator_expression * 'a relocation_operator_expression)" (** Apply a binary operator to two expressions *)
  | Plus   " ( 'a relocation_operator_expression * 'a relocation_operator_expression)"                        (** Add two expressions. *)
  | Minus  " ( 'a relocation_operator_expression * 'a relocation_operator_expression)"                        (** Subtract two expressions. *)
  | RShift " ( 'a relocation_operator_expression * nat)"                                                  (** Right shift the result of an expression [m] places. *)
  
  datatype( 'addr, 'res) relocation_frame =
    Copy
  | NoCopy " ( ('addr, ( 'res relocation_operator_expression * integer_bit_width * 'res can_fail))Map.map)"
end