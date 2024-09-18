<#
Program Name : <Manipulating Text Data>
Date: <11/13/2021>
Author: <Zach Lucas>
Corse: CIT361
I, Zach Lucas, affirm that I wrote this script as original work completed by me.
#>
function Get-MACVendor {
    param (
        [parameter(Mandatory=$true)]
        $DatabasePath,
        $MACAddress
    )

    #error if there are path issues
    if(-not(Test-path $DatabasePath -PathType leaf))
    {
       Write-Host "Sorry, that path doesn't exist please try again"
    }

    #OStest to check for operating system
    else{
        $OSTest = [String]::IsNullOrEmpty($MACAddress)
        if($OSTest -eq $true) {
            #Linux compatibility
            if($IsLinux -eq $true){
                $MACAddress = pwsh -command  "(ip a |grep -o ..:..:..:..:..:..)"
            }
            #Windows and OSX compatibility
            else {
            $MACAddress = pwsh -command "Get-NetAdapter | % MacAddress"
            }
        }

        #gets conent of file provided
        $DBPath = get-content $DatabasePath

        #replaces user input of dashes with colons and only takes the first few characters
        Foreach( $MAC in $MACAddress){
            $NEW_MAC = ($MAC -replace "-",":")
            $DBPath | Select-String -pattern $NEW_MAC.substring(0,8)
            }
    }

}

function Format-Songs {
    param(
        [parameter(Mandatory=$true)]
        $SPath,
        $Path
    )

    #checks path
    if(-not(Test-path $SPath -PathType leaf)){
       Write-Host "Sorry, that path doesn't exist please try again"
    }

    #sorts the songs database into sections
    else{
        $SongsDatabase = Get-Content $SPath
        $sortSongs = $SongsDatabase | Sort-Object -property year| Sort-Object -Property Album|Format-Table Song, Album, Year, Notes
        $songTest = [string]::IsNullOrEmpty($Path)
        if ($songtest -eq $false) {
            $sortSongs | Out-File -Path $Path\RushSongs_SORTED.txt
            Write-Host "RushSongs_SORTED.txt was exported"
            if(-not(Test-path $SPath -PathType leaf)){
                Write-Host "Cannot export, invalid path was given."
            }
        }

        #outputs the songs file in downloads folder
        elseif ($songtest -eq $true) {
            $Path=$env:USERPROFILE
            $PathtxtFile = $sortSongs | Out-File $Path\Downloads\RushSongs_SORTED.txt
            $PathtxtFile
            Write-Host "RushSongs_SORTED.txt was exported to your downloads directory"
        }
    }
}

#user input 
$userChoice = Read-Host @"
Would you like to:
1. Get your MAC Address
2. List songs from the database
"@

#gives the option to print local MAC addresses of computer or searching for one
if ($userChoice -eq 1) {
    $question = Read-Host "Would you like to input a MAC address? y/n"
    if ($question -eq "y") {
        $MACAddress = Read-Host "Please enter MAC Address"
    }
    else {
    }
    $DatabasePath = Read-Host "What file would you like do use to compare? (use directory path if necessary)"
    Get-MACVendor $DatabasePath $MACAddress
}

#gives the user an option to print or export songs file
elseif ($userChoice -eq 2) {
    $SPath = Read-Host "What songs file would you like to use"
    $question2 = Read-Host "Would you like to:
    1. Export the sorted file
    2. View the sorted file
    "
    if ($question2 -eq 1) {
        Format-Songs $SPath
    }
    elseif ($question2 -eq 2) {
        Get-Content $SPath
    }

    #error catches
    else {
        Write-Host "Error, Please try again"
    }
}

else{
    Write-Host "Error, Please try again"
}