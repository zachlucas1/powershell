# param($n1,$n2)
# $n1+$n2

# #/.addit.ps1 -n1 100 200 = 300

# function hii {
#     [alias('hi')]
#     param([$string]$name)
#     "hi"
# }

function greet {
    <#
    .SYNOPSIS
    Greet your friend
    .EXAMPLE
    greet Chuck Brown
    #>
    [alias('hi')]
    param (
        [Parameter(
            Mandatory=$true,
            HelpMessage = "Enter your friends first name: "
        )]
        [alias('name','givenname')]
        [string]$firstname,
        [Alias('surname')]
        [string]$lastname
    )
    "Hello $firstname $lastname"
}
#to get this to work type . ./26InClass and then greet -firstname NAME -lastname NAME