open Identifier
open Semantic

type menv

val empty_menv : menv

val put_module : menv -> semantic_module -> menv

val get_module : menv -> module_name -> semantic_module option

val get_decl : menv -> qident -> sem_decl option

(* The second argument is the name of the module where typechecking is taking place. *)
val get_callable : menv -> module_name -> qident -> callable option