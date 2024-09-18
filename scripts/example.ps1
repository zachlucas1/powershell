# function RPS{
#     $pshost = get-host
#     $pswindow = $pshost.ui.rawui
#     $newsize = $pswindow.buffersize
#     $newsize.height = 500
#     $newsize.width = 500
#     $pswindow.buffersize = $newsize
#     $newsize = $pswindow.windowsize
#     $newsize.height = 22
#     $newsize.width = 85
#     $pswindow.windowsize = $newsize
#     $pswindow.WindowTitle = "Rock, Paper, Scissors"
   
[int]$score = 0
[int]$computerscore = 0

do {
    $options = @("Rock","Paper","Scissors")
    $option = $options | Get-Random -Count 1
    Clear-Host
    Write-Host "Your Score - $score" -ForegroundColor Green
    Write-Host "Computer's Score - $computerscore" -ForegroundColor Red
    do {$selection = Read-Host "Selection"}while (("Rock","Paper","Scissors") -notcontains $selection)
    
    if ($selection -eq "rock" -and $option -eq "paper"){
    Write-Host "You lose, the computer chose $option";
    Start-Sleep -Seconds 1
    $computerscore = $computerscore + 1
    }elseif($selection -eq "paper" -and $option -eq "scissors"){
    Write-Host "You lose, the computer chose $option"
    Start-Sleep -Seconds 1
    $computerscore = $computerscore + 1
    }elseif($selection -eq "scissors" -and $option -eq "rock"){
    write-host "You lose, the computer chose $option"
    Start-Sleep -Seconds 1
    $computerscore = $computerscore + 1
    }elseif ($selection -eq $option){
    Write-Host "Its a draw"
    Start-Sleep -Seconds 1
    }else{
    Write-Host "You won, the computer chose $option"
    Start-Sleep -Seconds 1
    $score = $score + 1
    }
}until (($score -eq 3) -or ($computerscore -eq 3)) 
if ($computerscore -gt $score){
    Clear-Host
    Write-Host "You lost, the computer scored $computerscore points whilst you only scored $score points" -ForegroundColor Red
}else{
    Clear-Host
    Write-Host "You won, you got $score points. More than the computer's $computerscore" -ForegroundColor Green
}

do {$playagain = Read-Host "Do you want to play again? Y or N"} while (("Y","N") -notcontains $playagain)
if ($playagain -eq "y"){
    RPS
}elseif ($playagain -eq "n"){
    exit
}
