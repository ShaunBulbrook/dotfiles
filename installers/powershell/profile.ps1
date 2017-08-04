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

function mongod {
	docker run -d -p 27017:27017 -v mongodbdata:/data/db mongo
}

function httpd {
	$p = $pwd.Path -replace "\\", "/" -replace ":", ""
	docker run --name httpd -dit --rm -v /"$p":/usr/local/apache2/htdocs/ -p 8080:80 --sig-proxy=false httpd
}
