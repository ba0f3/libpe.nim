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

type
  INNER_C_UNION_3287858420* {.bycopy.} = object {.union.}
    Characteristics*: uint32 ##  0 for terminating null import descriptor
    OriginalFirstThunk*: uint32 ##  RVA to original unbound IAT

  IMAGE_IMPORT_DESCRIPTOR* {.bycopy.} = object
    u1*: INNER_C_UNION_3287858420
    TimeDateStamp*: uint32
    ForwarderChain*: uint32  ##  -1 if no forwarders
    Name*: uint32            ##  RVA to IAT (if bound this IAT has actual addresses)
    FirstThunk*: uint32


##  import name entry

type
  INNER_C_UNION_4005812600* {.bycopy.} = object {.union.}
    ForwarderString*: uint64 ##  RVA to a forwarder string
    Function*: uint64        ##  Memory address of the imported function
    Ordinal*: uint64         ##  Ordinal value of imported API
    AddressOfData*: uint64   ##  RVA to an IMAGE_IMPORT_BY_NAME with the imported API name

  INNER_C_UNION_69822394* {.bycopy.} = object {.union.}
    ForwarderString*: uint32 ##  RVA to a forwarder string
    Function*: uint32        ##  Memory address of the imported function
    Ordinal*: uint32         ##  Ordinal value of imported API
    AddressOfData*: uint32   ##  RVA to an IMAGE_IMPORT_BY_NAME with the imported API name

  IMAGE_IMPORT_BY_NAME* {.bycopy.} = object
    Hint*: uint16
    Name*: array[1, uint8]

  IMAGE_THUNK_DATA64* {.bycopy.} = object
    u1*: INNER_C_UNION_4005812600

  IMAGE_THUNK_DATA32* {.bycopy.} = object
    u1*: INNER_C_UNION_69822394

