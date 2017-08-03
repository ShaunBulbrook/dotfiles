# Disable backspace error beep
Set-PSReadlineOption -BellStyle None

# Always open to home directory
Set-Location $Home

# Open to a blank prompt
Clear-Host

function t {
	$h = $Home -replace "\\", "/" -replace ":", ""
	docker run --rm -v //$h/.trc:/root/.trc dan1elhughes/docker-t @args
}
