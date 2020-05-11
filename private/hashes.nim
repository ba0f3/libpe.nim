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
  pe_imphash_flavor_e* = enum
    LIBPE_IMPHASH_FLAVOR_MANDIANT = 1, LIBPE_IMPHASH_FLAVOR_PEFILE = 2
  pe_hash_t* {.bycopy.} = object
    name*: cstring
    md5*: cstring
    ssdeep*: cstring
    sha1*: cstring
    sha256*: cstring

  pe_hash_headers_t* {.bycopy.} = object
    err*: pe_err_e
    dos*: ptr pe_hash_t
    coff*: ptr pe_hash_t
    optional*: ptr pe_hash_t

  pe_hash_sections_t* {.bycopy.} = object
    err*: pe_err_e
    count*: uint32
    sections*: ptr ptr pe_hash_t



proc pe_hash_headers_dealloc*(obj: ptr pe_hash_headers_t) {.importc.}
proc pe_hash_sections_dealloc*(obj: ptr pe_hash_sections_t) {.importc.}
proc pe_hash_dealloc*(obj: ptr pe_hash_t) {.importc.}