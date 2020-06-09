#Demonstration - Working with PowerShell Locally
#In this demonstration, we will install Azure Az PowerShell module. The Az module is available from a global repository called the PowerShell Gallery. You can install the module onto your local machine through the Install-Module command. You need an elevated PowerShell shell prompt to install modules from the PowerShell Gallery.

#Install the Az Module
Install-Module -Name Az -AllowClobber

#Login to Azure
Connect-AzAccount
    
#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"

#Create Resource Group
New-AzResourceGroup -Name RG-AZ103T00M1-AZPS -Location EastUS

#Verify Resource Group
Get-AzResourceGroup
