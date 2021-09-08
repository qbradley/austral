open Identifier
open Semantic

(* Represents the imports into a module. *)
type import_map

(* Create an empty map, given the name of the module that's we're importing
   into. *)
val empty_map : module_name -> import_map

val add_symbol : import_map -> qident -> import_map

(* The name of the module we're importing into. *)
val importing_module : import_map -> module_name

(* Find a symbol from its local nickname. Returns None if not imported. *)
val get_symbol : import_map -> identifier -> qident option

(* The list of imported classes *)
val imported_classes : import_map -> semantic_typeclass list

(* The list of imported typeclass instances *)
val imported_instances : import_map -> semantic_instance list

val dump_import_map : import_map -> string