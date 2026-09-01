# Create 512 byte (1 Block) .hdv image from snake2.bin
$bin = [System.IO.File]::ReadAllBytes("$PSScriptRoot\..\bin\snake2.bin")

if ($bin.Length -gt 511) {
    Write-Error "snake2.bin too big $($bin.Length) for 1 Block .hdv (max 511 Bytes + 1 Byte Header)!"
    exit 1
}

$hdv = New-Object byte[] 512
$hdv[0] = 0x01
[Array]::Copy($bin, 0, $hdv, 1, $bin.Length)
[System.IO.File]::WriteAllBytes("$PSScriptRoot\..\disk\snake2.hdv", $hdv)


# Create 140k .dsk image from snake.bin
$bin = [System.IO.File]::ReadAllBytes("$PSScriptRoot\..\bin\snake.bin")

if ($bin.Length -gt 255) {
    Write-Error "snake.bin too big $($bin.Length) for 1 sector .dsk (max 255 Bytes + 1 Byte Header)!"
    exit 1
}

# create array with 143.360 Bytes (256 * 560) filled with 0x00
$dsk = New-Object byte[] (256 * 560)

# set first byte to 0x00, but already set by New-Object 
# $dsk[0] = 0x00

# copy binary data to index 1
[Array]::Copy($bin, 0, $dsk, 1, $bin.Length)

# save as .dsk
[System.IO.File]::WriteAllBytes("$PSScriptRoot\..\disk\snake.dsk", $dsk)


# Create binary to copy into a standard DOS disk
$bin = [System.IO.File]::ReadAllBytes("$PSScriptRoot\..\bin\snake.bin")

# load address (0x0801) and filesize as 16-Bit Little-Endian
$loadBytes = [BitConverter]::GetBytes([uint16]0x0801)
$sizeBytes = [BitConverter]::GetBytes([uint16]$bin.Length)

# create whole array (2 Bytes load address + 2 Bytes filesize + binary data)
$outBuffer = New-Object byte[] (4 + $bin.Length)

# copy Header & data 
[Array]::Copy($loadBytes, 0, $outBuffer, 0, 2)
[Array]::Copy($sizeBytes, 0, $outBuffer, 2, 2)
[Array]::Copy($bin,       0, $outBuffer, 4, $bin.Length)

# write output
[System.IO.File]::WriteAllBytes("$PSScriptRoot\..\bin\snakeloadable.bin", $outBuffer)