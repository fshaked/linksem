(* Generated by Lem from input_list.lem. *)

Require Import Arith.
Require Import Bool.
Require Import List.
Require Import String.
Require Import Program.Wf.

Require Import coqharness.

Open Scope nat_scope.
Open Scope string_scope.

Require Import lem_basic_classes.
Require Export lem_basic_classes.

Require Import lem_function.
Require Export lem_function.

Require Import lem_string.
Require Export lem_string.

Require Import lem_string_extra.
Require Export lem_string_extra.

Require Import lem_tuple.
Require Export lem_tuple.

Require Import lem_bool.
Require Export lem_bool.

Require Import lem_list.
Require Export lem_list.

Require Import lem_list_extra.
Require Export lem_list_extra.

Require Import lem_sorting.
Require Export lem_sorting.

Require Import lem_num.
Require Export lem_num.

Require Import lem_maybe.
Require Export lem_maybe.

Require Import lem_assert_extra.
Require Export lem_assert_extra.


Require Import byte_sequence.
Require Export byte_sequence.

Require Import default_printing.
Require Export default_printing.

Require Import error.
Require Export error.

Require Import missing_pervasives.
Require Export missing_pervasives.

Require Import show.
Require Export show.


Require Import archive.
Require Export archive.

Require Import command_line.
Require Export command_line.

Require Import elf_types_native_uint.
Require Export elf_types_native_uint.

Require Import elf_file.
Require Export elf_file.

Require Import elf_header.
Require Export elf_header.


(* Here we elaborate away various properties of the command line: 
 * archives, groups, library paths, -l, --as-needed, --whole-archive,
 * and which inputs can be used to resolve symbols undefined in which other inputs.
 * 
 * What we get out is a list of input files and the options applying to them.
 * Input files are either relocatable files, shared objects or linker scripts.
 *)

Inductive input_blob : Type :=   Reloc:  byte_sequence  -> input_blob 
                 | Shared:  byte_sequence  -> input_blob 
                 | Script:  byte_sequence  -> input_blob 
                 | ControlScript: input_blob .
Definition input_blob_default: input_blob  := Reloc byte_sequence_default.

(* We remember where the input item came from on the command line,
 * using "coordinates" identifying the index in the higher-up list
 * followed by the index within that item. *)
Inductive origin_coord : Type :=  InArchive:  ((nat  * nat  * string  * nat ) % type) -> origin_coord  (* archive-id, pos-within-archive, archive-name, archive-member-count *)
                  | InGroup:  ((nat  * nat ) % type) -> origin_coord    (* group-id, pos-within-group *)
                  | InCommandLine:  nat  -> origin_coord 
                  | Builtin: origin_coord .
Definition origin_coord_default: origin_coord  := InArchive (nat_default, nat_default, string_default, nat_default).
(* [?]: removed value specification. *)

(* 

Instance x127_Show : Show origin_coord := {
     show  :=  string_of_origin_coord
}.
 *)

Definition input_origin : Type := ( input_unit  * list  origin_coord ) % type.
Definition input_origin_default: input_origin  := (input_unit_default, DAEMON).

Definition input_item : Type := ( string  * input_blob  * input_origin ) % type.
Definition input_item_default: input_item  := (string_default, input_blob_default, input_origin_default).
(* [?]: removed value specification. *)

(* 

Instance x126_Show : Show input_blob := {
     show  :=  string_of_input_blob
}.
 *)
(* [?]: removed value specification. *)

Definition short_string_of_input_item  (item : (string *input_blob *((input_unit *list (origin_coord )) % type)) % type)  : string :=  
  match ( item) with (fname1,  blob,  (u,  origin)) =>
    match ( origin) with InArchive(aid,  aidx,  aname,  _) :: _ =>
      String.append aname (String.append "(" (String.append fname1 ")"))
      | _ => fname1 end end.

(* About symbol resolution and "suppliers".
 * 
 * Groups change this.
 * 
 * When we expand a .a file into a list of .o files, what is the supplier
 * relation among them? I *THINK* that within the archive, each can supply any other,
 * but outside the archive, each can only supply leftmore.
 *)

Definition can_supply_function : Type :=  list  input_item  ->  nat  ->  list  bool .
Definition can_supply_function_default: can_supply_function  := (fun (x124 :  list  input_item ) => (fun (x125 :  nat ) => DAEMON)).

Record input_options : Type :=  { item_fmt : string 
                       ; item_check_sections : bool 
                       ; item_copy_dt_needed : bool 
                       ; item_force_output : bool   (* true for .o, false for .a unless --whole-archive, 
                                                 true for .so with --no-as-needed, 
                                                 false for .so with --as-needed *)
                       }.
Notation "{[ r 'with' 'item_fmt' := e ]}" := ({| item_fmt := e; item_check_sections := item_check_sections r; item_copy_dt_needed := item_copy_dt_needed r; item_force_output := item_force_output r |}).
Notation "{[ r 'with' 'item_check_sections' := e ]}" := ({| item_check_sections := e; item_fmt := item_fmt r; item_copy_dt_needed := item_copy_dt_needed r; item_force_output := item_force_output r |}).
Notation "{[ r 'with' 'item_copy_dt_needed' := e ]}" := ({| item_copy_dt_needed := e; item_fmt := item_fmt r; item_check_sections := item_check_sections r; item_force_output := item_force_output r |}).
Notation "{[ r 'with' 'item_force_output' := e ]}" := ({| item_force_output := e; item_fmt := item_fmt r; item_check_sections := item_check_sections r; item_copy_dt_needed := item_copy_dt_needed r |}).
Definition input_options_default: input_options  := {| item_fmt := string_default; item_check_sections := bool_default; item_copy_dt_needed := bool_default; item_force_output := bool_default |}.
(* [?]: removed value specification. *)

Definition null_input_options   : input_options :=  
                      {|item_fmt := ""
                       ;item_check_sections := false
                       ;item_copy_dt_needed := false
                       ;item_force_output := true
                       |}.
(* [?]: removed value specification. *)

(* 

Instance x123_Show : Show input_options := {
     show  :=  string_of_input_options
}.
 *)

Definition input_list : Type :=  list  ((input_item  * input_options ) % type).
Definition input_list_default: input_list  := DAEMON.
(* [?]: removed value specification. *)

Definition toplevel_dot_o_can_supply  (inputs : list ((string *input_blob *input_origin ) % type)) (pos : nat ) 
  : list (bool ):=  lem_list.genlist (fun  _ : nat  => true) (List.length inputs).
(* [?]: removed value specification. *)

Definition toplevel_shared_can_supply  (inputs : list ((string *input_blob *input_origin ) % type)) (pos : nat ) 
  : list (bool ):=  lem_list.genlist (fun (ndx : nat ) => nat_lteb ndx pos) (List.length inputs).
(* [?]: removed value specification. *)

Definition toplevel_archive_can_supply  (inputs : list ((string *input_blob *input_origin ) % type)) (pos : nat ) 
  : list (bool ):=  lem_list.genlist (fun (ndx : nat ) => nat_lteb ndx pos) (List.length inputs).
(* [?]: removed value specification. *)

Definition lib_filename_from_spec  (spec : string ) (ext : string )  : string := 
    match ( (string_to_char_list spec)) with 
        : :: more => (string_from_char_list more)
        | _ =>  String.append"lib"  (String.append spec  (String.append"." ext))
    end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition is_elf64_with_type  (typ : elf64_half ) (seq : byte_sequence )  : bool :=  
    (*let _ = Missing_pervasives.errs ("elf64? " ^ 
        (match seq with Sequence(bs) -> show (List.take 16 bs) end))
    in*)
    match ( elf_file.read_elf64_file seq) with 
    Success(e) => (* let _ = Missing_pervasives.errln ": yes" in *) ( elf64_half_equal(elf64_type(elf64_file_headere)) typ)
    | Fail _ => (* let _ = Missing_pervasives.errln ": no" in *) false
    end.
(* [?]: removed value specification. *)

Definition is_archive  (seq : byte_sequence )  : bool := 
    match ( read_archive_global_header seq) with 
        Success _ => true
        | Fail _ => false
    end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)

Definition make_input_items_and_options  (file_list : list ((string *input_blob *((input_unit *list (origin_coord )) % type)) % type)) (cmdopts : input_file_options ) (coords_to_append : list (origin_coord ))  : list ((((string *input_blob *((input_unit *list (origin_coord )) % type)) % type)*input_options ) % type):=  
  match ( file_list) with [] => DAEMON
    | [(fname1,  Reloc(seq),  (u,  coords))] =>
    [((fname1, Reloc (seq), (u, (@ List.app _) coords coords_to_append)),
  {|item_fmt :=(input_fmt cmdopts)
  ;item_check_sections :=(input_check_sections cmdopts)
  ;item_copy_dt_needed :=(input_copy_dt_needed cmdopts)
  ;item_force_output := true |})]
    | [(fname1,  Shared(seq),  (u,  coords))] =>
    [((fname1, Shared (seq), (u, (@ List.app _) coords coords_to_append)),
  {|item_fmt :=(input_fmt cmdopts)
  ;item_check_sections :=(input_check_sections cmdopts)
  ;item_copy_dt_needed :=(input_copy_dt_needed cmdopts)
  ;item_force_output := (if(input_as_needed cmdopts) then false else true)
  |})] | [(fname1,  Script(seq),  (u,  coords))] =>
    [((fname1, Script (seq), (u, (@ List.app _) coords coords_to_append)),
  {|item_fmt :=(input_fmt cmdopts)
  ;item_check_sections :=(input_check_sections cmdopts)
  ;item_copy_dt_needed :=(input_copy_dt_needed cmdopts)
  ;item_force_output := true |})] | _ =>
    (* guaranteed to be all relocs, from one archive *)
  let items_and_options :=
  mapMaybei
    (fun (i : nat ) =>
       (fun (p : (string *input_blob *((input_unit *list (origin_coord )) % type)) % type) =>
          match ( (p) ) with ( (fname1,  reloc1,  (u,  coords))) =>
            let item := (fname1, reloc1, (u, (@ List.app _) coords
                                               coords_to_append)) in
          let options := {|item_fmt :=(input_fmt cmdopts)
          ;item_check_sections :=(input_check_sections cmdopts)
          ;item_copy_dt_needed :=(input_copy_dt_needed cmdopts)
          ;item_force_output := (
          if(input_whole_archive cmdopts) then true else false) |}
          in Some (item, options) end )) file_list in items_and_options end.
(* [?]: removed value specification. *)

(* [?]: removed value specification. *)
