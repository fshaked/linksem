header{*Generated by Lem from elf_section_header_table.lem.*}

theory "Elf_section_header_tableAuxiliary" 

imports 
 	 Main "~~/src/HOL/Library/Code_Target_Numeral"
	 "Lem_basic_classes" 
	 "Lem_bool" 
	 "Lem_function" 
	 "Lem_list" 
	 "Lem_maybe" 
	 "Lem_num" 
	 "Lem_string" 
	 "Elf_types" 
	 "Endianness" 
	 "String_table" 
	 "Byte_sequence" 
	 "Error" 
	 "Missing_pervasives" 
	 "Show" 
	 "Elf_section_header_table" 

begin 


(****************************************************)
(*                                                  *)
(* Termination Proofs                               *)
(*                                                  *)
(****************************************************)

termination read_elf32_section_header_table' by lexicographic_order

termination read_elf64_section_header_table' by lexicographic_order



end
