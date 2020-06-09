#Demonstration - DNS Name Resolution
#In this demonstration, you will explore Azure DNS.

#Create a DNS Zone using the Azure Portal
#Follow the instructions to create a DNS Zone in the Azure Portal with the following setttings:
Name: contoso.internal.com
Subscription: Your Subscription
Resource Group: RG-AZ103T00M4-DNS
Location: EastUS

#Follow the instructions to create a DNS Record Set in the Azure Portal with the following settings:
Type: A 
Name: ARecord
IP Address: 1.2.3.4

#View DNS Information using PowerShell

#View DNS Information
Get-AzDnsZone -Name "contoso.internal.com" -ResourceGroupName RG-AZ103T00M4-DNS

#Get Information on DNS Record Set
Get-AzDnsRecordSet -ResourceGroupName RG-AZ103T00M4-DNS -ZoneName contoso.internal.com

#View Name Servers
$zone = Get-AzDnsZone –Name contoso.internal.com –ResourceGroupName RG-AZ103T00M4-DNS
Get-AzDnsRecordSet –Name “@” –RecordType NS –Zone $zone

#Test Name Resolution
nslookup arecord.contoso.internal.com <name server for the zone>
