$yours=Read-Host "What is your favorite color?"
$mine='blue'
if($yours -eq $mine){
    Write-Host 'Our favorite colors are the same!'
}
else {
    "We don't have the same favorite color."
}