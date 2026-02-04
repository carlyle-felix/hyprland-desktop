#!/bin/bash

main() {

    local state=$(bluetoothctl show | grep "PowerState")
    state="${state#* }"

    if [[ "${state}" == "on" ]]; then
        bluetoothctl power off &> /dev/null
        if [ $? -eq 0 ]; then
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "	󰂲	Bluetooth: OFF"
        fi
    else 
        bluetoothctl power on &> /dev/null
        if [ $? -eq 0 ]; then
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "	󰂯	Bluetooth: ON"
        fi
    fi 
}

main $@
