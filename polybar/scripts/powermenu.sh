#!/usr/bin/env bash

## Original Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Modified by : Daniel Heras
## Mail    : dani.heras@hotmail.com

dir="~/.config/polybar/floating/scripts/rofi"
#uptime=$(uptime -p | sed -e 's/up //g')
uptime=$(uptime | awk '{print $3}' | sed 's/,//g')

rofi_command="rofi -theme $dir/powermenuRight.rasi"

shutdown="Shutdown "
reboot="Restart "
lock="Lock "
suspend="Sleep "
logout="Logout "

confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/confirm.rasi
}
msg() {
	rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "$uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $lock)
		mpc -q pause
		pulseaudio-ctl mute yes
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		elif [[ -f /usr/bin/light-locker-command ]]; then
			light-locker-command -l
		fi
        ;;
    $suspend)
			mpc -q pause
			pulseaudio-ctl mute yes
			systemctl suspend
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
				i3-msg exit
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
