# Ask which file it is
Write-Host "Gotta go FAST!!!!!!!!!!!!!!!!!!What number are we on............? Remember it's a four digit number" 
$filenumber = Read-Host 

$filenames = Get-ChildItem -path C:\Users\Gingie\Desktop\gcodescript;

$end2 = $filenames.Length

$whichfile = 0
#take out the gcodes
for($x=0;$x -lt $end2;$x++)
{
    If($filenames[$x].tostring().contains('.gcode'))
    {
        $filenames[$x] = 0
    }
}
for($x=0;$x -lt $end2;$x++)
{
    If($filenames[$x].tostring().contains('.GCODE'))
    {
        $filenames[$x] = 0
    }
}


#take out the pngs
for($x=0;$x -lt $end2;$x++)
{
    If($filenames[$x].tostring().contains('.png'))
    {
        $filenames[$x] = 0
    }
}
#search for the actual file
for($x=0;$x -lt $end2;$x++)
{
    If($filenames[$x].tostring().contains($filenumber))
    {
        $whichfile = $filenames[$x].tostring()
    }
}


# File to change
$file = 'C:\Users\Gingie\Desktop\gcodescript\' + $whichfile
$newfile = 'C:\Users\Gingie\Desktop\gcodescript\full_' + $filenumber + '.gcode'

# Get file content and store it into $content variable
$content = Get-Content -path $file
$end = $content.Length


for($x=0;$x -lt $end;$x++)
{

    if($content[$x].contains('G00'))
    {
        $content[$x] = $content[$x] + " F5000"
    }
}



# Set the new content
$content | Set-Content -Path $newfile