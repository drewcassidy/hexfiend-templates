# .types = ( public.dds, dds );

requires 0 "44445320"
move 4
uint32 "Size"

section "Flags"
set flags [uint32]
sectionvalue [format 0x%0X $flags]
if {$flags & 0x1} {entry "Caps" 0x1 4 [expr [pos]-4]}
if {$flags & 0x2} {entry "Height" 0x2 4 [expr [pos]-4]}
if {$flags & 0x4} {entry "Width" 0x4 4 [expr [pos]-4]}
if {$flags & 0x8} {entry "Pitch" 0x8 4 [expr [pos]-4]}
if {$flags & 0x1000} {entry "Pixel Format" 0x1000 4 [expr [pos]-4]}
if {$flags & 0x20000} {entry "Mipmap Count" 0x20000 4 [expr [pos]-4]}
if {$flags & 0x80000} {entry "Linear Size" 0x80000 4 [expr [pos]-4]}
if {$flags & 0x800000} {entry "Depth" 0x800000 4 [expr [pos]-4]}
endsection

uint32 "Height"
uint32 "Width"
uint32 "Pitch Or Linear Size"
uint32 "Depth"
uint32 "MipMap Count"
move 44

section "Pixel Format"
uint32 "Size"

section "Flags"
set flags [uint32]
sectionvalue [format 0x%0X $flags]
if {$flags & 0x1} {entry "Alpha Pixels" 0x1 4 [expr [pos]-4]}
if {$flags & 0x2} {entry "Alpha" 0x2 4 [expr [pos]-4]}
if {$flags & 0x4} {entry "FourCC" 0x4 4 [expr [pos]-4]}
if {$flags & 0x40} {entry "RGB" 0x40 4 [expr [pos]-4]}
if {$flags & 0x200} {entry "YUV" 0x200 4 [expr [pos]-4]}
if {$flags & 0x20000} {entry "Luminance" 0x20000 4 [expr [pos]-4]}
endsection

ascii 4 "FourCC"
uint32 "RGB Bit Count"
uint32 -hex "Red Bitmask"
uint32 -hex "Green Bitmask"
uint32 -hex "Blue Bitmask"
uint32 -hex "Alpha Bitmask"
endsection

uint32 -hex "Caps1"
uint32 -hex "Caps2"
uint32 -hex "Caps3"
uint32 -hex "Caps4"
move 4

bytes eof "Compressed Data"