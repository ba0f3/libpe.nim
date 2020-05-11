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
  error, dir_resources

type
  INNER_C_UNION_4075568910* {.bycopy.} = object {.union.}
    resourceDirectory*: ptr IMAGE_RESOURCE_DIRECTORY ##  nodeType == 1
    directoryEntry*: ptr IMAGE_RESOURCE_DIRECTORY_ENTRY ##  nodeType == 2
    dataString*: ptr IMAGE_RESOURCE_DATA_STRING ##  nodeType == 3
    dataEntry*: ptr IMAGE_RESOURCE_DATA_ENTRY ##  nodeType == 4

  INNER_C_UNION_3946827472* {.bycopy.} = object {.union.}
    resourcesDirectory*: type_RDT_RESOURCE_DIRECTORY
    directoryEntry*: type_RDT_DIRECTORY_ENTRY
    dataString*: type_RDT_DATA_STRING
    dataEntry*: type_RDT_DATA_ENTRY

  NODE_LEVEL_PERES* = enum
    RDT_LEVEL1 = 1, RDT_LEVEL2 = 2, RDT_LEVEL3 = 3
  NODE_TYPE_PERES* = enum
    RDT_RESOURCE_DIRECTORY = 1, RDT_DIRECTORY_ENTRY = 2, RDT_DATA_STRING = 3,
    RDT_DATA_ENTRY = 4
  NODE_PERES* {.bycopy.} = object
    nodeType*: NODE_TYPE_PERES
    nodeLevel*: NODE_LEVEL_PERES
    resource*: INNER_C_UNION_4075568910
    nextNode*: ptr NODE_PERES
    lastNode*: ptr NODE_PERES
    rootNode*: ptr NODE_PERES

  type_RDT_RESOURCE_DIRECTORY* {.bycopy.} = object
    NodeType*: cint
    Characteristics*: cint
    TimeDateStamp*: cint
    MajorVersion*: cint
    MinorVersion*: cint
    NumberOfNamedEntries*: cint
    NumberOfIdEntries*: cint

  type_RDT_DIRECTORY_ENTRY* {.bycopy.} = object
    NodeType*: cint
    NameOffset*: cint
    NameIsString*: cint
    OffsetIsDirectory*: cint
    DataIsDirectory*: cint

  type_RDT_DATA_STRING* {.bycopy.} = object
    NodeType*: cint
    Strlen*: cint
    String*: cint

  type_RDT_DATA_ENTRY* {.bycopy.} = object
    NodeType*: cint
    OffsetToData*: cint
    Size*: cint
    CodePage*: cint
    Reserved*: cint

  output_node_t* {.bycopy.} = object
    kind*: NODE_TYPE_PERES
    node_type*: INNER_C_UNION_3946827472




##  counting

type
  pe_resources_count_t* {.bycopy.} = object
    resourcesDirectory*: cint
    directoryEntry*: cint
    dataString*: cint
    dataEntry*: cint

  count_output_node_t* {.bycopy.} = object
    kind*: NODE_TYPE_PERES

  pe_final_output_t* {.bycopy.} = object
    err*: pe_err_e
    resourcesDirectory*: ptr type_RDT_RESOURCE_DIRECTORY
    directoryEntry*: ptr type_RDT_DIRECTORY_ENTRY
    dataString*: ptr type_RDT_DATA_STRING
    dataEntry*: ptr type_RDT_DATA_ENTRY

