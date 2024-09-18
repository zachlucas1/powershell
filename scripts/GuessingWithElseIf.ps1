# The breakpoint (red dot) is used to see what the correct answer is in the run and debug window
$answer=Get-Random -Minimum 1 -Maximum 100
$guess=Read-Host "What is your guess?"
if($answer -gt $guess){
    "Higher"
}elseif ($answer -lt $guess) {
    "Lower"
}else {
    "Correct"
}