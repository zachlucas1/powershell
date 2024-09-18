<#
Program Name : <Loop da Loop>
Date: <10/1/2021>
Author: <Zach Lucas>
Corse: CIT361
I, <Zach Lucas>, affirm that I wrote this script as original work completed by me.
#> 

#While loop that outputs the numbers 5-10  in the format of 'Number #'
'While 5-10';'=' * 80
$number=4
while ($number -lt 10) 
{
    $number++
    Write-Host "Number $number"
}

#Do While loop that outputs the numbers from 100-150 counting by 10 in the format 'Number #'
'';'Do while 100-150 by 10s';'=' * 80
#Your code Here
$number=90
while ($number -lt 150) 
{
    $number +=10
    Write-Host "Number $number"
}

#Do Until loop that outputs the numbers from 1000 to 1500 counting by 100 in the format 'Number #'
'';'Do until 1000-1500 by 100s';'=' * 80
#Your code Here
$number=900
while ($number -lt 1500) 
{
    $number +=100
    Write-Host "Number $number"
}

#For loop that outputs the numbers from -5 to -1-  in the format 'Number #'
'';'For -5 to -10';'=' * 80
#Your code Here
$number=0
while ($number -gt -5) 
{
    $number -=1
    Write-Host "Number $number"
}

#Foreach loop that gets a list of files from the current directory and outputs the name and size in KB
'';'Foreach directory';'=' * 80
#Your code Here
Get-ChildItem | ForEach-Object -process {
    $_.Name; $_.length/1kb; 
    ' '
}


#Any loop that outputs the numbers from 1 to 10 skipping every third number using continue in the format 'Number #'
'';'Continue 1 to 10 skipping every third number';'=' * 80
#Your code Here
foreach($thirdNum in 1..10) {
    if  ($thirdNum %3 -eq 0) {
        continue
    }
    elseif ($thirdNum %6 -eq 0) {
        continue
    }
    elseif ($thirdNum %9 -eq 0) {
        Continue
    }
    write-host "Number" $thirdNum
}