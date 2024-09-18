$csb=[System.Data.Odbc.OdbcConnectionStringBuilder]::new()
$csb.Driver= 'Microsoft Access Driver (*.mdb)'
$csb.add('dbq','c:\Users\Zach\psfiles\data\gems.mdb')

$con=[System.Data.Odbc.OdbcConnection]::new($csb.ConnectionString)

$cmd=[System.Data.Odbc.OdbcCommand]::new('Select * from gem', $con)

$con.Open()

$reader=$cmd.ExecuteReader()
while ($reader.Read()) {
    Write-Host $reader['Mineral'] $reader['hardness']
}
$reader.Close()
$con.Close()