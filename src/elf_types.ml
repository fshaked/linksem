(*Generated by Lem from elf_types.lem.*)
open Lem_num
open Lem_string

open Endianness

open Bitstring_local
open Error
open Show

(** unsigned char type and bindings *)

(*type unsigned_char*)

(** [string_of_unsigned_char uc] provides a string representation of unsigned
  * char [uc] (in base 10).
  *)
(*val string_of_unsigned_char : unsigned_char -> string*)

(** [nat_of_unsigned_char uc] converts an unsigned char [uc] into a nat.
  *)
(*val nat_of_unsigned_char : unsigned_char -> nat*)

(** [unsigned_char_of_nat n] converts a nat [n] into an unsigned char, wrapping
  * around if the size of the nat exceeds the storage capacity of an unsigned
  * char.
  *)
(*val unsigned_char_of_nat : nat -> unsigned_char*)

(** [unsigned_char_land uc0 uc1] bitwise ANDs two unsigned chars, [uc0] and [uc1]
  * together.
  *)
(*val unsigned_char_land   : unsigned_char -> unsigned_char -> unsigned_char*)

(** [unsigned_char_lshift uc n] performs a left bitshift of [n] places on unsigned
  * char [uc].
  *)
(*val unsigned_char_lshift : unsigned_char -> nat -> unsigned_char*)

(** [unsigned_char_rshift uc n] performs a right bitshift of [n] places on unsigned
  * char [uc].
  *)
(*val unsigned_char_rshift : unsigned_char -> nat -> unsigned_char*)

(** [unsigned_char_plus uc0 uc1] adds two unsigned chars, [uc0] and [uc1].
  *)
(*val unsigned_char_plus   : unsigned_char -> unsigned_char -> unsigned_char*)

(** [read_unsigned_char end bs0] reads an unsigned char from bitstring [bs0]
  * assuming endianness [end].  Returns the unsigned char and the remainder of
  * the bitstring.  Fails if an unsigned char cannot be read from the bitstring,
  * e.g. if [bs0] is too small.
  *)
(*val read_unsigned_char   : endianness -> bitstring -> error (unsigned_char * bitstring)*)

let instance_Show_Show_Elf_types_unsigned_char_dict =({

  show_method = Uint32.to_string})

(** elf32_addr type and bindings *)

(*type elf32_addr*)

(*val string_of_elf32_addr : elf32_addr -> string*)
(*val nat_of_elf32_addr : elf32_addr -> nat*)
(*val read_elf32_addr : endianness -> bitstring -> error (elf32_addr * bitstring)*)

let instance_Show_Show_Elf_types_elf32_addr_dict =({

  show_method = Uint32.to_string})

(** elf64_addr type and bindings *)

(*type elf64_addr*)

(*val string_of_elf64_addr : elf64_addr -> string*)
(*val nat_of_elf64_addr : elf64_addr -> nat*)
(*val read_elf64_addr : endianness -> bitstring -> error (elf64_addr * bitstring)*)

let instance_Show_Show_Elf_types_elf64_addr_dict =({

  show_method = Uint64.to_string})

(** elf32_half type and bindings *)

(*type elf32_half*)

(*val string_of_elf32_half : elf32_half -> string*)
(*val read_elf32_half : endianness -> bitstring -> error (elf32_half * bitstring)*)
(*val nat_of_elf32_half : elf32_half -> nat*)

let instance_Show_Show_Elf_types_elf32_half_dict =({

  show_method = Uint32.to_string})

(** elf64_half type and bindings *)

(*type elf64_half*)

(*val string_of_elf64_half : elf64_half -> string*)
(*val read_elf64_half : endianness -> bitstring -> error (elf64_half * bitstring)*)
(*val nat_of_elf64_half : elf64_half -> nat*)

let instance_Show_Show_Elf_types_elf64_half_dict =({

  show_method = Uint32.to_string})

(** elf32_off type and bindings *)

(*type elf32_off*)

(*val string_of_elf32_off : elf32_off -> string*)
(*val nat_of_elf32_off : elf32_off -> nat*)
(*val read_elf32_off : endianness -> bitstring -> error (elf32_off * bitstring)*)

let instance_Show_Show_Elf_types_elf32_off_dict =({

  show_method = Uint32.to_string})

(** elf64_off type and bindings *)

(*type elf64_off*)

(*val string_of_elf64_off : elf64_off -> string*)
(*val nat_of_elf64_off : elf64_off -> nat*)
(*val read_elf64_off : endianness -> bitstring -> error (elf64_off * bitstring)*)

let instance_Show_Show_Elf_types_elf64_off_dict =({

  show_method = Uint64.to_string})

(** elf32_word type and bindings *)

(*type elf32_word*)

(*val string_of_elf32_word : elf32_word -> string*)
(*val nat_of_elf32_word : elf32_word -> nat*)
(*val elf32_word_of_int32 : int32 -> elf32_word*)
(*val elf32_word_land : elf32_word -> elf32_word -> elf32_word*)
(*val elf32_word_rshift : elf32_word -> nat -> elf32_word*)
(*val read_elf32_word : endianness -> bitstring -> error (elf32_word * bitstring)*)
(*val unsigned_char_of_elf32_word : elf32_word -> unsigned_char*)

let instance_Show_Show_Elf_types_elf32_word_dict =({

  show_method = Uint32.to_string})

(** elf64_word type and bindings *)

(*type elf64_word*)

(*val string_of_elf64_word : elf64_word -> string*)
(*val nat_of_elf64_word : elf64_word -> nat*)
(*val elf64_word_of_int32 : int32 -> elf64_word*)
(*val elf64_word_land : elf64_word -> elf64_word -> elf64_word*)
(*val read_elf64_word : endianness -> bitstring -> error (elf64_word * bitstring)*)

let instance_Show_Show_Elf_types_elf64_word_dict =({

  show_method = Uint32.to_string})

(** elf32_sword type and bindings *)

(*type elf32_sword*)

(*val string_of_elf32_sword : elf32_sword -> string*)
(*val nat_of_elf32_sword : elf32_sword -> nat*)
(*val read_elf32_sword : endianness -> bitstring -> error (elf32_sword * bitstring)*)

let instance_Show_Show_Elf_types_elf32_sword_dict =({

  show_method = Int32.to_string})

(** elf64_sword type and bindings *)

(*type elf64_sword*)

(*val string_of_elf64_sword : elf64_sword -> string*)
(*val nat_of_elf64_sword : elf64_sword -> nat*)
(*val read_elf64_sword : endianness -> bitstring -> error (elf64_sword * bitstring)*)

let instance_Show_Show_Elf_types_elf64_sword_dict =({

  show_method = Int32.to_string})

(** elf64_sword type and bindings *)

(*type elf64_xword*)

(*val string_of_elf64_xword : elf64_xword -> string*)
(*val nat_of_elf64_xword : elf64_xword -> nat*)
(*val read_elf64_xword : endianness -> bitstring -> error (elf64_xword * bitstring)*)
(*val elf64_xword_rshift : elf64_xword -> nat -> elf64_xword*)
(*val elf64_xword_land : elf64_xword -> elf64_xword -> elf64_xword*)
(*val elf64_xword_of_int64 : int64 -> elf64_xword*)

let instance_Show_Show_Elf_types_elf64_xword_dict =({

  show_method = Uint64.to_string})

(** elf64_sxword type and bindings *)

(*type elf64_sxword*)

(*val string_of_elf64_sxword : elf64_sxword -> string*)
(*val nat_of_elf64_sxword : elf64_sxword -> nat*)
(*val read_elf64_sxword : endianness -> bitstring -> error (elf64_sxword * bitstring)*)

let instance_Show_Show_Elf_types_elf64_sxword_dict =({

  show_method = Int64.to_string})