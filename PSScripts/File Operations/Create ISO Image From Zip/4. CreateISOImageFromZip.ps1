﻿$ZipFIle = "D:\Installs\W1DVD.zip"
$TmpLocation = 'D:\Temp2'
$ISOName = 'NAV_10_RTM_W1'
$IsoFileName = 'D:\Installs' + "\$ISOName.iso"


IF (Test-Path $TmpLocation){
    if (Confirm-YesOrNo -title "Remove $TmpLocation" -message "Do you want to remove $TmpLocation ?") {
        Remove-Item -Path $TmpLocation -Recurse
    } else { 
        Write-Error "'$TmpLocation' should not exist.  Please remove first"
        break
    }
}
New-Item -ItemType directory -Path $TmpLocation 

write-host "Unzipping to '$TmpLocation'" 
Unzip-Item -SourcePath $ZipFIle -DestinationPath $TmpLocation

Write-host "Creating ISO file '$ISOFileName'"
New-ISOFileFromFolder -FilePath $TmpLocation -Name $ISOName -ResultFullFileName $IsoFileName
