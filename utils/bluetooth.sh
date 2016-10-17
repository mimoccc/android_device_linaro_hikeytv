#!/bin/bash

# isBluetoothEnabled
isBluetoothDisabled=$( adb shell service call bluetooth_manager 5  | grep -n "00000000 00000001" 1>/dev/null ; echo $? )

if [ $isBluetoothDisabled == 1 ]; then
    # enable bluetooth
    echo "enabling bluetooth"
    adb shell service call bluetooth_manager 6
fi

adb shell am start -n com.android.tv.settings/.accessories.AddAccessoryActivity

# This command disables bluetooth
# adb shell service call bluetooth_manager 8

 echo "use the following command to select a bluetooth device"
 echo "adb input keyevent KEYCODE_ENTER"