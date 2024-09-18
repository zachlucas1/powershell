<#
Program Name : <Network Module>
Date: <11/20/2021>
Author: <Zach Lucas>
Corse: CIT361
I, Zach Lucas, affirm that I wrote this script as original work completed by me.
#>

function Get-MACVendor {
    param(
        [Parameter(Mandatory)]
        [string]$Address
    )

    #asks the user for a file name
    $Database = read-host "Enter the file name of the MAC Database"

    #reads the filename from the user
    $getData = Get-Content $Database

    #replaces - with : of user input
    $convertedAddress += $Address -replace "-",":"

    #sets charachter length of user input
    try {$convertedAddress = $convertedAddress.Remove(8, ($convertedAddress.Length -8)) 
    } catch {
        write-host "" -nonewline
    }

    #if vendor cannot be found
    try{$FinalAddress = ($getData|Select-String $convertedAddress)}catch{"The vendor could not be found, please try again."}

    #return output
    $FinalMAC=[MAC]::new($convertedAddress) 
    $FinalMAC.Vendor=$FinalAddress
    return $FinalMAC
}

function Get-IPNetwork {
    param (
        $IPAddress,
        $SubnetMask
    )
    #converts IP address to net.ipaddress datatype
    $ConvertIP = [net.ipaddress]$IPAddress

    #converts subnet mask to ip address datatype
    $ConvertSubnet = [net.ipaddress]$SubnetMask

    #uses band property to output organized information
    $ConvertAddress = [net.ipaddress]($ConvertIP.Address -band $ConvertSubnet.Address)
    return $ConvertAddress
}

function Test-IPNetwork(){
    #asks user for input
    $IPAddress1 = Read-Host "Please enter the first IP Address"
    $IPAddress2 = Read-Host "Please enter the second IP Address"
    $SubnetMask = Read-Host "Please enter the Subnet Mask"

    #converts it with Get-IPNetwork function
    $IP1 = Get-IPNetwork $IPAddress1 $SubnetMask
    $IP2 = Get-IPNetwork $IPAddress2 $SubnetMask
    Write-Output $IP1 $IP2

    #shows if they are on the same network or not
    if ($IP1.Address -eq $IP2.Address) {
        Write-Host "These two IP Addresses are on the same network." -foregroundcolor Blue
    }
    else {
        Write-Host "These two IP Addresses are not on the same network." -foregroundcolor Red
    }
}

#assists other functions in the program
class MAC {
    [string]$Address
    [string]$Vendor

    #converts
    MAC([string]$Address){
        $convertedAddress += $Address -replace "-",":"
        $this.Address=$convertedAddress
    }

    [string]MACVendorID() {
        $MACAD1 = Get-MACVendor $this.Address
        return $MACAD1.Address
    }
    
    static[string]MACVendorID([string]$Address){ 
        $MACAD2 = (Get-MACVendor $Address)
        return $MACAD2.Address
    }
}
Export-ModuleMember -Function Get-MACVendor
Export-ModuleMember -Function Test-IPNetwork
Export-ModuleMember -Function Get-IPNetwork

#/Users/zacharylucas/Documents/School Stuff/College/Classes Fall 2021/Advanced Scripting/Week 10/Network/0.1/ZachLucasNetworkModule.psm1