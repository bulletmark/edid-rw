## edid-rw: A utility to read and write a display EDID value

This utility will read and/or write a display's EDID data structure. Use
it with the edid-decode utility to view and check an EDID.
You can also write new EDID data to attempt to fix a corrupt EDID.

*WARNING - THIS UTILITY CAN DESTROY YOUR DISPLAY IF RUN INCORRECTLY. Be
very sure you understand what you are doing.*

You may have to disable output to the display before you can write the
EDID.

## Installation

Requires python smbus module and edid-decode utility.

Install these prerequisites on Debian/Ubuntu:

    sudo apt-get install python-smbus edid-decode

Or, install these prerequisites on Arch:

    yaourt -S i2c-tools edid-decode-git

Get this source code:

    git clone https://github.com/bulletmark/edid-rw
    cd edid-rw

## Usage

Run with `-h` switch to see usage and optional arguments:

    ./edid-rw -h

Fetch and decode display 0 EDID data:

    sudo ./edid-rw 0 | edid-decode

Fetch and decode display 1 EDID data:

    sudo ./edid-rw 1 | edid-decode

Capture display 0 EDID data, edit it, and write it back to device. Use
`!Gxxd [-r]` within vim to read, edit, and write binary file. See `:h xxd`
within vim help. You should set the checksum (last) byte correctly
although edit-rw will calculate and set the checksum itself if you
include the `-f (--fix)` switch. edid-rw will always validate the
checksum and will not write an invalid EDID:

    sudo ./edid-rw 0 >edid.bin
    vim -b edid.bin # Then use xxd within vim, see ":h xxd" in vim
    sudo ./edid-rw -w 0 <edid.bin

## Author

Mark Blakeney, <mailto:markb@berlios.de>.

## License

Copyright (C) 2012 Mark Blakeney. This program is distributed under the
terms of the GNU General Public License.

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later
version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License at <http://www.gnu.org/licenses/> for more details.

<!-- vim: se ai syn=markdown: -->
