#Generated Form Function
Import-Module .\TestConnectionAsync.psm1
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.9.0
# Generated On: 31/05/2014 01:33
# Generated By: dma
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion

#region Generated Form Objects
$form1 = New-Object System.Windows.Forms.Form
$bCancel = New-Object System.Windows.Forms.Button
$bCheck = New-Object System.Windows.Forms.Button
$bSet = New-Object System.Windows.Forms.Button
$listTargets = New-Object System.Windows.Forms.CheckedListBox
$listTimeZones = New-Object System.Windows.Forms.ListBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$bSet_OnClick= 
{
#TODO: Place custom script here

}

$bCheck_OnClick= 
{
	$targets = $listTargets.CheckedItems

}

$handler_form1_Load= 
{
	$timezones = tzutil /l
	$timezones = $timezones | ? { $_.Trim() -ne "" }
	$script:tzhash = @{}
	$x = $true
	foreach ($tzone in $timezones) {
		if ($x) {
			$listTimeZones.Items.Add($tzone)
			$key = $tzone
		} else {
			$value = $tzone
			$script:tzhash.Add($key,$value)
		}
		$x = !($x)
	}
	
	$targets = @()
	cat targets.txt | % { $string = $_; $targets += ,$string ; $listTargets.Items.Add($string) }
#shitty ping method, enable and laugh
#	foreach ($target in $targets) { 
#		if (Test-Connection $target -Quiet) {
#			$listTargets.SetItemChecked($listTargets.Items.IndexOf($target), $true)
#		}
#	}
# async ping method, 100% better
	$testResults = $targets | Test-ConnectionAsync | Select-Object -Property $PingQuickSelectPropertyList
	foreach ($r in $testResults) {
		if ($r.StatusCode -eq "0") {
			$in = $listTargets.Items.IndexOf($r.Address)
			$listTargets.SetItemChecked($listTargets.Items.IndexOf($r.Address), $true)
		}
	}
}

$bCancel_OnClick= 
{
#TODO: Place custom script here

}

$handler_listBox1_SelectedIndexChanged= 
{
#TODO: Place custom script here

}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$form1.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 574
$System_Drawing_Size.Width = 714
$form1.ClientSize = $System_Drawing_Size
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$form1.Name = "form1"
$form1.Text = "BondTM TimeZone"
$form1.add_Load($handler_form1_Load)


$bCancel.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 635
$System_Drawing_Point.Y = 541
$bCancel.Location = $System_Drawing_Point
$bCancel.Name = "bCancel"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$bCancel.Size = $System_Drawing_Size
$bCancel.TabIndex = 4
$bCancel.Text = "Cancel"
$bCancel.UseVisualStyleBackColor = $True
$bCancel.add_Click($bCancel_OnClick)

$form1.Controls.Add($bCancel)


$bCheck.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 442
$System_Drawing_Point.Y = 541
$bCheck.Location = $System_Drawing_Point
$bCheck.Name = "bCheck"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$bCheck.Size = $System_Drawing_Size
$bCheck.TabIndex = 3
$bCheck.Text = "CHECK"
$bCheck.UseVisualStyleBackColor = $True
$bCheck.add_Click($bCheck_OnClick)

$form1.Controls.Add($bCheck)


$bSet.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 360
$System_Drawing_Point.Y = 540
$bSet.Location = $System_Drawing_Point
$bSet.Name = "bSet"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$bSet.Size = $System_Drawing_Size
$bSet.TabIndex = 2
$bSet.Text = "SET"
$bSet.UseVisualStyleBackColor = $True
$bSet.add_Click($bSet_OnClick)

$form1.Controls.Add($bSet)

$listTargets.DataBindings.DefaultDataSourceUpdateMode = 0
$listTargets.FormattingEnabled = $True
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 360
$System_Drawing_Point.Y = 5
$listTargets.Location = $System_Drawing_Point
$listTargets.Name = "listTargets"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 529
$System_Drawing_Size.Width = 350
$listTargets.Size = $System_Drawing_Size
$listTargets.TabIndex = 1

$form1.Controls.Add($listTargets)

$listTimeZones.BorderStyle = 1
$listTimeZones.DataBindings.DefaultDataSourceUpdateMode = 0
$listTimeZones.FormattingEnabled = $True
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 4
$System_Drawing_Point.Y = 5
$listTimeZones.Location = $System_Drawing_Point
$listTimeZones.Name = "listTimeZones"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 561
$System_Drawing_Size.Width = 350
$listTimeZones.Size = $System_Drawing_Size
$listTimeZones.TabIndex = 0
$listTimeZones.add_SelectedIndexChanged($handler_listBox1_SelectedIndexChanged)

$form1.Controls.Add($listTimeZones)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm
