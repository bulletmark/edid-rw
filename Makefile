# Copyright (C) 2012 Mark Blakeney. This program is distributed under
# the terms of the GNU General Public License.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License at <http://www.gnu.org/licenses/> for more
# details.

PROG = edid-rw
SRC = README.md
DOC = $(SRC:.md=.html)

doc:	$(DOC)

$(DOC): $(SRC)
	markdown $< >$@

check:
	flake8 $(PROG)
	vermin -i -q $(PROG)

install::
	install -CD $(PROG) ~/bin

clean::
	rm -rf $(DOC)
