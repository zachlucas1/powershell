<# Program Name : Get IP Network 
<program> Date: 10/28/21 
Author(s): <yourname(s)> Corse: CIT361 I, Zach Lucas, affirm that I wrote this script as original work completed by me. #>

#This will convert IP Addresses and Subnet Masks to a net.ipaddress datatype and use the -band cmdlet to change the binary
function Get-IPNetwork {
    param (
        $IPAddress,
        $SubnetMask
    )
    $ConvertIP = [net.ipaddress]$IPAddress
    $ConvertSubnet = [net.ipaddress]$SubnetMask
    $ConvertAddress = [net.ipaddress]($ConvertIP.Address -band $ConvertSubnet.Address)
    return $ConvertAddress
}

#This will get two IP Addresses and a Subnet mask from a user and use the Get-IPNetwork function to do all the conversion and calculation
function Test-IPNetwork {
    param (
        $IPAddress1,
        $IPAddress2,
        $SubnetMask
    )
    $IP1 = Get-IPNetwork $IPAddress1 $SubnetMask
    $IP2 = Get-IPNetwork $IPAddress2 $SubnetMask
    Write-Output $IP1 $IP2
    if ($IP1.Address -eq $IP2.Address) {
        Write-Host "These two IP Addresses are on the same network." -foregroundcolor Blue
    }
    else {
        Write-Host "These two IP Addresses are not on the same network." -foregroundcolor Red
    }
}

#the user input
$UserIP1 = Read-Host "Please enter the first IP Address"
$UserIP2 = Read-Host "Please enter the second IP Address"
$UserSubnet = Read-Host "Please enter the Subnet Mask"

#input user input into the function
Test-IPNetwork $UserIP1 $UserIP2 $UserSubnet