(*
    Copyright 2018 Fernando Borretti <fernando@borretti.me>

    This file is part of Austral.

    Austral is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Austral is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Austral.  If not, see <http://www.gnu.org/licenses/>.
*)

structure Symbol : SYMBOL = struct
    type module_name = Ident.ident
    type symbol_name = Ident.ident

    datatype symbol = Symbol of module_name * symbol_name

    fun mkSymbol p = Symbol p
    fun symbolModuleName (Symbol (m, _)) = m
    fun symbolName (Symbol (_, n)) = n

    fun toString (Symbol (m, n)) =
        (Ident.identString m) ^ "::" ^ (Ident.identString n)

    datatype variable = Var of symbol * int

    fun varSymbol (Var (s, _)) =
        s

    fun varToString (Var (n, _)) =
        toString n

    (* Symbol utilities *)

    fun au name =
        mkSymbol (Ident.mkIdentEx "austral",
                  Ident.mkIdentEx name)

    fun auKer name =
        mkSymbol (Ident.mkIdentEx "austral.kernel",
                  Ident.mkIdentEx name)

    fun auCffi name =
        mkSymbol (Ident.mkIdentEx "austral.ext.cffi",
                  Ident.mkIdentEx name)
end