# function basicAddition {
#     $result = 1 + 1
#     Write-Host $result
# }
# basicAddition

# function modulus {
#     $result = 5 % 4
#     Write-Host $result
# }
# modulus

# function additionWithTypes {
#     $result = 5 + '5'
#     Write-Host $result
#     Write-Host $result.GetType()

#     $result = '5' + 5
#     Write-Host $result
#     Write-Host $result.GetType()
# }
# additionWithTypes

# function arrayAddition {
#     $result = 1,2,3 + '4'
#     Write-Host $result
# }
# arrayAddition

# function additionWithArray {
#     $result = 1,2,3 + 'asdf'
#     Write-Host $result
# }
# additionWithArray

# function multiplicationWithArray {
#     $result = 1,2 * 3
#     Write-Host $result
#     $result = ,'abc' * 3
#     Write-Host $result
# }
# multiplicationWithArray

# function multiplicationWithArray {
#     $result = 1,2 * '3'
#     Write-Host $result
# }
# multiplicationWithArray

function divideArray {
    $result = 1,2,3,4 / 2
    Write-Host $result
}
divideArray