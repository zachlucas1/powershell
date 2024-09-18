<# 
Program Name: Guess My Favorite Color
Date: 10/12/2021
Author: Shane Witbeck
Course: CIT361
I, Shane Witbeck, affirm that I wrote this script as original work completed by me.
#>

write-host "Welcome to the guessing game! I'm thinking of a color, can you guess it?"
write-host ""
$gameplay = $True
$AllColors = [System.Enum]::getvalues([System.ConsoleColor])

while ($gameplay -eq $True) {
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
[string]$MyColor = [System.Enum]::getvalues([System.ConsoleColor])|get-random
$Rounds = 0
$GuessAttempts = 0
$dummyswitch = 1
$ArrayofGuesses = @()
while ($dummyswitch -eq 1){
$UserAnswer = read-host @'
Please Select:
1. Guess Color
2. Get Available Colors
3. Get a Hint
4. See All Guessed Colors
5. Quit
Enter Here:
'@
write-host ""

switch -Wildcard ($UserAnswer){
    {$UserAnswer -eq 1} {$UserAnswer = 1}
    {$UserAnswer -eq 2} {$UserAnswer = 2}
    {$UserAnswer -eq 3} {$UserAnswer = 3}
    {$UserAnswer -eq 4} {$UserAnswer = 4}
    {$UserAnswer -eq 5} {$UserAnswer = 5}
    default {'Invalid Command'}
}

if ($UserAnswer -eq 1){
    [string]$UserGuess = read-host "What color do you choose?"
    write-host ""
    $Rounds += 1
    
        if ($AllColors -eq $UserGuess) {
    
            if ($UserGuess -eq $MyColor) {
                $ArrayofGuesses += $UserGuess
                write-host "Correct, " -nonewline;write-host $MyColor -ForegroundColor $MyColor -nonewline;write-host " is my favorite color!" 
                write-host "It took you $Rounds tries to find my favorite color."
                write-host "It took you " -nonewline;write-host $stopwatch.Elapsed.Minutes -nonewline;write-host " minutes and " -nonewline;write-host $stopwatch.Elapsed.Seconds -nonewline;write-host " seconds to finish the round."
                $PlayAgain = read-host "Would you like to play again (y) or (n)?"
                write-host ""
                switch -Wildcard ($PlayAgain){
                    {$PlayAgain -eq 'y'} {$dummyswitch = 0}
                    {$PlayAgain -eq 'n'} {write-host "Thanks for playing!";$dummyswitch = 0;$gameplay = $False;$stopwatch.stop()}
                    default {'Invalid Command'}
                }

            }
            elseif ($UserGuess -ne $MyColor) {
                write-host "Sorry, " -nonewline; write-host $UserGuess -ForegroundColor $UserGuess -nonewline; " is not my favorite color. Try again!"
                write-host ""
                $ArrayofGuesses += $UserGuess
            }
        
            }
            else{
                write-host "Sorry, $UserGuess is not a valid color. Try again!"
                write-host ""
            }
        
    

        }
    }
}

if ($UserAnswer -eq 2) {
    write-host "Here's the list of available colors to choose from:"
    $AllColors
    write-host ""
}

if ($UserAnswer -eq 3) {
    if ($MyColor[0] -eq 'D') {
    write-host "Here's your hint, the color I'm thinking of starts with" $MyColor[0..4]
    write-host ""
    }
    else{
        write-host "Here's your hint, the color I'm thinking of starts with" $MyColor[0]
        write-host ""
    }
}

if ($UserAnswer -eq 4){
    write-host "Here are all of the colors you've guessed:"
    $ArrayofGuesses
    write-host ""
}


if ($UserAnswer -eq 5) {
    write-host "Thanks for playing!"
    $dummyswitch = 0
    $gameplay = $False
    $stopwatch.Stop()
}