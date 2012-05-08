## edid-rw: A utility to read and write a display EDID value

This utility will read and/or write a display's EDID data structure. Use
it with the edid-decode utility to view and check an EDID.
You can also write new EDID data to attempt to fix a corrupt EDID.

*WARNING - THIS UTILITY CAN DESTROY YOUR MONITOR IF YOU RUN IT
INCORRECTLY. Be very sure you understand what you are doing.*

You may have to disable output to the display before you can write the
EDID.

## Installation

Prerequisites (e.g. on Debian/Ubuntu):

    sudo apt-get install edid-decode
    sudo apt-get install python-smbus


Get source code:

    git clone https://github.com/bulletmark/edid-rw
    cd edid-rw

## Usage

Must start ic2 device module once each time after reboot:

    sudo modprobe i2c-dev

Fetch and decode display 0 EDID data:

    sudo ./edid-rw 0 | edid-decode

Fetch and decode display 1 EDID data:

    sudo ./edid-rw 1 | edid-decode

Capture display 0 EDID data, edit it, and write it back to device. Use
`!xxd [-r]` within vim to read, edit, and write binary file. See `:h xxd`
within vim help. You must always set the checksum (last) byte
correctly. edid-rw will validate the checksum and will not write an
invalid EDID.

    sudo ./edid-rw 0 >edid.bin
    vim -b edid.bin
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

## Change History

v1.0: Original version.

<!-- vim: se ai syn=markdown: -->
