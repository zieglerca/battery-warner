#!/bin/bash

    while true
    do
        export DISPLAY=:0.0
        battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
        if on_ac_power; then
			:	# do nothing comment, I do not want popups that tell me the battery is full            
			# if [ $battery_level -ge 95 ]; then
            #     notify-send "Battery charging above 95%. Unplug your AC adapter!" "Charging: ${battery_level}% "
            #     if on_ac_power; then
            #         java -jar .batt_full.jar   ## Display FULLBATTERY notification window
            #    fi
            # fi
        else
             if [ $battery_level -le 15 ]; then
                notify-send "Battery is lower 15%. Connect your AC adapter." "Charging: ${battery_level}%"
                if ! on_ac_power; then
                    java -jar .batt_low.jar   ## Display LOWBATTERY notification window
                fi
             fi
        fi

        sleep 300 # 300 seconds or 5 minutes
    done
