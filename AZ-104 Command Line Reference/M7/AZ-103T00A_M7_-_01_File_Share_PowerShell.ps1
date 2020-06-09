#Demonstration - Backup Azure File Shares
#In this demonstration, we will explore backing up a file share in the Azure portal.
#This desmonstration requires an Azure file share and a storage account that can be used by the vault.

#Create a Storage Account using PowerShell

#Login to Azure
Connect-AzAccount

#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"

#Create Storage Account
$location = "EastUS"
$resourceGroup = "RG-AZ103M7-Fileshare"
New-AzResourceGroup -Name $resourceGroup -Location $location
New-AzStorageAccount -ResourceGroupName $resourceGroup -AccountName saaz103m7fileshare -Location $location -SkuName "Standard_LRS" -Kind StorageV2

#Retrieve Storage Account Key
Get-AzStorageAccountKey -ResourceGroupName "RG-AZ103T00M7-Fileshare" -AccountName "saaz103t00m7fileshare"

#Create a File Share using PowerShell

#Create Storage Context and Key (Key must be retrieved)
$storageContext = New-AzStorageContext saaz103m7fileshare v9ah4fnuW6bYDeqCH3tfa8BKOkJ9Oe52O6Dxr5KtY/Y1FlvxJli3nP6CaEH+GCBSsAHyy6vZQmF5zRbvj17wCg==

#Create File Share
$share = New-AzStorageShare logs -Context $storageContext

#Upload Data to the File Share
