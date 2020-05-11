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
  pe_exported_function_t* {.bycopy.} = object
    ordinal*: uint32         ##  ordinal of the function
    name*: cstring             ##  name of the function
    fwd_name*: cstring         ##  name of the forwarded function
    address*: uint32         ##  address of the function

  pe_exports_t* {.bycopy.} = object
    err*: pe_err_e
    name*: cstring             ##  name of the DLL
    functions_count*: uint32
    functions*: ptr pe_exported_function_t ##  array of exported functions


proc pe_exports_dealloc*(exports: ptr pe_exports_t) {.importc.}