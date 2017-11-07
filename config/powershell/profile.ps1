# Disable backspace error beep
Set-PSReadlineOption -BellStyle None

# Always open to home directory
Set-Location $Home

# Open to a blank prompt
Clear-Host

# Set title for AHK listeners
$host.ui.RawUI.WindowTitle = "-Powershell"
