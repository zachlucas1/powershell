<#
Program Name : <Rock, Paper, Scissors>
Date: <10/8/2021>
Author: <Zach Lucas>
Corse: CIT361
I, <Zach Lucas>, affirm that I wrote this script as original work completed by me.
#> 

$userScore = 0
$computerScore = 0
$playAgain = $true

do {
$userSelection=Read-Host @'

Rock, Paper, or Scissors?
1. Rock
2. Paper
3. Scissors
4. Quit
Enter Choice
'@ 

switch -Wildcard ($userSelection) { 
    {$_ -eq '1' -or $_ -like 'r*'}{$userSelection = 'Rock'}
    {$_ -eq '2' -or $_ -like 'p*'}{$userSelection = 'Paper'}
    {$_ -eq '3' -or $_ -like 's*'}{$userSelection = 'Scissors'}
    {$_ -eq '4' -or $_ -like 'q*'}{$userSelection = 'Quit'}
    Default {'Invalid Command'}
}

#selections
    $options = ("Rock", "Paper", "Scissors")
    $computerSelection = $options | Get-Random 

    # $userSelection=Read-Host "Rock, Paper, or Scissors?"
    if ($userSelection -eq "rock" -and $computerSelection -eq "paper"){
        $computerScore+=1
        Write-Host "You lost, the computer chose $computerSelection" -foregroundcolor Blue
        Write-Host " "
        Write-Host @"
----------------
SCORE
User: $userScore
Computer: $computerScore
----------------
"@
    }

    elseif ($userSelection -eq "paper" -and $computerSelection -eq "scissors"){
        $computerScore+=1
        Write-Host "You lost, the computer chose $computerSelection" -foregroundcolor Blue
        Write-Host " "
        Write-Host @"
----------------
SCORE
User: $userScore
Computer: $computerScore
----------------
"@
    }

    elseif ($userSelection -eq "scissors" -and $computerSelection -eq "rock"){
        $computerScore+=1
        Write-Host "You lost, the computer chose $computerSelection" -foregroundcolor Blue
        Write-Host " "
        Write-Host @"
----------------
SCORE
User: $userScore
Computer: $computerScore
----------------
"@
    }

    elseif ($userSelection -eq $computerSelection){
        Write-Host "It's a tie!" -foregroundcolor Blue
        Write-Host " "
        Write-Host @"
----------------
SCORE
User: $userScore
Computer: $computerScore
----------------
"@
    }

    elseif ($userSelection -eq 'Quit') {
        $playAgain = $false
    }

    else{
        Write-Host "You won! The computer chose $computerSelection" -foregroundcolor Blue
        $userScore +=1
        Write-Host " "
        Write-Host @"
----------------
SCORE
User: $userScore
Computer: $computerScore
----------------
"@
    }

    if (($userScore -eq 2) -or ($computerScore -eq 2)) {
        if ($userScore -eq 2) {
            Write-Host "You won the match!" -foregroundcolor Blue
        }
        else {
            Write-Host " "
            Write-Host "You lost the match" -foregroundcolor Blue
        }
        Write-Host "GAME OVER" -foregroundcolor red
        $playAgain = $false
    }

    if ($playAgain -eq $true) {
        Write-Host ""
        $response = Read-Host "Would you like to play again? Y/N"
        if ($response -eq 'N') {
            $playAgain = $false
        }
    }
} until ($playAgain -eq $false)