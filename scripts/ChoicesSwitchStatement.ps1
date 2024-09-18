$command=Read-Host @'
What would you like to do?
1. Start
2. Stop
3. Continue
5. Quit
Enter Choice
'@

# # You can either type 1..4 or start..quit for it to work
# switch -Wildcard ($command) { 
#     {$_ -eq '1' -or $_ -like 'sta*'}{'Starting'}
#     {$_ -eq '2' -or $_ -like 'sto*'}{'Stopping'}
#     {$_ -eq '3' -or $_ -like 'c*'}{'Continuing'}
#     {$_ -eq '4' -or $_ -like 'q*'}{'Quitting'}
#     Default {'Invalid Command'}
# }

switch -Wildcard ($command) { 
    '1' {'Starting'}
    'st*' {'Starting'}
    '2' {'Stopping'}
    'st*' {'Stopping'}
    '3' {'Continuing'}
    'c*' {'Continuing'}
    '4' {'Quitting'}
    'q*' {'Quitting'}
    Default {'Invalid Command'}
}

# switch -Wildcard ($command) { 
#     '1' {'Starting'}
#     '2' {'Stopping'}
#     '3' {'Continuing'}
#     '4' {'Quitting'}
#     Default {'Invalid Command'}
# }

# switch (1) {
#     1 {
#         'this matches'
#         break
#     }
#     2 {'this doesn''t'}
#     1 {'so does this'}
#     Default {}
# }