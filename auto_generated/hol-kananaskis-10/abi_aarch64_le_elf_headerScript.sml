(*Generated by Lem from abis/aarch64/abi_aarch64_le_elf_header.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_listTheory lem_basic_classesTheory lem_boolTheory lem_maybeTheory missing_pervasivesTheory endiannessTheory elf_types_native_uintTheory elf_headerTheory;

val _ = numLib.prefer_num();



val _ = new_theory "abi_aarch64_le_elf_header"

(** [abi_aarch64_le_elf_header] contains types and definitions relating to ABI
  * specific ELF header functionality for the AArch64 ABI (little-endian).
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Num*)
(*open import Maybe*)
(*open import Missing_pervasives*)

(*open import Elf_header*)
(*open import Elf_types_native_uint*)

(*open import Endianness*)

(*val abi_aarch64_le_data_encoding : natural*)
val _ = Define `
 (abi_aarch64_le_data_encoding=  elf_data_2lsb)`;


(*val abi_aarch64_le_endianness : endianness*)
val _ = Define `
 (abi_aarch64_le_endianness=  Little)`;
 (* Must match above *)

(*val abi_aarch64_le_file_class : natural*)
val _ = Define `
 (abi_aarch64_le_file_class=  elf_class_64)`;


(*val abi_aarch64_le_file_version : natural*)
val _ = Define `
 (abi_aarch64_le_file_version=  elf_ev_current)`;


(*val abi_aarch64_le_page_size_min : natural*)
val _ = Define `
 (abi_aarch64_le_page_size_min= (( 4096:num)))`;


(*val abi_aarch64_le_page_size_max : natural*)
val _ = Define `
 (abi_aarch64_le_page_size_max= (( 65536:num)))`;


(** [is_valid_abi_aarch64_le_machine_architecture m] checks whether the ELF header's
  * machine architecture is valid according to the ABI-specific specification.
  * Machine architecture must be AArch64 (pg 60)
  *)
(*val is_valid_abi_aarch64_le_machine_architecture : natural -> bool*)
val _ = Define `
 (is_valid_abi_aarch64_le_machine_architecture m=  
 (m = elf_ma_aarch64))`;


(** [is_valid_abi_aarch64_le_magic_number magic] checks whether the ELF header's
  * magic number is valid according to the ABI-specific specification.
  * File class must be 64-bit (pg 60)
  * Data encoding must be little endian (pg 60)
  *)
(*val is_valid_abi_aarch64_le_magic_number : list unsigned_char -> bool*)
val _ = Define `
 (is_valid_abi_aarch64_le_magic_number magic=  
 ((case lem_list$list_index magic ( elf_ii_class) of
      NONE  => F
    | SOME cls =>
      (case lem_list$list_index magic ( elf_ii_data) of
          NONE   => F
        | SOME data =>
            (w2n cls = abi_aarch64_le_file_class) /\
              (w2n data = abi_aarch64_le_data_encoding)
      )
  )))`;

val _ = export_theory()

