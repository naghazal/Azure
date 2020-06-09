#Demonstation - File Shares
#In this demonstration, we will work with file shares and snapshots
#A pre-configured Storage Account is required to complete the file share portion of this demonstration.  A globally unique Storage Account name is required. The steps below create that storage account.

#Create a Storage Account using PowerShell
#Login to Azure
Connect-AzAccount

#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"

#Create Storage Account
Get-AzLocation | select Location
$location = "EastUS"
$resourceGroup = "RG-AZ103T00M3-Fileshare"
New-AzResourceGroup -Name $resourceGroup -Location $location
New-AzStorageAccount -ResourceGroupName $resourceGroup -AccountName <INSERT STORAGE ACCOUNT NAME HERE> -Location $location -SkuName "Standard_LRS" -Kind StorageV2

#Retrieve Storage Account Key
Get-AzStorageAccountKey -ResourceGroupName "RG-AZ103T00M3-Fileshare" -AccountName "<INSERT STORAGE ACCOUNT NAME HERE>"

#Create a File Share using PowerShell
#Create Storage Context and Key (Key must be retrieved)
$storageContext = New-AzStorageContext <INSERT STORAGE ACCOUNT NAME HERE> fOvSf2ZaQusfCGasllbTxq1nTvBiIobUyw+D4KXsZvO5ZQusinUqzS89gqqWvgu6fEEIO8ot6IeN+0zqgtuQiA==

#Create File Share
$share = New-AzStorageShare logs -Context $storageContext

#Mount a File Share using PowerShell
$resourceGroupName = "RG-AZ103T00M3-Fileshare"
$storageAccountName = "<INSERT STORAGE ACCOUNT NAME HERE>"
$fileShareName = "logs"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName
$fileShare = Get-AzStorageShare -Context $storageAccount.Context
$password = ConvertTo-SecureString -String $storageAccountKeys[0].Value -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList "AZURE\$($storageAccount.StorageAccountName)", $password
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\<INSERT STORAGE ACCOUNT NAME HERE>.file.core.windows.net\logs" -Credential $credential -Persist

#Dismount the File Share
Remove-PSDrive -Name Z
