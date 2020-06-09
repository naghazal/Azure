#Demonstration - Custom Script Extension
#In this demonstration, we will explore Custom Script Extensions.
#In this demonstration, we will use the Virtual Machine created in the previous exercise.

#Retrieve the Public IP Address of the Virtual Machine
Get-AzPublicIpAddress -ResourceGroupName "RG-AZ103T00M2-VMPS" | Select "IpAddress"

#Connect to the Virtual Machine via RDP
mstsc /v:publicIPAddress

#From, the Virtual Machine, open an Administrative Command Prompt and verify that the Web Server feature is not installed
Get-WindowsFeature -name Web-Server

#Access your Virtual Machine Extentions, click Add, and browse to the Install_IIS.ps1 script.
#Verify that provisioning suceeded

#From, the Virtual Machine, open an Administrative Command Prompt and verify that the Web Server feature is installed
Get-WindowsFeature -name Web-Server
