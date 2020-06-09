#Demonstration - Creating Virtual Networks
#In this demonstration, you will create Virtual Networks using PowerShell

#Login to Azure
Connect-AzAccount

#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"  

#Create Resource Group
New-AzResourceGroup -Name RG-AZ103T00M4-VNETPS -Location EastUS

#Create Virtual Network
$myVNet2 = New-AzVirtualNetwork -ResourceGroupName RG-AZ103T00M4-VNETPS -Location EastUS -Name myVNet2 -AddressPrefix 10.2.0.0/16

#Verify Virtual Network
Get-AzVirtualNetwork -ResourceGroupName RG-AZ103T00M4-VNETPS -Name myVNet2

#Create a Subnet
$mySubnet2 = Add-AzVirtualNetworkSubnetConfig -Name mySubnet2 -AddressPrefix 10.2.0.0/24 -VirtualNetwork $myVNet2

#Verify Subnet
Get-AzVirtualNetworkSubnetConfig -Name mySubnet2 -VirtualNetwork $myVNet2

#Associate Subnet to Virtual Network
$mySubnet2 | Set-AzVirtualNetwork
