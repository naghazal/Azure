#Demonstration - Resource Groups
#In this demonstration, we will create and delete resource locks from within Azure Cloud Shell @ https://portal.azure.com

#Login to Azure
Login-AzAccount
    
#View Subscription Information
Get-AzSubscription

#Select Subscription
Select-AzSubscription -Subscription "Microsoft Azure Internal Consumption"

#Create Resource Group
New-AzResourceGroup -Name RG-AZ103T00M1-RGLock -Location EastUS    

#Create the Resource Lock
New-AzResourceLock -LockName DeleteLock -LockLevel CanNotDelete -ResourceGroupName RG-AZ103T00M1-RGLock

#Verify the Resource Lock
#Record the LockId Value
Get-AzResourceLock

#Remove the Resource Lock
#The LockID Value is determined from the previous step.
Remove-AzResourceLock -LockId <ID>

#Verify the Resource Lock
Get-AzResourceLock
