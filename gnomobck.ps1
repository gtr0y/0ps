$date = Get-Date -Format ddMMyy-HHmm
$date
$path = "E:\Users\dma\Documents\My Games\Gnomoria\Worlds\"
$bckdir = "sav\"
$ext = ".sav"
$bckext = ".bck"
$file = "world05"
$source = $path + $file + $ext
$destshort = $path + $bckdir + $file 
$dest = $destshort + $bckext
if (Test-Path $source) { "Source Exists" 
  if (Test-Path $dest) {
    $target = $destshort + "." + $date
    "Destination Exists, Renaming to: " + $target
    Rename-Item $dest $target
    if (!(Test-Path $dest)) { "Renamed Successfully" } else { "Error Renaming" }
  } else { "No Destination File, Skipping Deletion" }
  "Copying..." 
  Copy-Item $source $dest
  if (Test-Path $dest) { "Copied Successfully" } else { "Error Copying" }
} else {  "No Source, Aborting Everything!" }