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
  macros, error, hdr_dos, hdr_coff, hdr_optional, directories, sections, hashes,
  imports, exports, resources

const
  MAGIC_MZ* = 0x00005A4D
  MAX_DIRECTORIES* = 16
  MAX_SECTIONS* = 96

##  TODO(jweyrich): Does the PE spec define a length limit for
##                  function names and import/export library names?

const
  MAX_DLL_NAME* = 256
  MAX_FUNCTION_NAME* = 512
  IMAGE_ORDINAL_FLAG32* = 0x80000000
  IMAGE_ORDINAL_FLAG64* = 0x8000000000000000'i64
  SIGNATURE_NE* = 0x0000454E
  SIGNATURE_PE* = 0x00004550

type
  pe_option_e* = enum
    LIBPE_OPT_NOCLOSE_FD = (1 shl 0), ##  Keeps `stream` open for further usage.
    LIBPE_OPT_OPEN_RW = (1 shl 1) ##  Open file for read and writing
  pe_options_e* = uint16


##  bitmasked pe_option_e values

type
  pe_file_t* {.bycopy.} = object
    dos_hdr*: ptr IMAGE_DOS_HEADER ##  DOS header
    ##  Signature
    signature*: uint32       ##  COFF header
    coff_hdr*: ptr IMAGE_COFF_HEADER ##  Optional header
    optional_hdr_ptr*: pointer
    optional_hdr*: IMAGE_OPTIONAL_HEADER ##  Directories
    num_directories*: uint32
    directories_ptr*: pointer
    directories*: ptr ptr IMAGE_DATA_DIRECTORY ##  array up to MAX_DIRECTORIES
                                           ##  Sections
    num_sections*: uint16
    sections_ptr*: pointer
    sections*: ptr ptr IMAGE_SECTION_HEADER ##  array up to MAX_SECTIONS
    entrypoint*: uint64
    imagebase*: uint64

  pe_cached_data_t* {.bycopy.} = object
    imports*: ptr pe_imports_t  ##  Parsed directories
    exports*: ptr pe_exports_t  ##  Hashes
    hash_headers*: ptr pe_hash_headers_t
    hash_sections*: ptr pe_hash_sections_t
    hash_file*: ptr pe_hash_t

  pe_ctx_t* {.bycopy.} = object
    stream*: ptr FILE
    path*: cstring
    map_addr*: pointer
    map_size*: int
    map_end*: pointer
    pe*: pe_file_t
    cached_data*: pe_cached_data_t


##  General functions
{.push importc.}
proc pe_can_read*(ctx: ptr pe_ctx_t; `ptr`: pointer; size: csize): bool
proc pe_load_file*(ctx: ptr pe_ctx_t; path: cstring): pe_err_e
proc pe_load_file_ext*(ctx: ptr pe_ctx_t; path: cstring; options: pe_options_e): pe_err_e
proc pe_unload*(ctx: ptr pe_ctx_t): pe_err_e
proc pe_parse*(ctx: ptr pe_ctx_t): pe_err_e
proc pe_is_loaded*(ctx: ptr pe_ctx_t): bool
proc pe_is_pe*(ctx: ptr pe_ctx_t): bool
proc pe_is_dll*(ctx: ptr pe_ctx_t): bool
proc pe_filesize*(ctx: ptr pe_ctx_t): uint64
proc pe_rva2section*(ctx: ptr pe_ctx_t; rva: uint64): ptr IMAGE_SECTION_HEADER
proc pe_rva2ofs*(ctx: ptr pe_ctx_t; rva: uint64): uint64
proc pe_ofs2rva*(ctx: ptr pe_ctx_t; ofs: uint64): uint64
##  Header functions

proc pe_dos*(ctx: ptr pe_ctx_t): ptr IMAGE_DOS_HEADER
proc pe_coff*(ctx: ptr pe_ctx_t): ptr IMAGE_COFF_HEADER
proc pe_optional*(ctx: ptr pe_ctx_t): ptr IMAGE_OPTIONAL_HEADER
proc pe_directories_count*(ctx: ptr pe_ctx_t): uint32
proc pe_directories*(ctx: ptr pe_ctx_t): ptr ptr IMAGE_DATA_DIRECTORY
proc pe_directory_by_entry*(ctx: ptr pe_ctx_t; entry: ImageDirectoryEntry): ptr IMAGE_DATA_DIRECTORY
proc pe_sections_count*(ctx: ptr pe_ctx_t): uint16
proc pe_sections*(ctx: ptr pe_ctx_t): ptr ptr IMAGE_SECTION_HEADER
proc pe_section_by_name*(ctx: ptr pe_ctx_t; section_name: cstring): ptr IMAGE_SECTION_HEADER
proc pe_section_name*(ctx: ptr pe_ctx_t; section_hdr: ptr IMAGE_SECTION_HEADER;
                     out_name: cstring; out_name_size: csize): cstring
proc pe_machine_type_name*(`type`: MachineType): cstring
proc pe_image_characteristic_name*(characteristic: ImageCharacteristics): cstring
proc pe_image_dllcharacteristic_name*(characteristic: ImageDllCharacteristics): cstring
proc pe_windows_subsystem_name*(subsystem: WindowsSubsystem): cstring
proc pe_directory_name*(entry: ImageDirectoryEntry): cstring
proc pe_section_characteristic_name*(characteristic: SectionCharacteristics): cstring
##  Hash functions

proc pe_hash_recommended_size*(): csize
proc pe_hash_raw_data*(output: cstring; output_size: csize; alg_name: cstring;
                      data: ptr cuchar; data_size: csize): bool
proc pe_get_headers_hashes*(ctx: ptr pe_ctx_t): ptr pe_hash_headers_t
proc pe_get_sections_hash*(ctx: ptr pe_ctx_t): ptr pe_hash_sections_t
proc pe_get_file_hash*(ctx: ptr pe_ctx_t): ptr pe_hash_t
proc pe_imphash*(ctx: ptr pe_ctx_t; flavor: pe_imphash_flavor_e): cstring
##  Imports functions

proc pe_imports*(ctx: ptr pe_ctx_t): ptr pe_imports_t
##  Exports functions

proc pe_exports*(ctx: ptr pe_ctx_t): ptr pe_exports_t
##  Resources functions

proc pe_get_resources*(ctx: ptr pe_ctx_t): pe_final_output_t
proc pe_get_resources_count*(ctx: ptr pe_ctx_t): pe_resources_count_t
proc pe_dealloc_resources*(obj: pe_final_output_t)
##  Misc functions

proc pe_calculate_entropy_file*(ctx: ptr pe_ctx_t): cdouble
proc pe_fpu_trick*(ctx: ptr pe_ctx_t): bool
proc pe_get_cpl_analysis*(ctx: ptr pe_ctx_t): cint
proc pe_has_fake_entrypoint*(ctx: ptr pe_ctx_t): cint
proc pe_get_tls_callback*(ctx: ptr pe_ctx_t): cint
{.pop.}