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
  dir_import, dir_resources, dir_security

##  Directory entries

type
  ImageDirectoryEntry* = enum
    IMAGE_DIRECTORY_ENTRY_EXPORT = 0, ##  Export Table
    IMAGE_DIRECTORY_ENTRY_IMPORT = 1, ##  Import Table
    IMAGE_DIRECTORY_ENTRY_RESOURCE = 2, ##  Resource Table
    IMAGE_DIRECTORY_ENTRY_EXCEPTION = 3, ##  Exception Table
    IMAGE_DIRECTORY_ENTRY_SECURITY = 4, ##  Certificate Table
    IMAGE_DIRECTORY_ENTRY_BASERELOC = 5, ##  Base Relocation Table
    IMAGE_DIRECTORY_ENTRY_DEBUG = 6, ##  Debug
                                  ## IMAGE_DIRECTORY_ENTRY_COPYRIGHT			= 7, // (X86 usage)
    IMAGE_DIRECTORY_ENTRY_ARCHITECTURE = 7, ##  Architecture
    IMAGE_DIRECTORY_ENTRY_GLOBALPTR = 8, ##  Global Ptr
    IMAGE_DIRECTORY_ENTRY_TLS = 9, ##  TLS Table
    IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG = 10, ##  Load Config Table
    IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT = 11, ##  Bound Import
    IMAGE_DIRECTORY_ENTRY_IAT = 12, ##  IAT
    IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT = 13, ##  Delay Import Descriptor
    IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 14, ##  CLR Runtime Header
    IMAGE_DIRECTORY_RESERVED = 15
  IMAGE_EXPORT_DIRECTORY* {.bycopy.} = object
    Characteristics*: uint32
    TimeDateStamp*: uint32
    MajorVersion*: uint16
    MinorVersion*: uint16
    Name*: uint32
    Base*: uint32
    NumberOfFunctions*: uint32
    NumberOfNames*: uint32
    AddressOfFunctions*: uint32
    AddressOfNames*: uint32
    AddressOfNameOrdinals*: uint32

  IMAGE_TLS_DIRECTORY32* {.bycopy.} = object
    StartAddressOfRawData*: uint32
    EndAddressOfRawData*: uint32
    AddressOfIndex*: uint32
    AddressOfCallBacks*: uint32 ##  PIMAGE_TLS_CALLBACK
    SizeOfZeroFill*: uint32
    Characteristics*: uint32 ##  reserved for future use

  IMAGE_TLS_DIRECTORY64* {.bycopy.} = object
    StartAddressOfRawData*: uint32
    EndAddressOfRawData*: uint32
    AddressOfIndex*: uint32
    AddressOfCallBacks*: uint32
    SizeOfZeroFill*: uint32
    Characteristics*: uint32

  IMAGE_DATA_DIRECTORY* {.bycopy.} = object
    VirtualAddress*: uint32
    Size*: uint32


