function Greet($name) {
    "Hi $name"
}

function Add($n1,$n2) {
    $n1+$n2
}
#This can export only the greet function
#Export-ModuleMember -Function 'greet'