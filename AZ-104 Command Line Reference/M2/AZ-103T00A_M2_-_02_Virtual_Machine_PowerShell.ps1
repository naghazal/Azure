#Demonstration - Creating a Virtual Machine with PowerShell
#In this demonstration, we will create a virtual machine using PowerShell.
#This demonstration can be performed from a local PowerShell session or via Auzre Cloud Shell @ https://portal.azure.com

#Login to Azure
Connect-AzAccount

#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"

#Create Resource Group
New-AzResourceGroup -Name RG-AZ103T00M2-VMPS -Location EastUS

#Create Virtual Machine
#When prompted, provide a username and password to be used as the logon credentials for the VM
New-AzVm `
-ResourceGroupName "RG-AZ103T00M2-VMPS" `
-Name "myVM2" `
-Size "Standard_B2ms" `
-Location "EastUS" `
-VirtualNetworkName "myVnet2" `
-AddressPrefix "10.2.0.0/16" `
-SubnetName "mySubnet" `
-SubnetAddressPrefix "10.2.0.0/24"

#Retrieve the Public IP Address of the Virtual Machine
Get-AzPublicIpAddress -ResourceGroupName "RG-AZ103T00M2-VMPS" | Select "IpAddress"

#Connect to the Virtual Machine via RDP
mstsc /v:publicIPAddress
