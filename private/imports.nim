##
##     libpe - the PE library
##
##     Copyright (C) 2010 - 2017 libpe authors
##
##     This file is part of libpe.
##
##     libpe is free software: you can redistribute it and/or modify
##     it under the terms of the GNU Lesser General Public License as published by
##     the Free Software Foundation, either version 3 of the License, or
##     (at your option) any later version.
##
##     libpe is distributed in the hope that it will be useful,
##     but WITHOUT ANY WARRANTY; without even the implied warranty of
##     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##     GNU Lesser General Public License for more details.
##
##     You should have received a copy of the GNU Lesser General Public License
##     along with libpe.  If not, see <http://www.gnu.org/licenses/>.
##

import
  error

type
  pe_imported_function_t* {.bycopy.} = object
    name*: cstring
    hint*:uint16
    ordinal*: uint16

  pe_imported_dll_t* {.bycopy.} = object
    err*: pe_err_e
    name*: cstring
    functions_count*: uint32
    functions*: ptr pe_imported_function_t ##  array of imported functions

  pe_imports_t* {.bycopy.} = object
    err*: pe_err_e
    dll_count*: uint32
    dlls*: ptr pe_imported_dll_t ##  array of DLLs


proc pe_imports_dealloc*(imports: ptr pe_imports_t) {.importc.}
##
##  We have an array of names and an array of functions.
##
##  functions[i] has functions corresponding to names[i]
##
##  "Imports": [
## 		{
## 			"DllName": "SHELL32.dll",
## 				"Functions": [
## 						"ShellExecuteA",
## 						"FindExecutableA"
## 				]
## 		}
## 	 ]
##
