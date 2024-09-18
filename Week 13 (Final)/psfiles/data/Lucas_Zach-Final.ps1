<#
Program Name : Final
Date: 12/6/2021
Author: Zach Lucas
Corse: CIT361
I, Zach Lucas, affirm that I wrote this script as original work completed by me.
#>

#PUT THIS IN THE DATA DIRECTORY OF PSFILES FOR IT TO WORK PROPERLY
#SET THE CURRENT DIRECTORY TO (\PSFILES\DATA)

#reads the file and stores in a variable
$gems = '.\gems.xml'
Write-Host ""

#Gets the file size in bytes
$gemSize = (Get-Item $gems).Length
Write-Host "Gems file size in bytes: $gemSize"
Write-Host ""

#Gets MD5 hash of file
Write-Host "The MD5 hash of the gems file is:"
Get-FileHash $gems -Algorithm MD5
Write-Host ""

#Gets number of gems in the file
[xml]$gemNumber = Get-Content $gems
Write-Host "The number of gems in the file is:"
$gemNumber.gems.gem|measure|Select-Object Count

#Gets average hardness of the gems
Write-Host "The average hardness of each gem is:"
Select-Xml -Path $gems -XPath '/gems/gem' | ForEach-Object {$_.Node.Hardness}|Measure-Object -Average|Select-Object Average 

#Creates a file that contains gems with a hardness greater than 7
[xml]$gemHardness = Get-Content $gems
$gemHardness.gems.gem | Where-Object {+$_.Hardness -GT 7}|Export-Csv -LiteralPath .\Lucas_Zach-hardgems.csv

#Reads doi.txt from current directory and counts words
$doi = Get-Content ../files/DOI.txt 
$doiWords = $doi | Measure-Object -Word |Select-Object Words
Write-Host "Number of words in doi.txt file:"
$doiWords

#Gets unique words from doi.txt file
$doiUniqueWords = $doi -split "\W" | Sort-Object -Unique
Write-Host "Number of unique words in doi.txt file:"
$doiUniqueWords | measure | Select-Object Count

#Creates a file that contains all the unique words and sorted by alphabetical order
$doiUniqueWords | Out-File -FilePath .\Lucas_Zach-words.txt