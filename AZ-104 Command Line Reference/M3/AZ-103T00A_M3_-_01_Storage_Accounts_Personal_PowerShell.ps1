#Demonstration - Creating Storage Accounts
#In this demonstration, we will look at creating Storage Accounts
#A globally unique Storage Account name is required

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
$resourceGroup = "RG-AZ103T00M3-PSStorage"
New-AzResourceGroup -Name $resourceGroup -Location $location
New-AzStorageAccount -ResourceGroupName $resourceGroup -AccountName saaz103m3psstorage -Location $location -SkuName "Standard_LRS" -Kind StorageV2
