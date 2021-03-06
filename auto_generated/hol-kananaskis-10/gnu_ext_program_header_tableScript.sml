(*Generated by Lem from gnu_extensions/gnu_ext_program_header_table.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_basic_classesTheory;

val _ = numLib.prefer_num();



val _ = new_theory "gnu_ext_program_header_table"

(** [gnu_ext_program_header_table] contains GNU extension specific functionality
  * related to the program header table.
  *)

(*open import Basic_classes*)
(*open import Num*)

(** GNU extensions, as defined in the LSB, see section 11.2. *)

(** The element specifies the location and size of a segment that may be made
  * read-only after relocations have been processed.
  *)
val _ = Define `
 (elf_pt_gnu_relro : num=  ((( 4:num) *( 421345620:num)) +( 2:num)))`;
 (* 0x6474e552 *)
(** The [p_flags] member specifies the permissions of the segment containing the
  * stack and is used to indicate whether the stack should be executable.
  *)
val _ = Define `
 (elf_pt_gnu_stack : num=  ((( 4:num) *( 421345620:num)) +( 1:num)))`;
 (* 0x6474e551 *)
(** Element specifies the location and size of exception handling information. *)
val _ = Define `
 (elf_pt_gnu_eh_frame : num= (( 4:num) *( 421345620:num)))`;
    (* 0x6474e550 *)

(** [string_of_gnu_ext_segment_type m] produces a string representation of
  * GNU extension segment type [m].
  *)
(*val string_of_gnu_ext_segment_type : natural -> string*)
val _ = export_theory()

