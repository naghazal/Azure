#Demonstration - Manage IP Addresses
#In this demonstration, you will learn how to retrieve static private IP address information for a network interface. 
#You will run PowerShell commands to view the static private IP address information for the VM that was created in the previous demonstration. 
#You will also change the private IP address that was added to the VM to static.

#Retrieve Private IP Address
Get-AzNetworkInterface -Name myNic1 -ResourceGroupName RG-AZ103T00M4-NICs

#Set a Static Private IP Address
$nic=Get-AzNetworkInterface -Name myNic1 -ResourceGroupName RG-AZ103T00M4-NICs
$nic.IpConfigurations[0].PrivateIpAllocationMethod = "Static"
Set-AzNetworkInterface -NetworkInterface $nic

#Set a Dynamic Private IP Address
$nic=Get-AzNetworkInterface -Name myNic1 -ResourceGroupName RG-AZ103T00M4-NICs
$nic.IpConfigurations[0].PrivateIpAllocationMethod = "Dynamic"
Set-AzNetworkInterface -NetworkInterface $nic
