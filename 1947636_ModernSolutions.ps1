Function KillThatProcess()
{
do{
$processName = Read-Host "What process would you like to end?"
$processCount = (Get-Process $processName).count

    if($processCount -eq 0)
    {
        Write-Host -nonewline "Error! There are no processes with the name "
        Write-Host -f Magenta "$processName" 
    }

}while($processCount -eq 0)

Write-Host -nonewline "There are "
write-host -nonewline -f Magenta "$processCount"
Write-Host -nonewline " processes named "
Write-Host -nonewline -f Magenta "$processName"
Write-Host ", Would you like to continue? Y/N"
$Confirm = Read-Host

    if($Confirm -eq "Y")
    {
        Stop-Process -name $processName
        Write-Host "Program has finished"
    }
    else
    {
        Write-Host "Program was cancelled"
    }
}



function Bamboozle()
{
    $filePath = [string](Get-Location)

    $randomLetter = [char]((65..90) | Get-Random)

    Write-Host -ForegroundColor Green "bread"
    Write-Host -NoNewline -ForegroundColor Green "Any files with the letter "
    Write-Host -NoNewline -ForegroundColor Magenta $randomLetter
    Write-Host -NoNewline -ForegroundColor Green " have been removed."

    Get-ChildItem *$randomLetter**.* | remove-item -WhatIf
    
}
