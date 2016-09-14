chapter {* Generated by Lem from abis/mips64/abi_mips64_section_header_table.lem. *}

theory "Abi_mips64_section_header_table" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_map" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_section_header_table" 

begin 

(** [abi_mips64_section_header_table] module contains section header table
  * specific definitions for the MIPS64 ABI.
  *)

(*open import Basic_classes*)
(*open import Map*)
(*open import Num*)

(*open import Elf_section_header_table*)

(** MIPS64 specific flags.  See Section XXX FIXME. *)

(** MIPS64 specific section types.  See Section XXX FIXME *)

(** [string_of_abi_mips64_section_type m] produces a string based representation
  * of MIPS64 section type [m].
  *)
(*val string_of_abi_mips64_section_type : natural -> string*)
    
(** Special sections *)

(*val abi_mips64_special_sections : Map.map string (natural * natural)*)
definition abi_amg64_special_sections0  :: "((string),(nat*nat))Map.map "  where 
     " abi_amg64_special_sections0 = (
  Map.map_of (List.rev [
    ((''.got''), (sht_progbits, (shf_alloc + shf_write)))
  , ((''.plt''), (sht_progbits, (shf_alloc + shf_execinstr)))
  (* FIXME ; (.eh_frame, (sht_abi_mips64_unwind, shf_alloc)) *)
  ]))"

  
(*val abi_mips64_special_sections_large_code_model : Map.map string (natural * natural)*)
definition abi_mips64_special_sections_large_code_model  :: "((string),(nat*nat))Map.map "  where 
     " abi_mips64_special_sections_large_code_model = (
  Map.map_of (List.rev [
    (* FIXME *)
  ]))"

end