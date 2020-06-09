#Demonstration - Run Templates with PowerShell
#In this demonstration, we will create new Azure resources using PowerShell and Resource Manager templates.

#Login to Azure
Connect-AzAccount
    
#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"

#Create Resource Group
New-AzResourceGroup -Name RG-AZ103T00M1-PSTemplate -Location EastUS

#Deploy the Template to the Resource Group
#Note: adminUsername, adminPassword, and dnsLabelPrefix required for deployment
$templateUri = 'https://raw.githubusercontent.com/Mitaric/ADEScripts/master/az103t001m1/azuredeploy.json'
New-AzResourceGroupDeployment -Name PSTemplateDeployment -ResourceGroupName RG-AZ103T00M1-PSTemplate -TemplateUri $templateUri

#Verify the Template Deployment
#Note the VM Name
Get-AzVM

#Obtain Additional VM Details
Get-AzVM -Name SimpleWinVM -ResourceGroupName RG-AZ103T00M1-PSTemplate

#Update the VM Size
$ResourceGroupName = 'RG-AZ103T00M1-PSTemplate'
$vm = Get-AzVM -Name SimpleWinVM -ResourceGroupName $ResourceGroupName
$vm.HardwareProfile.vmSize = "Standard_B4ms"
Update-AzVM -ResourceGroupName $ResourceGroupName -VM $vm
