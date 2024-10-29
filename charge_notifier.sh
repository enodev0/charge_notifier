#!/bin/bash

while true
	do
		battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
		battery_state=`cat /sys/class/power_supply/BAT0/status`

		# Charged
		if [ $battery_level -ge 70 ] && [ $battery_state == "Charging" ]; then
			notify-send -u critical "Battery overcharged ($battery_level%)"
		fi
		# Low battery
		if [ $battery_level -le 33 ] && [ $battery_state == "Discharging" ]; then
			notify-send -u critical "Battery drained ($battery_level%)"
		fi

		sleep 150
done
