$dividend=Read-Host "Enter a dividend "
$divisor=Read-Host "Enter a divisor"

try {
    $quotient=$dividend/$divisor
    Write-Host "The answer my friend is $quotient" -f Green
}

catch [System.DivideByZeroException]{
    Write-Host "You can't divide by 0." -f red
}

catch{
    throw "something went wrong"
    # Write-Host "Something went wrong." -f red
    # $_.Exception.Message
}

finally{
    Write-Host "Thanks for doing math." -f Yellow
}

