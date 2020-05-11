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

const
  SECTION_NAME_SIZE* = 8

type
  SectionCharacteristics* = enum
    IMAGE_SCN_MEM_WRITE = -2147483648'i64
    IMAGE_SCN_TYPE_NO_PAD = 0x00000008, ##  Obsolete. Replaced by IMAGE_SCN_ALIGN_1BYTES
    IMAGE_SCN_CNT_CODE = 0x00000020, IMAGE_SCN_CNT_INITIALIZED_DATA = 0x00000040,
    IMAGE_SCN_CNT_UNINITIALIZED_DATA = 0x00000080, IMAGE_SCN_LNK_OTHER = 0x00000100, ##  Reserved.
    IMAGE_SCN_LNK_INFO = 0x00000200, ##  Valid only for object files.
    IMAGE_SCN_LNK_REMOVE = 0x00000800, ##  Valid only for object files.
    IMAGE_SCN_LNK_COMDAT = 0x00001000, ##  Valid only for object files.
    IMAGE_SCN_NO_DEFER_SPEC_EXC = 0x00004000, IMAGE_SCN_GPREL = 0x00008000, IMAGE_SCN_MEM_PURGEABLE = 0x00020000, ##  Reserved.
    IMAGE_SCN_MEM_LOCKED = 0x00040000, ##  Reserved.
    IMAGE_SCN_MEM_PRELOAD = 0x00080000, ##  Reserved.
    IMAGE_SCN_ALIGN_1BYTES = 0x00100000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_2BYTES = 0x00200000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_4BYTES = 0x00300000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_8BYTES = 0x00400000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_16BYTES = 0x00500000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_32BYTES = 0x00600000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_64BYTES = 0x00700000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_128BYTES = 0x00800000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_256BYTES = 0x00900000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_512BYTES = 0x00A00000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_1024BYTES = 0x00B00000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_2048BYTES = 0x00C00000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_4096BYTES = 0x00D00000, ##  Valid only for object files.
    IMAGE_SCN_ALIGN_8192BYTES = 0x00E00000, ##  Valid only for object files.
    IMAGE_SCN_LNK_NRELOC_OVFL = 0x01000000, IMAGE_SCN_MEM_DISCARDABLE = 0x02000000,
    IMAGE_SCN_MEM_NOT_CACHED = 0x04000000, IMAGE_SCN_MEM_NOT_PAGED = 0x08000000,
    IMAGE_SCN_MEM_SHARED = 0x10000000, IMAGE_SCN_MEM_EXECUTE = 0x20000000,
    IMAGE_SCN_MEM_READ = 0x40000000


##  Quoting pecoff_v8.docx: "Entries in the section table are numbered starting from one (1)".

type
  INNER_C_UNION_1006427405* {.bycopy.} = object {.union.}
    PhysicalAddress*: uint32 ##  same value as next field
    VirtualSize*: uint32

  IMAGE_SECTION_HEADER* {.bycopy.} = object
    Name*: array[SECTION_NAME_SIZE, uint8] ##  TODO: Should we use char instead?
    Misc*: INNER_C_UNION_1006427405
    VirtualAddress*: uint32
    SizeOfRawData*: uint32
    PointerToRawData*: uint32
    PointerToRelocations*: uint32 ##  always zero in executables
    PointerToLinenumbers*: uint32 ##  deprecated
    NumberOfRelocations*: uint16
    NumberOfLinenumbers*: uint16 ##  deprecated
    Characteristics*: uint32 ##  SectionCharacteristics

