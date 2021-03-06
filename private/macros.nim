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

template LIBPE_PTR_ADD*(p, o: untyped): untyped =
  (cast[pointer]((cast[cstring]((p)) + (o))))

template LIBPE_SIZEOF_ARRAY*(array: untyped): untyped =
  (sizeof((array) div sizeof((array[0]))))

template LIBPE_SIZEOF_MEMBER*(`type`, member: untyped): untyped =
  sizeof(((cast[ptr `type`](0)).member))
