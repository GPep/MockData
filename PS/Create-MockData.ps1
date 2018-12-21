function Create-MockData
{
    [CmdletBinding()]
	param
	(
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$ComputerName,

    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Source,

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$sa = 'C4rb0n'
    )

#Create-MockData -ComputerName DV-SQLCLN-01 -Source 'C:\Users\pepperg\Documents\GitHubMockData'


 process
	{
		try
		{


        IF (!(Get-Module -Name sqlps))
    {
        Write-Host 'Loading SQLPS Module' -ForegroundColor DarkYellow
        Push-Location
        Import-Module sqlps -DisableNameChecking
        Pop-Location
    }

    $logFile = $Source+'\log.txt'
    if (!(Test-Path $logfile))
    {
    New-Item -path $Source -name log.txt -type "file"
    }
    ELSE
    {
    Clear-Content -Path $logFile
    }
    $Time = Get-Date
    "*********Database Creation started at $Time ***********" | out-file $logFile -append


    #Test Connection first

    $Connection = Test-SqlConnection -ComputerName $ComputerName -ErrorAction Stop

    IF ($Connection -eq $false)
    {
    Write-Host "Connection to $computerName Could not be established. Install Cancelled"
    "Connection to $computerName Could not be established. Install cancelled at $time" | out-file $logFile -append
    Exit
    }


    #check sa login is valid
    $SAExists = get-SALogin -ComputerName $computerName -SA $sa
    
    IF ($SAExists -eq $false)
    {
    write-Host "SA account $sa could no be verified. Installed Cancelled"
    "SA Account $sa could not be verified. Install Cancelled" | out-file $login -Append
    Exit
    }

    write-host "DB Creation about to start"

    $database = 'MockData'

    "DB Creation about to start" | out-file $logFile -append

    Create-DB $ComputerName $Source -ErrorAction Stop

    Populate-DB $ComputerName $Source -ErrorAction Stop

    Create-Sps $ComputerName $Source -ErrorAction Stop

    Create-Fns $ComputerName $Source -ErrorAction Stop

    set-Owner $ComputerName $Database $sa -ErrorAction Stop
       

    }
    catch
		{
            $ErrorMessage = $_.Exception.Message
            Write-Error -Message $ErrorMessage
            "Install of $failed @ $time :  $errorMessage " | out-file $logFile -append
			           
		}

    Finally
    {
       

       "*******************completed at $Time ***************" | out-file $logFile -append
       Exit
    }
   }

}


function Create-DB
{
	[CmdletBinding()]
	param
	(
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$ComputerName,
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Source

	)
	process
	{
		try
		{
		$DBRoot = $Source + "\CreateDB"
        $Sql = Get-ChildItem $Dbroot |  Where-Object {$_.Name -eq "MuckleDB_Create_Script.sql"}
        write-host "The Database will now be created" -BackgroundColor DarkGreen -ForegroundColor Yellow
                
 
        Write-Host "Running Script : " $sql.Name -BackgroundColor DarkGreen -ForegroundColor White
        $query = $sql.FullName
        Invoke-Sqlcmd -ServerInstance $ComputerName -InputFile $query -QueryTimeout 0
        Write-Host "Creating Database Object " $sql.Name -BackgroundColor DarkGreen -ForegroundColor White          
              

        write-Host "Database Created Successfully" -BackgroundColor DarkGreen -ForegroundColor Yellow
        "Database Object Created at $Time" | out-file $logFile -append

		}
		catch
		{
            $ErrorMessage = $_.Exception.Message
            Write-Error -Message $ErrorMessage
            $ErrorMessage | out-File $logFile -append
		}
	}
}



function Create-SPs
{
	[CmdletBinding()]
	param
	(
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$ComputerName,
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Source
	)
	process
	{
		try
		{
        $SPRoot = $Source + "\SPs"
        $SPScripts = Get-ChildItem $SPRoot | Where-Object {$_.Extension -eq ".sql"} | sort-object -desc
		write-host "Creating Stored Procedures...." -BackgroundColor DarkGreen -ForegroundColor Yellow
        
        foreach ($s in $SPscripts)
    {

 
        Write-Host "Running Script : " $s.Name -BackgroundColor DarkGreen -ForegroundColor White
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $ComputerName -InputFile $script
               
    }
        write-host "Stored Procedures created successfully" -BackgroundColor DarkGreen -ForegroundColor Yellow
        "Stored Procedures Created at $Time" | out-file $logFile -append

		}
		catch
		{
            $ErrorMessage = $_.Exception.Message
            Write-Error -Message $ErrorMessage
            $ErrorMessage| out-file $logFile -append
		}
	}
}


function Create-Fns
{
	[CmdletBinding()]
	param
	(
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$ComputerName,
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Source
	)
	process
	{
		try
		{
        $FNRoot = $Source + "\FNs"
        $FNScripts = Get-ChildItem $FNRoot| Where-Object {$_.Extension -eq ".sql"} | sort-object -desc
        write-host "Creating Functions..." -BackgroundColor DarkGreen -ForegroundColor Yellow
        foreach ($s in $FNScripts)
    {

 
        Write-Host "Running Script : " $s.Name -BackgroundColor DarkGreen -ForegroundColor White
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $ComputerName -InputFile $script
      

    }
        write-host "Functions created successfully" -BackgroundColor DarkGreen -ForegroundColor Yellow
        "Functions Created at $Time" | out-file $logFile -append

		}
		catch
		{
			$ErrorMessage = $_.Exception.Message
            Write-Error -Message $ErrorMessage
            $ErrorMessage| out-file $logFile -append
		}
	}
}


Function Set-Owner
{

[CmdletBinding()]
	param
	(
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$ComputerName,

    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Database,

    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$sa
     )

    Process

    {

    Try 
    {


    $SQLQRY = "ALTER AUTHORIZATION ON DATABASE:: $database to $sa"
    Invoke-Sqlcmd -ServerInstance $ComputerName -query $SQLQRY

    Write-Host "Database Owner Changed to $sa" -BackgroundColor DarkGreen -ForegroundColor Yellow
    "Owner changed at $Time" | out-file $logFile -append

    }



    Catch
    {
    $ErrorMessage = $_.Exception.Message
    Write-Error -Message $ErrorMessage
    $ErrorMessage| out-file $logFile -append
    }

    }

}

Function get-SALogin

{


Param(
          [ValidateLength(0,100)][string]$ComputerName
        , [ValidateLength(0,80)][string]$SA
)
Process

{
$exists = $false

try 
    {


    $srv = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $ComputerName
    #This sets the connection to mixed-mode authentication 
    $srv.ConnectionContext.LoginSecure=$true; 
    $dbs=$srv.Logins
    if($dbs.contains($SA))
        {
        Write-Host  "$sa found"
        $Exists = $true
        }

        else
        {
        write-host "$sa Not Found"
        $Exists = $false
        }


    }
    
catch 

    {
    $ErrorMessage = $_.Exception.Message
    Write-Error -Message $ErrorMessage
    }

}

}

function test-SQLConnection

{
[OutputType([bool])]
Param(
     [ValidateLength(0,100)]
     [string]$ComputerName
)
Process

{
$ServerExists = $false

try 
    {

    

    $srv = New-Object System.Data.SqlClient.SqlConnection
    $srv.ConnectionString = "Data Source=$computerName; Database=master;Integrated Security=True;"
    $srv.Open()
    $srv.Close()
    $serverExists = $true
    return $ServerExists
    }

    Catch

    {
    $serverExists = $false     
    $ErrorMessage = $_.Exception.Message
    Write-Error -Message $ErrorMessage
    Return $ServerExists
    }

}

}




Function Populate-DB
{
	[CmdletBinding()]
	param
	(
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$ComputerName,
    [Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[string]$Source
	)
	process
	{
		try
		{


       $FNRoot = $Source + "\Populate"
        $FNScripts = Get-ChildItem $FNRoot| Where-Object {$_.Extension -eq ".sql"} | sort-object -desc
        write-host "Populating Database..." -BackgroundColor DarkGreen -ForegroundColor Yellow
        
        
        foreach ($s in $FNScripts)
    {

 
        Write-Host "Running Script : " $s.Name -BackgroundColor DarkGreen -ForegroundColor White
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $ComputerName -InputFile $script
      

    }
        write-host "Database Populated successfully" -BackgroundColor DarkGreen -ForegroundColor Yellow
        "Database Populated at $Time" | out-file $logFile -append




		}
		catch
		{
            $ErrorMessage = $_.Exception.Message
            Write-Error -Message $ErrorMessage
            $ErrorMessage| out-file $logFile -append
		}
	}
}
