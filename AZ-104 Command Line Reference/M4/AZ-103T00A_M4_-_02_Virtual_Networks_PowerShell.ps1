#Demonstration - Creating Virtual Networks
#In this demonstration, you will create Virtual Networks using PowerShell

#Login to Azure
Connect-AzAccount

#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"  

#Create Resource Group
New-AzResourceGroup -Name ING-RG -Location WestEurope

#Create Virtual Network
New-AzVirtualNetwork -ResourceGroupName ING-RG -Location WestEurope -Name ING-Vnet2 -AddressPrefix 10.2.0.0/16

#Verify Virtual Network
$myVNet2 = Get-AzVirtualNetwork -ResourceGroupName ING-RG -Name ING-Vnet2

#Create a Subnet
$mySubnet2 = Add-AzVirtualNetworkSubnetConfig -Name FE -AddressPrefix 10.2.0.0/24 -VirtualNetwork $myVNet2

#Verify Subnet
Get-AzVirtualNetworkSubnetConfig -Name mySubnet2 -VirtualNetwork $myVNet2

#Associate Subnet to Virtual Network
$mySubnet2 | Set-AzVirtualNetwork
