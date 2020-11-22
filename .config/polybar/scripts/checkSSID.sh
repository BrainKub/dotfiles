#!/usr/bin/bash

SSID=$( iwctl station wlan0 show | awk '$1 == "Connected" {print $3}' )

case $SSID in
	Neverland) SSID="Home"			;;
	NeverlandExt) SSID="HomeExt"	;;
	*)	;;
esac
#[[ "$grepSSID" == "Neverland" ]] && grepSSID="Home"

check_tor(){
	status="$(systemctl status tor | grep -i run 2>/dev/null || echo '')"
	[[ "$status" != ""  ]] && color=#95C76F || color=#9baec8

	case $1 in
		wire) sign="" ;;
		wifi)
			pref="%{F#4D4E78}%{F-}"
			sign="$SSID"
			;;
		*) exit
	esac
	echo -e $pref %{F$color}${sign}%{F-}
}

ping -W 2 -c 1 ya.ru>/dev/null 2>/dev/null
pingTest="$?"

if [[ $pingTest -ne 0 ]]; then
	echo "  Internet"
elif [[ $(cat /sys/class/net/enp3s0/operstate) == up ]]; then
	check_tor wire
elif [[ $(cat /sys/class/net/wlan0/operstate) == up ]]; then
	check_tor wifi
fi
