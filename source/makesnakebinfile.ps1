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