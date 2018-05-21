# & '.\03.利用可能な機能\02.Transaction Scope.ps1'
Clear-Host
$constring = New-Object System.Data.SqlClient.SqlConnectionStringBuilder
$constring.psbase.DataSource = "192.168.0.11"
$constring.psbase.UserId = "demouser"
$constring.psbase.Password = $ENV:SQLPASS
$constring.psbase.InitialCatalog = "DemoDB"
# $constring.psbase.Enlist = $false

$con = New-Object System.Data.SqlClient.SqlConnection
$con.ConnectionString = $constring

$con2 = New-Object System.Data.SqlClient.SqlConnection
$con2.ConnectionString = $constring

try{
    $scope = New-Object -TypeName System.Transactions.TransactionScope
    $con.Open()

    $cmd = $con.CreateCommand()

    $cmd.CommandType = [System.Data.CommandType]::Text

    $cmd.CommandText = "SELECT COUNT(*) FROM DTCT1"
    $reader = $cmd.ExecuteReader()
    while($reader.Read()){
        Write-Host ("DTCT1 Data Count [{0}]" -f $reader[0])
    }
    $reader.Close()

    $cmd.CommandText = "INSERT INTO DTCT1 VALUES(1)"
    $cmd.ExecuteNonQuery() > $null
    
    $cmd2 = $con.CreateCommand()

    $cmd2.CommandType = [System.Data.CommandType]::Text
    $cmd2.CommandText = "INSERT INTO DTCT1 VALUES(2)"
    $cmd2.ExecuteNonQuery() > $null
   
    # $con2.Open()

    $scope.Complete()

    Write-Host "Success"
}catch{
    $_.exception.message
    Write-Host "Exception"
}finally{
    $scope.Dispose()
    $cmd.CommandText = "SELECT COUNT(*) FROM DTCT1"
    $reader = $cmd.ExecuteReader()
    while($reader.Read()){
        Write-Host ("DTCT1 Data Count [{0}]" -f $reader[0])
    }
    $reader.Close()

    $con.Close()
    $con.Dispose()
}
