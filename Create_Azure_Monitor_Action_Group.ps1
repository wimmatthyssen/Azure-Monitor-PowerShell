<#
.SYNOPSIS

A script used to create an Azure Monitor Action Group 

.DESCRIPTION

A script used to used to create an Azure Monitor Action Group. The Action Type used in this script is Email.
.NOTES

Filename:       Create_Azure_Monitor_Action_Group.ps1
Created:        26/11/2019
Last modified:  26/11/2019
Author:         Wim Matthyssen
PowerShell:     Azure Cloud Shell or Azure PowerShell
Version:        Install latest modules if using Azure PowerShell
Action:         Change variables were needed to fit your needs
Disclaimer:     This script is provided "As IS" with no warranties.

.EXAMPLE

.\Create_Azure_Monitor_Action_Group.ps1

.LINK

#>

## Variables

$emailReceiverName = "emailreceiver"
$emailAddress = "testemail@outlook.com"
$actionGroupName = "email-ag"
$actionGroupShortName = $actionGroupName
$rgName = "wm-demo-management-rg"
$tagName = "Environment"
$tagValue = "Demo"
$time = Get-Date -UFormat "%A %m/%d/%Y %R"
$foregroundColor1 = "Red"
$writeEmptyLine = "`n"
$writeSeperator = " - "

## Log on with your Azure account if your not using Azure Cloud Shell

# Login-AzureRmAccount

## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Create a new Action Group Email receiver

$emailReceiver = New-AzureRmActionGroupReceiver -Name $emailReceiverName -EmailReceiver -EmailAddress $emailAddress

Write-Host ($writeEmptyLine + "# Action Group Receiver $emailReceiverName saved in memory" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor1 $writeEmptyLine 

## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Create a new Action Group

$tag = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
$tag.Add($tagName,$tagValue)

Set-AzureRmActionGroup -Name $actionGroupName -ResourceGroup $rgName -ShortName $actionGroupShortName -Receiver $emailReceiver -Tag $tag

Write-Host ($writeEmptyLine + "# Action Group $actionGroupName created" + $writeSeperator + $time)`
-foregroundcolor $foregroundColor1 $writeEmptyLine 

## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


