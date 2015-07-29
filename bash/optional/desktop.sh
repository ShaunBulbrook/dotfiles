alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias temp='cat /sys/class/thermal/thermal_zone*/temp'

function theme() {
	if [[ "$1" = "light" ]]; then
		gsettings set org.gnome.desktop.interface gtk-theme "Libra"
	elif [[ "$1" = "dark" ]]; then
		gsettings set org.gnome.desktop.interface gtk-theme "Libra-Dark"
	fi
}
