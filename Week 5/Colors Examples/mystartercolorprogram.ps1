<#
Program Name : <Guess my Facorite Color>
Date: <10/11/2021>
Author: <Zach Lucas>
Corse: CIT361
I, <Zach Lucas>, affirm that I wrote this script as original work completed by me.
#> 
$colorList = [System.Enum]::getvalues([System.ConsoleColor])

do {

$randomColor = $colorList | Get-Random

foreach ($color in $colorList) {
    write-host $color -f $color -nonewline " "
}

write-host " "
Write-Host "For Debugging, the random color is "
write-host $randomColor -ForegroundColor $randomColor

    $userGuess = Read-host "Guess which color the computer picked from the list above"
    if ($userGuess -ne $randomColor) {
        Write-Host "That is not correct, please try again"
    }elseif($userGuess -eq $randomColor) {
    Write-Host "You got it right! The answer was:" -nonewline
    write-host $randomColor -ForegroundColor $randomColor
    $userSelection = Read-host "Would you like to play again? (Y/N)"
    if ($userSelection -eq 'N') {
        $playAgain = $false
        }
    else {
        $playAgain = $true
        }
    }
}until ($playAgain -eq $false)

# <#
# Program Name : <Guess my Facorite Color>
# Date: <10/11/2021>
# Author: <Zach Lucas>
# Corse: CIT361
# I, <Zach Lucas>, affirm that I wrote this script as original work completed by me.
# #> 

# #this keeps the loop going until the user wants to stop playing
# $playAgain = $true

# do {
#     #gets list of colors from computer
#     $colorList = [System.Enum]::getvalues([System.ConsoleColor])
#     #from above list it will add a color font to each color in the list
#     $SystemColors = $colorList | %{ Write-Host "$_" -ForegroundColor $_ -nonewline ' '}
#     #from the list it will grab a random color
#     $randomColor = [System.Enum]::getvalues([System.ConsoleColor]) | Get-Random
#     #$computerAnswer = write-host $randomColor -ForegroundColor $randomcolor

#     #prints the colors
#     write-host $SystemColors
#     #asks the user what color they think the computer chose
#     write-host ""
#     Write-Host "For Debugging, the random color is "
#     write-host $randomColor -ForegroundColor $randomColor
#     do{
#         $userGuess = Read-host "Guess which color the computer picked from the list above"
#         if ($userGuess -ne $randomColor) {
#             Write-Host "That is not correct, please try again"
#         }else {
            
#         }
#     }until($userGuess -eq $randomColor){
#         Write-Host "You got it right! The answer was:" -nonewline
#         write-host $randomColor -ForegroundColor $randomColor
#         $userSelection = Read-host "Would you like to play again? (Y/N)"
#         if ($userSelection -eq 'N') {
#             $playAgain = $false
#         }
#     }
# }until ($playAgain -eq $false)

