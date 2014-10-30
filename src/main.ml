(*Generated by Lem from main.lem.*)
open Lem_function
open Lem_string
open Lem_tuple

open Bitstring_local
open Default_printing
open Error
open Missing_pervasives
open Show

open Elf_header
open Elf_file1
open Elf_executable_file2
open Elf_executable_file3
open Elf_linking_file2
open Elf_linking_file3
open Elf_linking_file4

open Sail_interface

let default_hdr_bdl =
  (default_os_specific_print, default_proc_specific_print)

let default_pht_bdl =
  (default_os_specific_print, default_proc_specific_print)

let default_sht_bdl =
  (default_os_specific_print, default_proc_specific_print, default_user_specific_print)

let _ =  
(let res =    
(Ml_bindings.acquire_bitstring "test/power64-executable-1" >>= (fun bs0 ->
    Elf_executable_file3.read_elf64_executable_file3 bs0 >>= (fun f1 ->
    let _ = (print_endline (Elf_executable_file3.string_of_elf64_executable_file3 default_hdr_bdl default_pht_bdl default_sht_bdl f1)) in
    Elf_executable_file3.get_elf64_symbol_table f1 >>= (fun symtab ->
    let _ = (print_endline ("Symbol table length: " ^ string_of_int (List.length symtab))) in
    let _ = (print_endline (Elf_symbol_table.string_of_elf64_symbol_table symtab)) in
    Elf_executable_file3.get_elf64_symbol_string_table f1 >>= (fun strtab ->
    let _ = (print_endline ("XXX: " ^ unlines (String_table.get_strings strtab))) in
    Elf_symbol_table.get_elf64_symbol_image_address symtab strtab >>= (fun strs ->
    let _ = (print_endline (string_of_maybe 
  (instance_Show_Show_tup2_dict instance_Show_Show_string_dict
     instance_Show_Show_nat_dict) (Lem_list.list_index strs( 23)))) in
    return f1))))))
  in
    (match res with
      | Fail err -> print_endline ("[!]: " ^ err)
      | Success _ -> print_endline "Success..."
    ))
