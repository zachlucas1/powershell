function Get-MACVendor{
    param (
        [Parameter(Mandatory=$true)]
        $DatabasePath,
        $MACAddress
    )
    #throw error
    if(-not(Test-path $DatabasePath -PathType leaf))
    {
       # if the file doesn't exist do something
       Write-Host "ERROR: Please type a valid Database Absolute Path"
    }
    else{
        $test = [String]::IsNullOrEmpty($MACAddress)
        if($test -eq $true) {
            if($IsLinux -eq $true){
                #check the cmd
                $MACAddress = pwsh -command "ip maddress | select-string link"
            }
            else {
            $MACAddress = pwsh -command "Get-NetAdapter | % MacAddress"
            }
        }
        $DatabasePath_DB = get-content $DatabasePath
        # set-location $PSScriptRoot
        Foreach( $MAC in $MACAddress){
            $NEW_MAC = ($MAC -replace "-",":")
            $DatabasePath_DB | Select-String -pattern $NEW_MAC.substring(0,8)
            }
    }
}
