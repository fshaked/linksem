(*Generated by Lem from pre_main.lem.*)
open Show

open Elf_section_header

(*val display : elf32_section_header_table -> string*)
let display = (listShow
    instance_Show_Show_Elf_section_header_elf32_section_header_table_entry_dict)