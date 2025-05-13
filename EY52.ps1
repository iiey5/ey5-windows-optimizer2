
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# === FORM SETUP ===
$form = New-Object System.Windows.Forms.Form
$form.Text = "EY5 Windows Optimizer"
$form.Size = New-Object System.Drawing.Size(950, 600)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
$form.ForeColor = "White"

# === TAB CONTROL ===
$tabs = New-Object System.Windows.Forms.TabControl
$tabs.Dock = "Fill"
$tabs.Font = New-Object System.Drawing.Font("Segoe UI", 10)

# === TABS ===
$tabInstall = New-Object System.Windows.Forms.TabPage
$tabInstall.Text = "Install"

$tabTweaks = New-Object System.Windows.Forms.TabPage
$tabTweaks.Text = "Tweaks"

$tabConfig = New-Object System.Windows.Forms.TabPage
$tabConfig.Text = "Config"

$tabUpdates = New-Object System.Windows.Forms.TabPage
$tabUpdates.Text = "Updates"

$tabs.TabPages.AddRange(@($tabInstall, $tabTweaks, $tabConfig, $tabUpdates))

# === CONTROLS (Tweaks Tab Example) ===
$chkTelemetry = New-Object System.Windows.Forms.CheckBox
$chkTelemetry.Text = "Disable Telemetry"
$chkTelemetry.Location = New-Object System.Drawing.Point(20, 30)
$chkTelemetry.ForeColor = "White"
$chkTelemetry.BackColor = "Transparent"

$btnRun = New-Object System.Windows.Forms.Button
$btnRun.Text = "Run Selected Tweaks"
$btnRun.BackColor = [System.Drawing.Color]::FromArgb(200, 50, 50)
$btnRun.ForeColor = "White"
$btnRun.FlatStyle = "Flat"
$btnRun.Location = New-Object System.Drawing.Point(20, 70)
$btnRun.Width = 200
$btnRun.Height = 40
$btnRun.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)

$btnRun.Add_Click({
    if ($chkTelemetry.Checked) {
        Start-Process powershell -Verb runAs -ArgumentList "Write-Host 'Disabling telemetry...'; # real action goes here"
    }
})

$tabTweaks.Controls.AddRange(@($chkTelemetry, $btnRun))

# === SHOW GUI ===
$form.Controls.Add($tabs)
$form.Topmost = $true
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
