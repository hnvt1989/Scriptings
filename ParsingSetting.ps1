Set-StrictMode -Version 2.0

$global:SqlServer = ''
$global:SqlDatabase = ''

$global:RedisServer = ''                              #name of redis server
$global:RedisPath ="$(get-location)\redis-cli.exe"               #Redis client path
$global:RedisDatabase = 0                                     #Redis database number

$global:RTEService = ''                               #RTE service name
$global:RTEServer = ''                            #RTE server

$global:Site1 ='DEV_8900_760_QA'                                #web site name
$global:AppPool_Web = 'DEV_8900_760_QA'                         #appPool for web site
$global:AppPool_Corp = 'DEV_8900_760_QA_Corporate'              #appPool for corporate portal
$global:AppPool_Consultant = 'DEV_8900_760_QA_Consultant'       #appPool for consultant portal
$global:AppPool_Business = 'DEV_8900_760_QA_Business'           #appPool for business portal
$global:AppPool_Personal = 'DEV_8900_760_QA_Personal'           #appPool for personal portal
$global:AppPool_Integration = 'DEV_8900_760_QA_Integration'     #appPool for integration portal

$global:AppPools = @() #array of app pools

$global:BuildFolderPath = '\\Jia-build3\ReleasePackages\CUST000-760_QA'
$global:PackageReleaseFolderPath = '\\dev-8900web1\E$\8900_PKGS\760_QA'
$global:AppsFolder = '\\dev-8900web1\E$\8900_APPS\760_QA'
$global:BakupFolder = '\\dev-8900web1\E$\8900_BAKS\760_QA'


write-host "`nParsing file deploy-settings.xml`n" -ForegroundColor Green

[System.Xml.XmlDocument] $xd = new-object System.Xml.XmlDocument
$file = resolve-path("$global:ScriptLocation\deploy-settings.xml")
$xd.load($file)
$nodelist = $xd.selectnodes("/settings") # XPath is case sensitive

foreach ($settingNode in $nodelist) {
    $cache = $settingNode.selectSingleNode("Cache")
    $cacheName = $cache.getAttribute("Name")
    $CacheServer = $cache.selectSingleNode("Servers")
    $RedisServerNode = $CacheServer.selectSingleNode("Server")
    $global:RedisServer = $RedisServerNode.getAttribute("Host")
    $global:RedisDatabase = $RedisServerNode.getAttribute("Database")

    $sql = $settingNode.selectSingleNode("sql")
    $global:SqlServer = $sql.selectSingleNode("server").get_InnerXml()
    $global:SqlDatabase = $sql.selectSingleNode("database").get_InnerXml()

    $rte = $settingNode.selectSingleNode("rte")
    $global:RTEServer = '\\' + $rte.selectSingleNode("server").get_InnerXml()
    $global:RTEService = $rte.selectSingleNode("service").get_InnerXml()

    $site = $settingNode.SelectSingleNode("Site")
    $global:Site1 = $site.SelectSingleNode("SiteName").get_InnerXml()
    $appPoolsNodesList= $site.SelectSingleNode("AppPools").selectnodes("AppPool")

    foreach ($node in $appPoolsNodesList)
    {
        $global:AppPools += $node.InnerText
        
    }

    $folder = $settingNode.SelectSingleNode("Folder")
    $global:BuildFolderPath = '\\' + $folder.SelectSingleNode("BuildFolderPath").get_InnerXml()
    $global:PackageReleaseFolderPath = '\\' + $folder.SelectSingleNode("PackageReleaseFolderPath").get_InnerXml()
    $global:AppsFolder = '\\' + $folder.SelectSingleNode("AppsFolder").get_InnerXml()
    $global:BakupFolder = '\\' + $folder.SelectSingleNode("BakupFolder").get_InnerXml()
}
    Write-host "-----------------------------------------------" -ForegroundColor Cyan
    Write-host "CONFIGURATION : " -ForegroundColor White
    Write-host "REDIS SERVER:   " $global:RedisServer -ForegroundColor Cyan
    Write-host "REDIS DATABASE: " $global:RedisDatabase  -ForegroundColor Cyan
    Write-Host "SQL SERVER:     " $global:SqlServer -ForegroundColor Cyan
    Write-Host "SQL DATABSE:    " $global:SqlDatabase -ForegroundColor Cyan
    Write-Host "RTE SERVER:     " $global:RTEServer -ForegroundColor Cyan
    Write-Host "RTE Service:    " $global:RTEService -ForegroundColor Cyan

    Write-host "`nSite and app pools:" -ForegroundColor White
    Write-Host "Site Name:      " $global:Site1 -ForegroundColor Cyan
    foreach ($node in $global:AppPools)
    {
        Write-Host "App pool:      " $node -ForegroundColor Cyan
    }

    Write-host "`nFolder location:" -ForegroundColor White
    Write-host "Build Folder:   " $global:BuildFolderPath -ForegroundColor Cyan
    Write-host "PackageReleaseFolder:   " $global:PackageReleaseFolderPath -ForegroundColor Cyan
    Write-host "AppsFolder:     " $global:AppsFolder -ForegroundColor Cyan
    Write-host "BackupFolder:   " $global:BakupFolder -ForegroundColor Cyan

    Write-host "-----------------------------------------------" -ForegroundColor Cyan

