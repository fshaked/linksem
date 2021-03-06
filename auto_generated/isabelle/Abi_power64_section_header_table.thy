chapter {* Generated by Lem from abis/power64/abi_power64_section_header_table.lem. *}

theory "Abi_power64_section_header_table" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_map" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_section_header_table" 

begin 

(** [abi_power64_section_header_table] contains Power64 ABI specific definitions
  * related to the section header table.
  *)

(*open import Map*)
(*open import Num*)

(*open import Elf_section_header_table*)

(** Special sections. *)

(** See Section 4.2 *)

(*val abi_power64_special_sections : Map.map string (natural * natural)*)
definition abi_power64_special_sections  :: "((string),(nat*nat))Map.map "  where 
     " abi_power64_special_sections = (
  Map.map_of (List.rev [
    ((''.glink''), (sht_progbits, (shf_alloc + shf_execinstr)))
  , ((''.got''), (sht_progbits, (shf_alloc + shf_write)))
  , ((''.toc''), (sht_progbits, (shf_alloc + shf_write)))
  , ((''.tocbss''), (sht_nobits, (shf_alloc + shf_write)))
  , ((''.plt''), (sht_nobits, (shf_alloc + shf_write)))
  ]))"

end
