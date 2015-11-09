(*Generated by Lem from elf_program_header_table.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_listTheory lem_setTheory lem_functionTheory lem_basic_classesTheory lem_boolTheory lem_maybeTheory lem_stringTheory showTheory missing_pervasivesTheory errorTheory byte_sequenceTheory endiannessTheory elf_types_native_uintTheory elf_program_header_tableTheory;

val _ = numLib.prefer_num();



open lemLib;
(* val _ = lemLib.run_interactive := true; *)
val _ = new_theory "elf_program_header_tableAuxiliary"


(****************************************************)
(*                                                  *)
(* Termination Proofs                               *)
(*                                                  *)
(****************************************************)

(* val gst = Defn.tgoal_no_defn (read_elf32_program_header_table'_def, read_elf32_program_header_table'_ind) *)
val (read_elf32_program_header_table'_rw, read_elf32_program_header_table'_ind_rw) =
  Defn.tprove_no_defn ((read_elf32_program_header_table'_def, read_elf32_program_header_table'_ind),
    cheat
  )
val read_elf32_program_header_table'_rw = save_thm ("read_elf32_program_header_table'_rw", read_elf32_program_header_table'_rw);
val read_elf32_program_header_table'_ind_rw = save_thm ("read_elf32_program_header_table'_ind_rw", read_elf32_program_header_table'_ind_rw);


(* val gst = Defn.tgoal_no_defn (read_elf64_program_header_table'_def, read_elf64_program_header_table'_ind) *)
val (read_elf64_program_header_table'_rw, read_elf64_program_header_table'_ind_rw) =
  Defn.tprove_no_defn ((read_elf64_program_header_table'_def, read_elf64_program_header_table'_ind),
    cheat
  )
val read_elf64_program_header_table'_rw = save_thm ("read_elf64_program_header_table'_rw", read_elf64_program_header_table'_rw);
val read_elf64_program_header_table'_ind_rw = save_thm ("read_elf64_program_header_table'_ind_rw", read_elf64_program_header_table'_ind_rw);




val _ = export_theory()
