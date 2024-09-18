








# function greet {'Hi'}\
# greet
# function greet {
#     if ($args.Count) {
#         "Hi $args"
#     }else {
#         "Who do you want to say hi to?"
#     }
# }
# greet 

# $num1=2
# $num2=3
# function Add ($num1, $num2){
#     write-host $num1 + $num2
# }
# Add

$foo = 1
function bar() {
    $foo = 2
}

bar
write-host $foo