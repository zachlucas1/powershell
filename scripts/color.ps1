<#
Program Name : <Color Guess>
Date: <10/14/2021>
Author: <Zach Lucas>
Corse: CIT361
I, <Zach Lucas>, affirm that I wrote this script as original work completed by me.
#> 

#this is used to end the game when the user wants
$game = $True

#grabs colors that the computer knows
$SystemColors = [System.Enum]::getvalues([System.ConsoleColor])

write-host "Can you guess what color the computer chose?"
write-host ""

#to continue playing until the end
while ($game -eq $True) {
$roundCount = 0
$continuePlay = 1
$numberOfGuesses = @()
[string]$computerChoice = [System.Enum]::getvalues([System.ConsoleColor])|get-random
$timer =  [System.Diagnostics.Stopwatch]::StartNew()

#user choices
while ($continuePlay -eq 1){
$userChoice = read-host @'
Please Select:
1. Guess Color
2. Get Available Colors
3. Get a Hint
4. See All Guessed Colors
5. Quit

'@
write-host ""

#the switch for potential input
switch -Wildcard ($userChoice){
    {$_ -eq '1' -or $_ -like 'gue*'}{$userChoice = 1}
    {$_ -eq '2' -or $_ -like 'av*'}{$userChoice = 2}
    {$_ -eq '3' -or $_ -like 'h*'}{$userChoice = 3}
    {$_ -eq '4' -or $_ -like 's*'}{$userChoice = 4}
    {$_ -eq '5' -or $_ -like 'q*'}{$userChoice = 5}
    Default {'Invalid choice, please try again'}
}

#guess color choice
if ($userChoice -eq 1) {
    $guess = Read-Host "What is your guess?"
    Write-Host ""
    #counts the rounds for late output
    $roundCount = $roundCount + 1
    
        if ($SystemColors -eq $guess) {
            if ($guess -eq $computerChoice) {

                #Adds to the number of guesses for later output
                $numberOfGuesses += $guess

                #outputs correct answer with color highlighting
                Write-Host -nonewline;write-host $computerChoice -ForegroundColor $computerChoice -nonewline;write-host " is correct!"

                #outputs round counts
                Write-Host "It took $roundCount rounds for you to find the color."
                write-host "It took " -nonewline;write-host $timer.Elapsed.seconds  "seconds for you to finish the round."
                #asks the user if they want to play again
                $PlayAgain = read-host "Would you like to play again? (Y/N)"
                write-host ""
                switch -Wildcard ($PlayAgain){
                    {$PlayAgain -eq 'y'} {$continuePlay = 0}
                    {$PlayAgain -eq 'n'} {write-host "Thanks for playing.";$continuePlay = 0;$game = $False;$timer.stop()}
                    default {'Invalid command, please try again'}
                }
            }
            #If the user inputs a wrong color
            elseif ($guess -ne $computerChoice) {
                Write-Host -nonewline; write-host $guess -ForegroundColor $guess -nonewline; " is not correct, please try again."
                Write-Host ""
                $numberOfGuesses += $guess
            }

            }
            #if the user inputs something that isn't on the list
            else{
                Write-Host "That is not a valid color, please try again."
            Write-Host ""
            }
    }
                #prints system colors
                if ($userChoice -eq 2) {
                    $SystemColors
                    write-host ""
                }
            #prints a hint, the first if statement is if the word is a "dark" word so it at least gives them the first letter after dark.
            if ($userChoice -eq 3) {
                if ($computerChoice[0] -eq 'D') {
                write-host  "The color starts with Dark"$computerChoice[4]
                write-host ""
                }
                else{
                    write-host "The color starts with" $computerChoice[0]
                    write-host ""
                }
            }
        #gives a list of guesses
        if ($userChoice -eq 4){
            write-host "So far you have guessed:"
            $numberOfGuesses
            write-host ""
        }
#If the user wants to quit
if ($userChoice -eq 5) {
    write-host "Thanks for playing, come again soon!"
    $continuePlay = 0
    $playAgain = $False
    $timer.Stop()
}
}
}