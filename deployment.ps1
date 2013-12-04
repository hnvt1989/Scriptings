Set-StrictMode -Version 2.0



#======================== HELPER FUNCTIONS =====================================
function Expand-Zip 
(
    [ValidateNotNullOrEmpty()][string]$ZipFilePath,
    [ValidateNotNullOrEmpty()][string]$DestinationFolderPath,
    [switch]$HideProgressDialog,
    [switch]$OverwriteExistingFiles
)
{

    # Ensure that the zip file exists, the destination path is a folder, and the destination folder
    # exists. The code to expand the zip file will *only* execute if the three conditions above are
    # true.
    if ((Test-Path $ZipFilePath) -and (Test-Path $DestinationFolderPath) -and ((Get-Item $DestinationFolderPath).PSIsContainer))
    {
    Write-Host "Extracting................." -ForegroundColor Green
        try {
            # Configure the flags for the copy operation based on the switches passed to this
            # function. The flags for the CopyHere method are based on the SHFILEOPSTRUCT
            # structure's fFlags field. Two of the flags are leveraged by this function.
            # 0x04 --- Do not display a progress dialog box.
            # 0x10 --- Click "Yes to All" in any dialog box displayed. Functionally overwrites any
            #          existing files.
            $copyFlags = 0x00
            if ($HideProgressDialog)
            {
                $copyFlags += 0x04
            }
            
            if ($OverwriteExistingFiles)
            {
                $copyFlags += 0x10
            }
            
            # Create the Shell COM object
            $shell = New-Object -ComObject Shell.Application
            # Get references to the zip file and the destination folder as Shell Folder COM objects
            $zipFile = $shell.NameSpace($ZipFilePath)
            $destinationFolder = $shell.NameSpace($DestinationFolderPath)           
            # Execute a file copy from the zip file to the destination folder; which effectivel
            # extracts the zip file's contents to the destination folder
            $destinationFolder.CopyHere($zipFile.Items(), $copyFlags)
        } finally {
            # Release the COM objects
            if ($zipFile -ne $null)
            {
                [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($zipFile)
            }
            if ($destinationFolder -ne $null) {

                [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($destinationFolder)
            }
            if ($shell -ne $null) {                
                [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($shell)
            }
        }
    }
}


#========================  END OF HELPER FUNCTIONS =============================


$global:RTEPath ="$global:RTEServer\R$\8900_APPS\760_QA"             #RTE path that points to the sql setting file location
$global:RedisPath ="$ScriptLocation\redis-cli.exe"               #Redis client path
$BuildZipFile = ""
$BuildDirectory = ""
$global:BuildName = ""

#setting for deployment end

#==================== prepare to deploy =====================================
#stop the rte server
iex "cmd /c PsService $global:RTEServer stop $global:RTEService"

#start the site 1
iex "C:\Windows\System32\inetsrv\appcmd.exe stop stop '/site.name:$Site1'"
#start the appPool
foreach ($node in $global:AppPools)
{
    iex "C:\Windows\System32\inetsrv\appcmd.exe stop apppool '/apppool.name:$node'"
}

#remove files in the bak folder
Write-Host "Remove backed up file......................." -ForegroundColor Green
if((Test-Path "$global:BakupFolder\Shared") -eq $False)
{
    Write-Warning "Backup Shared folder does not exist"
}
else
{
    Remove-Item "$global:BakupFolder\Shared" -Recurse
}

if((Test-Path "$global:BakupFolder\Site") -eq $False)
{
    Write-Warning "Backup Site folder does not exist"
}
else
{
    Remove-Item "$global:BakupFolder\Site" -Recurse
}

#backup files....
Write-Host "Backing up files............................" -ForegroundColor Green
Copy-Item "$global:AppsFolder\Site" "$global:BakupFolder\Site" -Recurse
Copy-Item "$RTEPath\Shared" "$global:BakupFolder\Shared" -Recurse

#================== DEPLOYMENT =================================================

#delete the items in PackageReleaseFolder
Write-Host "Removing items in $global:PackageReleaseFolderPath " -ForegroundColor Green
foreach ($i in Get-ChildItem -Path $global:PackageReleaseFolderPath)
{
    Remove-Item $i.FullName -Force -Recurse
}


foreach ($i in Get-ChildItem -Path $global:BuildFolderPath)
{
    if($i.Extension -eq ".zip")
    {
    
        Copy-Item -Path $i.FullName -Destination $global:PackageReleaseFolderPath
        Write-Host "Copy file "  $i.FullName  " to "  $global:PackageReleaseFolderPath  " ...." -ForegroundColor Green
        break
    }
}

foreach ($i in Get-ChildItem -Path $global:PackageReleaseFolderPath)
{
    if($i.Extension -eq ".zip")
    {
        $BuildZipFile = $i.FullName
        $BuildName = $i.Name.Replace(".zip", "")
    }
}

#extracting file
$BuildDirectory = $BuildZipFile.Replace(".zip", "") 
New-Item $BuildDirectory -ItemType directory
Expand-Zip $BuildZipFile $BuildDirectory

#build !
#Copy-Item "$(get-location)\msbuildcmd.bat" "$BuildDirectory\$BuildName"
Write-Host "BUILD.........................................." -ForegroundColor Green
cd $BuildDirectory\$BuildName
msbuild /t:Deploy /p:DatabaseServer=$global:SqlServer /p:DatabaseName=$global:SqlDatabase /p:Cust=CUST000 /p:Version=7.6.0.0 /p:CacheServer=$global:RedisServer /p:CacheDatabase=$global:RedisDatabase

#iex "cmd /c $BuildDirectory\$BuildName\msbuildcmd.bat"
#cd "$BuildDirectory\$BuildName"
#iex msbuildcmd.bat
#iex "$BuildDirectory\$BuildName\msbuild.exe /t:Deploy /p:DatabaseServer=$SqlServer;DatabaseName=$SqlDatabase;Cust=CUST000;Version='7.6.0.0';CacheServer=$RedisServer;CacheDatabase=$RedisDatabase"


#remove site and shared folder from App folder
Write-Host "REMOVING Site and Shared folder from App folder.........................................." -ForegroundColor Green
if((Test-Path "$global:AppsFolder\Site") -eq $False)
{
    Write-Warning "App Site folder does not exist"
}
else
{
    Remove-Item "$global:AppsFolder\Site"-Recurse -Force
}

if((Test-Path "$global:AppsFolder\Shared") -eq $False)
{
    Write-Warning "App Shared folder does not exist"
}
else
{
    Remove-Item "$global:AppsFolder\Shared"-Recurse -Force
}



#copy the new Shared and Site folder to the App folder
Write-Host "COPY NEW Shared and Site folder to the App folder.........................................." -ForegroundColor Green
Copy-Item "$BuildDirectory\$BuildName\Shared" "$global:AppsFolder\Shared"-Recurse -Force
Copy-Item "$BuildDirectory\$BuildName\Site" "$global:AppsFolder\Site"-Recurse -Force

#copy the new Shared folder to the RTE server
Write-Host "COPY NEW SHARED folder to the RTE Server .........................................." -ForegroundColor Green
Remove-Item "$RTEPath\Shared" -Force -Recurse
Copy-Item "$BuildDirectory\$BuildName\Shared" $RTEPath -Recurse -Force

#copy the backup setting file to the new app folder
Write-Host "UPDATE config files to App Folder.........................................." -ForegroundColor Green
Copy-Item "$global:ScriptLocation\bak\Business\Web.config" "$global:AppsFolder\Site\Business" -Force
Copy-Item "$global:ScriptLocation\bak\Consultant\Web.config" "$global:AppsFolder\Site\Consultant" -Force
Copy-Item "$global:ScriptLocation\bak\Employee\Web.config" "$global:AppsFolder\Site\Employee" -Force
Copy-Item "$global:ScriptLocation\bak\Integration\Web.config" "$global:AppsFolder\Site\Integration" -Force
Copy-Item "$global:ScriptLocation\bak\Personal\Web.config" "$global:AppsFolder\Site\Personal" -Force

#copy j6.Realtime.Service.exe config file to the RTE shared folder
Write-Host "UPDATE realtime.service.exe to RTE Shared folder.........................................." -ForegroundColor Green
Copy-Item "$global:ScriptLocation\bak\Shared\j6.Realtime.Service.exe.config" "$RTEPath\Shared" -Force

#===================== start everything back on ================================
Write-Host "STARTING RTE and Site and App pool.........................................." -ForegroundColor Green
#start the rte server
cd $global:ScriptLocation
iex "cmd /c PsService $global:RTEServer start $global:RTEService"


#start the site 1
iex "C:\Windows\System32\inetsrv\appcmd.exe stop start '/site.name:$Site1'"
#start the appPool
foreach ($node in $global:AppPools)
{
    iex "C:\Windows\System32\inetsrv\appcmd.exe start apppool '/apppool.name:$node'"
}


Write-Host "FLUSHING REDIS.........................................." -ForegroundColor Green
iex "$global:RedisPath -h $RedisServer -n $RedisDatabase flushdb"




#================= DONE ========================================================
Write-Host "DEPLOYMENT FINISHED.  Press any key to continue ..." -ForegroundColor Green
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")














