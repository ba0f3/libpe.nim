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
  IMAGE_DOS_HEADER* {.bycopy.} = object
    e_magic*: uint16
    e_cblp*: uint16
    e_cp*: uint16
    e_crlc*: uint16
    e_cparhdr*: uint16
    e_minalloc*: uint16
    e_maxalloc*: uint16
    e_ss*: uint16
    e_sp*: uint16
    e_csum*: uint16
    e_ip*: uint16
    e_cs*: uint16
    e_lfarlc*: uint16
    e_ovno*: uint16
    e_res*: array[4, uint16]
    e_oemid*: uint16
    e_oeminfo*: uint16
    e_res2*: array[10, uint16]
    e_lfanew*: uint32        ##  sizeof(IMAGE_DOS_HEADER) + size of MS-DOS stub

