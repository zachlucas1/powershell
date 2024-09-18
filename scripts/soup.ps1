function Get-Soup {
        <#
    .SYNOPSIS
    Pick your soup, size and quantity for later output, make sure to be polite!
    .DESCRIPTION
    This will grab your soup, size, and quantity and tell you if you truly deserve it if you say please.
    .EXAMPLE
    get-soup -Please -soup tomato -size cup -Quantity 2
    get-soup -soup potato -size bowl -Quantity 4
    #>
    [Alias('Soup')]
    param(
        [Parameter(Mandatory=$true)]
        $soup,
        [Parameter(Mandatory=$true)]
        [ValidateSet('cup','bowl','pot')]
        $size,
        [Parameter(Mandatory=$true)]
        [validateRange(1,5)]
        $Quantity = 1,
        [switch]$Please
    )
    if ($please) {
        "$Quantity $size$(if($Quantity -gt 1){'s'}) of $soup soup for you"
    }
    else {
        "No $soup soup for you!"
    }
}