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

##  resources types

type
  ResourceType* = enum
    RT_CURSOR = 1,              ##  cursor image
    RT_BITMAP = 2,              ##  bitmap (.bmp)
    RT_ICON = 3,                ##  icon
    RT_MENU = 4,                ##  menu
    RT_DIALOG = 5,              ##  dialog window
    RT_STRING = 6,              ##  unicode string
    RT_FONTDIR = 7,             ##  font directory
    RT_FONT = 8,                ##  font
    RT_ACCELERATOR = 9,         ##  hot keys
    RT_RCDATA = 10,             ##  data
    RT_MESSAGETABLE = 11,       ##  string table
    RT_GROUP_CURSOR = 12,       ##  cursor group
    RT_GROUP_ICON = 14,         ##  icon group
    RT_VERSION = 16,            ##  version information
    RT_DLGINCLUDE = 17,         ##  names of header files for dialogs (*.h) used by compiler
    RT_PLUGPLAY = 19,           ##  data determined by application
    RT_VXD = 20,                ##  vxd info
    RT_ANICURSOR = 21,          ##  animated cursor
    RT_ANIICON = 22,            ##  animated icon
    RT_HTML = 23,               ##  html page
    RT_MANIFEST = 24,           ##  manifest of Windows XP build
    RT_DLGINIT = 240,           ##  strings used for initiating some controls in dialogs
    RT_TOOLBAR = 241


type
  INNER_C_STRUCT_2975762136* {.bycopy.} = object
    NameOffset* {.bitsize: 31.}: uint32
    NameIsString* {.bitsize: 1.}: uint32

  INNER_C_UNION_1649692703* {.bycopy.} = object {.union.}
    name*: INNER_C_STRUCT_2975762136
    Name*: uint32

  INNER_C_STRUCT_2554152027* {.bycopy.} = object
    OffsetToDirectory* {.bitsize: 31.}: uint32
    DataIsDirectory* {.bitsize: 1.}: uint32

  INNER_C_UNION_3364318033* {.bycopy.} = object {.union.}
    OffsetToData*: uint32
    data*: INNER_C_STRUCT_2554152027

  IMAGE_RESOURCE_DIRECTORY* {.bycopy.} = object
    Characteristics*: uint32
    TimeDateStamp*: uint32
    MajorVersion*: uint16
    MinorVersion*: uint16
    NumberOfNamedEntries*: uint16
    NumberOfIdEntries*: uint16

  IMAGE_RESOURCE_DIRECTORY_ENTRY* {.bycopy.} = object
    DirectoryName*: INNER_C_UNION_1649692703
    DirectoryData*: INNER_C_UNION_3364318033

  IMAGE_RESOURCE_DATA_STRING* {.bycopy.} = object
    length*: uint16
    string*: array[1, uint16]

  IMAGE_RESOURCE_DATA_ENTRY* {.bycopy.} = object
    offsetToData*: uint32
    size*: uint32
    codePage*: uint32
    reserved*: uint32

  RESOURCE_ENTRY* {.bycopy.} = object
    name*: array[20, char]
    nameOffset*: uint32
    extension*: array[20, char]
    dirName*: array[20, char]

  VS_FIXEDFILEINFO* {.bycopy.} = object
    dwSignature*: uint32
    dwStrucVersion*: uint32
    dwFileVersionMS*: uint32
    dwFileVersionLS*: uint32
    dwProductVersionMS*: uint32
    dwProductVersionLS*: uint32
    dwFileFlagsMask*: uint32
    dwFileFlags*: uint32
    dwFileOS*: uint32
    dwFileType*: uint32
    dwFileSubtype*: uint32
    dwFileDateMS*: uint32
    dwFileDateLS*: uint32

