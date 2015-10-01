chapter {* Generated by Lem from abis/amd64/abi_amd64_relocation.lem. *}

theory "Abi_amd64_relocation" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_maybe" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_string" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Missing_pervasives" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Error" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_types_native_uint" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_header" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_map" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_symbol_table" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_file" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_relocation" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_utilities" 

begin 

(** [abi_amd64_relocation] contains types and definitions relating to ABI
  * specific relocation functionality for the AMD64 ABI.
  *)

(*open import Basic_classes*)
(*open import Map*)
(*open import Maybe*)
(*open import Num*)
(*open import String*)

(*open import Error*)
(*open import Missing_pervasives*)

(*open import Elf_types_native_uint*)
(*open import Elf_file*)
(*open import Elf_header*)
(*open import Elf_relocation*)
(*open import Elf_symbol_table*)

(*open import Abi_utilities*)

(** x86-64 relocation types. *)

definition r_x86_64_none  :: " nat "  where 
     " r_x86_64_none = (( 0 :: nat))"

definition r_x86_64_64  :: " nat "  where 
     " r_x86_64_64 = (( 1 :: nat))"

definition r_x86_64_pc32  :: " nat "  where 
     " r_x86_64_pc32 = (( 2 :: nat))"

definition r_x86_64_got32  :: " nat "  where 
     " r_x86_64_got32 = (( 3 :: nat))"

definition r_x86_64_plt32  :: " nat "  where 
     " r_x86_64_plt32 = (( 4 :: nat))"

definition r_x86_64_copy  :: " nat "  where 
     " r_x86_64_copy = (( 5 :: nat))"

definition r_x86_64_glob_dat  :: " nat "  where 
     " r_x86_64_glob_dat = (( 6 :: nat))"

definition r_x86_64_jump_slot  :: " nat "  where 
     " r_x86_64_jump_slot = (( 7 :: nat))"

definition r_x86_64_relative  :: " nat "  where 
     " r_x86_64_relative = (( 8 :: nat))"

definition r_x86_64_gotpcrel  :: " nat "  where 
     " r_x86_64_gotpcrel = (( 9 :: nat))"

definition r_x86_64_32  :: " nat "  where 
     " r_x86_64_32 = (( 10 :: nat))"

definition r_x86_64_32s  :: " nat "  where 
     " r_x86_64_32s = (( 11 :: nat))"

definition r_x86_64_16  :: " nat "  where 
     " r_x86_64_16 = (( 12 :: nat))"

definition r_x86_64_pc16  :: " nat "  where 
     " r_x86_64_pc16 = (( 13 :: nat))"

definition r_x86_64_8  :: " nat "  where 
     " r_x86_64_8 = (( 14 :: nat))"

definition r_x86_64_pc8  :: " nat "  where 
     " r_x86_64_pc8 = (( 15 :: nat))"

definition r_x86_64_dtpmod64  :: " nat "  where 
     " r_x86_64_dtpmod64 = (( 16 :: nat))"

definition r_x86_64_dtpoff64  :: " nat "  where 
     " r_x86_64_dtpoff64 = (( 17 :: nat))"

definition r_x86_64_tpoff64  :: " nat "  where 
     " r_x86_64_tpoff64 = (( 18 :: nat))"

definition r_x86_64_tlsgd  :: " nat "  where 
     " r_x86_64_tlsgd = (( 19 :: nat))"

definition r_x86_64_tlsld  :: " nat "  where 
     " r_x86_64_tlsld = (( 20 :: nat))"

definition r_x86_64_dtpoff32  :: " nat "  where 
     " r_x86_64_dtpoff32 = (( 21 :: nat))"

definition r_x86_64_gottpoff  :: " nat "  where 
     " r_x86_64_gottpoff = (( 22 :: nat))"

definition r_x86_64_tpoff32  :: " nat "  where 
     " r_x86_64_tpoff32 = (( 23 :: nat))"

definition r_x86_64_pc64  :: " nat "  where 
     " r_x86_64_pc64 = (( 24 :: nat))"

definition r_x86_64_gotoff64  :: " nat "  where 
     " r_x86_64_gotoff64 = (( 25 :: nat))"

definition r_x86_64_gotpc32  :: " nat "  where 
     " r_x86_64_gotpc32 = (( 26 :: nat))"

definition r_x86_64_size32  :: " nat "  where 
     " r_x86_64_size32 = (( 32 :: nat))"

definition r_x86_64_size64  :: " nat "  where 
     " r_x86_64_size64 = (( 33 :: nat))"

definition r_x86_64_gotpc32_tlsdesc  :: " nat "  where 
     " r_x86_64_gotpc32_tlsdesc = (( 34 :: nat))"

definition r_x86_64_tlsdesc_call  :: " nat "  where 
     " r_x86_64_tlsdesc_call = (( 35 :: nat))"

definition r_x86_64_tlsdesc  :: " nat "  where 
     " r_x86_64_tlsdesc = (( 36 :: nat))"

definition r_x86_64_irelative  :: " nat "  where 
     " r_x86_64_irelative = (( 37 :: nat))"


(** [string_of_x86_64_relocation_type m] produces a string representation of the
  * relocation type [m].
  *)
(*val string_of_amd64_relocation_type : natural -> string*)
definition string_of_amd64_relocation_type  :: " nat \<Rightarrow> string "  where 
     " string_of_amd64_relocation_type rel_type = (
  if rel_type = r_x86_64_none then
    (''R_X86_64_NONE'')
  else if rel_type = r_x86_64_64 then
    (''R_X86_64_64'')
  else if rel_type = r_x86_64_pc32 then
    (''R_X86_64_PC32'')
  else if rel_type = r_x86_64_got32 then
    (''R_X86_64_GOT32'')
  else if rel_type = r_x86_64_plt32 then
    (''R_X86_64_PLT32'')
  else if rel_type = r_x86_64_copy then
    (''R_X86_64_COPY'')
  else if rel_type = r_x86_64_glob_dat then
    (''R_X86_64_GLOB_DAT'')
  else if rel_type = r_x86_64_jump_slot then
    (''R_X86_64_JUMP_SLOT'')
  else if rel_type = r_x86_64_relative then
    (''R_X86_64_RELATIVE'')
  else if rel_type = r_x86_64_gotpcrel then
    (''R_X86_64_GOTPCREL'')
  else if rel_type = r_x86_64_32 then
    (''R_X86_64_32'')
  else if rel_type = r_x86_64_32s then
    (''R_X86_64_32S'')
  else if rel_type = r_x86_64_16 then
    (''R_X86_64_16'')
  else if rel_type = r_x86_64_pc16 then
    (''R_X86_64_PC16'')
  else if rel_type = r_x86_64_8 then
    (''R_X86_64_8'')
  else if rel_type = r_x86_64_pc8 then
    (''R_X86_64_PC8'')
  else if rel_type = r_x86_64_dtpmod64 then
    (''R_X86_64_DTPMOD64'')
  else if rel_type = r_x86_64_dtpoff64 then
    (''R_X86_64_DTPOFF64'')
  else if rel_type = r_x86_64_tpoff64 then
    (''R_X86_64_TPOFF64'')
  else if rel_type = r_x86_64_tlsgd then
    (''R_X86_64_TLSGD'')
  else if rel_type = r_x86_64_tlsld then
    (''R_X86_64_TLSLD'')
  else if rel_type = r_x86_64_dtpoff32 then
    (''R_X86_64_DTPOFF32'')
  else if rel_type = r_x86_64_gottpoff then
    (''R_X86_64_GOTTPOFF'')
  else if rel_type = r_x86_64_tpoff32 then
    (''R_X86_64_TPOFF32'')
  else if rel_type = r_x86_64_pc64 then
    (''R_X86_64_PC64'')
  else if rel_type = r_x86_64_gotoff64 then
    (''R_X86_64_GOTOFF64'')
  else if rel_type = r_x86_64_gotpc32 then
    (''R_X86_64_GOTPC32'')
  else if rel_type = r_x86_64_size32 then
    (''R_X86_64_SIZE32'')
  else if rel_type = r_x86_64_size64 then
    (''R_X86_64_SIZE64'')
  else if rel_type = r_x86_64_gotpc32_tlsdesc then
    (''R_X86_64_GOTPC32_TLSDESC'')
  else if rel_type = r_x86_64_tlsdesc_call then
    (''R_X86_64_TLSDESC_CALL'')
  else if rel_type = r_x86_64_tlsdesc then
    (''R_X86_64_TLSDESC'')
  else if rel_type = r_x86_64_irelative then
    (''R_X86_64_IRELATIVE'')
  else
    (''Invalid X86_64 relocation''))"


(** [width_of_x86_64_relocation m s] yields the width in bytes of the relocatable field, 
  * when resolving to a defined maybe symbol [s] (or Nothing, if weak).
  *)
(*val width_of_x86_64_relocation : natural -> maybe elf64_symbol_table_entry -> natural*)
definition width_of_x86_64_relocation  :: " nat \<Rightarrow>(elf64_symbol_table_entry)option \<Rightarrow> nat "  where 
     " width_of_x86_64_relocation rel_type s = (
  if rel_type = r_x86_64_none then( 0 :: nat)
  else if rel_type = r_x86_64_64 then( 8 :: nat)
  else if rel_type = r_x86_64_pc32 then( 4 :: nat)
  else if rel_type = r_x86_64_got32 then( 4 :: nat)
  else if rel_type = r_x86_64_plt32 then( 4 :: nat)
  else if rel_type = r_x86_64_copy then (case  s of None =>( 0 :: nat) | Some s => unat(elf64_st_size   s) )
  else if rel_type = r_x86_64_glob_dat then (case  s of None =>( 0 :: nat) | Some s => unat(elf64_st_size   s) ) (* CHECK *)
  else if rel_type = r_x86_64_jump_slot then( 4 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_relative then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_gotpcrel then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_32 then( 4 :: nat)
  else if rel_type = r_x86_64_32s then( 4 :: nat)
  else if rel_type = r_x86_64_16 then( 2 :: nat)
  else if rel_type = r_x86_64_pc16 then( 2 :: nat)
  else if rel_type = r_x86_64_8 then( 1 :: nat)
  else if rel_type = r_x86_64_pc8 then( 1 :: nat)
  else if rel_type = r_x86_64_dtpmod64 then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_dtpoff64 then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_tpoff64 then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_tlsgd then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_tlsld then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_dtpoff32 then( 4 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_gottpoff then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_tpoff32 then( 4 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_pc64 then( 8 :: nat)
  else if rel_type = r_x86_64_gotoff64 then( 8 :: nat)
  else if rel_type = r_x86_64_gotpc32 then( 4 :: nat)
  else if rel_type = r_x86_64_size32 then( 4 :: nat)
  else if rel_type = r_x86_64_size64 then( 8 :: nat)
  else if rel_type = r_x86_64_gotpc32_tlsdesc then( 4 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_tlsdesc_call then( 4 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_tlsdesc then( 8 :: nat) (* CHECK *)
  else if rel_type = r_x86_64_irelative then( 8 :: nat) (* CHECK *)
  else( 0 :: nat))"
 (* invalid *)

(** [abi_amd64_apply_relocation rel val_map ef]
  * calculates the effect of a relocation of type [rel] using relevant addresses,
  * offsets and fields represented by [b_val], [g_val], [got_val], [l_val], [p_val],
  * [s_val] and [z_val], stored in [val_map] with B, G, and so on as string
  * keys, which are:
  *
  *    - B  : Base address at which a shared-object has been loaded into memory
  *           during execution.
  *    - G  : Represents the offset into the GOT at which the relocation's entry
  *           will reside during execution.
  *    - GOT: Address of the GOT.
  *    - L  : Represents the address or offset of the PLT entry for a symbol.
  *    - P  : Represents the address or offset of the storage unit being
  *           relocated.
  *    - S  : Represents the value of the symbol whose index resides in the
  *           relocation entry.
  *    - Z  : Represents the size of the symbol whose index resides in the
  *           relocation entry.
  *
  * More details of the above can be found in the AMD64 ABI document's chapter
  * on relocations.
  *
  * The [abi_amd64_apply_relocation] function returns a relocation frame, either
  * indicating that the relocation is a copy relocation, or that some calculation
  * must be carried out at a certain location.  See the comment above the
  * [relocation_frame] type in [Abi_utilities.lem] for more details.
  *)
(*val abi_amd64_apply_relocation : elf64_relocation_a -> val_map string integer -> elf64_file
  -> error (relocation_frame elf64_addr integer)*)
definition abi_amd64_apply_relocation  :: " elf64_relocation_a \<Rightarrow>((string),(int))Map.map \<Rightarrow> elf64_file \<Rightarrow>(((Elf_Types_Local.uint64),(int))relocation_frame)error "  where 
     " abi_amd64_apply_relocation rel val_map ef = (
  if is_elf64_relocatable_file(elf64_file_header   ef) then
    (let rel_type = (elf64_relocation_r_type(elf64_ra_info   rel)) in
    (let a_val    = (sint(elf64_ra_addend   rel)) in
      (** No width, No calculation *)
      if rel_type = r_x86_64_none then
        error_return (NoCopy (Map.empty))
      (** Width: 64 Calculation: S + A *)
      else if rel_type = r_x86_64_64 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift (s_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty)))))
      (** Width: 32 Calculation: S + A - P *)
      else if rel_type = r_x86_64_pc32 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
        lookupM (''P'') val_map >>= (\<lambda> p_val . 
      	(let result = (Lift ((s_val + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty))))))
      (** Width: 32 Calculation: G + A *)
  		else if rel_type = r_x86_64_got32 then
  		  lookupM (''G'') val_map >>= (\<lambda> g_val . 
      	(let result = (Lift (g_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty)))))
      (** Width: 32 Calculation: L + A - P *)
  		else if rel_type = r_x86_64_plt32 then
  		  lookupM (''L'') val_map >>= (\<lambda> l_val . 
  		  lookupM (''P'') val_map >>= (\<lambda> p_val . 
  		  (let result = (Lift ((l_val + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty))))))
    	(** No width, No calculation *)
		  else if rel_type = r_x86_64_copy then
		    error_return Copy
		  (** Width: 64 Calculation: S *)
		  else if rel_type = r_x86_64_glob_dat then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift s_val) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty)))))
		  (** Width: 64 Calculation: S *)
		  else if rel_type = r_x86_64_jump_slot then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift s_val) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty)))))
		  (** Width: 64 Calculation: B + A *)
		  else if rel_type = r_x86_64_relative then
        lookupM (''B'') val_map >>= (\<lambda> b_val . 
      	(let result = (Lift (b_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty)))))
		  (** Width: 32 Calculation: G + GOT + A - P *)
		  else if rel_type = r_x86_64_gotpcrel then
        lookupM (''G'') val_map >>= (\<lambda> g_val . 
        lookupM (''GOT'') val_map >>= (\<lambda> got_val . 
        lookupM (''P'') val_map >>= (\<lambda> p_val . 
      	(let result = (Lift (((g_val + got_val) + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty)))))))
		  (** Width: 32 Calculation: S + A *)
		  else if rel_type = r_x86_64_32 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift (s_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty)))))
		  (** Width: 32 Calculation: S + A *)
		  else if rel_type = r_x86_64_32s then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift (s_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty)))))
		  (** Width: 16 Calculation: S + A *)
		  else if rel_type = r_x86_64_16 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift (s_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I16, CanFail) Map.empty)))))
		  (** Width: 16 Calculation: S + A - P *)
		  else if rel_type = r_x86_64_pc16 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
        lookupM (''P'') val_map >>= (\<lambda> p_val . 
      	(let result = (Lift ((s_val + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I16, CanFail) Map.empty))))))
		  (** Width: 8 Calculation: S + A *)
		  else if rel_type = r_x86_64_8 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
      	(let result = (Lift (s_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I8, CanFail) Map.empty)))))
      (** Width 8: Calculation: S + A - P *)
		  else if rel_type = r_x86_64_pc8 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
        lookupM (''P'') val_map >>= (\<lambda> p_val . 
      	(let result = (Lift ((s_val + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I8, CanFail) Map.empty))))))
      (** Width: 64 *)
		  else if rel_type = r_x86_64_dtpmod64 then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_dtpmod64 not implemented'')
      (** Width: 64 *)
		  else if rel_type = r_x86_64_dtpoff64 then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_dtpoff64 not implemented'')
      (** Width: 64 *)
		  else if rel_type = r_x86_64_tpoff64 then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_tpoff64 not implemented'')
      (** Width: 32 *)
		  else if rel_type = r_x86_64_tlsgd then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_tlsgd not implemented'')
      (** Width: 32 *)
		  else if rel_type = r_x86_64_tlsld then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_tlsld not implemented'')
      (** Width: 32 *)
		  else if rel_type = r_x86_64_dtpoff32 then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_dtpoff32 not implemented'')
      (** Width: 32 *)
		  else if rel_type = r_x86_64_gottpoff then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_gottpoff not implemented'')
      (** Width: 32 *)
		  else if rel_type = r_x86_64_tpoff32 then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_tpoff32 not implemented'')
		  (** Width: 64 Calculation: S + A - P *)
		  else if rel_type = r_x86_64_pc64 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
        lookupM (''P'') val_map >>= (\<lambda> p_val . 
      	(let result = (Lift ((s_val + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty))))))
		  (** Width: 64 Calculation: S + A - GOT *)
		  else if rel_type = r_x86_64_gotoff64 then
        lookupM (''S'') val_map >>= (\<lambda> s_val . 
        lookupM (''GOT'') val_map >>= (\<lambda> got_val . 
      	(let result = (Lift ((s_val + a_val) - got_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty))))))
		  (** Width: 32 Calculation: GOT + A - P *)
		  else if rel_type = r_x86_64_gotpc32 then
        lookupM (''GOT'') val_map >>= (\<lambda> got_val . 
        lookupM (''P'') val_map >>= (\<lambda> p_val . 
      	(let result = (Lift ((got_val + a_val) - p_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty))))))
		  (** Width: 32 Calculation: Z + A *)
		  else if rel_type = r_x86_64_size32 then
        lookupM (''Z'') val_map >>= (\<lambda> z_val . 
      	(let result = (Lift (z_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I32, CanFail) Map.empty)))))
		  (** Width: 64 Calculation: Z + A *)
		  else if rel_type = r_x86_64_size64 then
        lookupM (''Z'') val_map >>= (\<lambda> z_val . 
      	(let result = (Lift (z_val + a_val)) in
      	(let addr   = ((elf64_ra_offset   rel)) in
      		error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty)))))
      (** Width: 32 *)
		  else if rel_type = r_x86_64_gotpc32_tlsdesc then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_gotpc32_tlsdesc not implemented'')
      (** No width *)
		  else if rel_type = r_x86_64_tlsdesc_call then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_tlsdesc_call not implemented'')
		  (** Width: 64X2 *)
		  else if rel_type = r_x86_64_tlsdesc then
		    error_fail (''abi_amd64_apply_relocation: r_x86_64_tlsdesc not implemented'')
		  (** Calculation: indirect(B + A) *)
		  else if rel_type = r_x86_64_irelative then
        lookupM (''B'') val_map >>= (\<lambda> b_val . 
		    (let result = (Apply(Indirect, Lift(b_val + a_val))) in
		    (let addr   = ((elf64_ra_offset   rel)) in
		      error_return (NoCopy (map_update addr (result, I64, CannotFail) Map.empty)))))
		  else
		  	error_fail (''abi_amd64_apply_relocation: invalid relocation type'')))
  else
  	error_fail (''abi_amd64_apply_relocation: not a relocatable file''))"

end