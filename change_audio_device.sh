#!/bin/bash
#This script makes it easy to map the long cli commands to key combinations.
#Use pacmd list-sinks to get the names of available devices.

dev1='bluez_sink.B8_69_C2_21_1A_61.a2dp_sink'
dev2='alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1'
dev3='alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo'

case $1 in 
    bluetooth_speaker)
        #this lets us interact with that device using standar controls (vol up
        # vol down, mute...)
        pacmd set-default-sink $dev1
        
        #since the sink indecies varie like crazy (each application has its own
        #index, and further more the index changes every time you move it) we
        #need to get a list of indecies and loop trough them        
        sinks=$(pacmd list-sink-inputs | grep index: | grep -o "[0-9]*")
        for sink in $sinks
        do
            pacmd move-sink-input $sink $dev1
        done
        ;;
    hdmi)
        pacmd set-default-sink $dev2
        sinks=$(pacmd list-sink-inputs | grep index: | grep -o "[0-9]*")
        for sink in $sinks
        do
            pacmd move-sink-input $sink $dev2
        done
        ;;
    headphones)
        pacmd set-default-sink $dev3
        sinks=$(pacmd list-sink-inputs | grep index: | grep -o "[0-9]*")
        for sink in $sinks
        do
            pacmd move-sink-input $sink $dev3
        done
        ;;
    *)
        echo $"Usage: $0 {bluetooth_speaker|hdmi|headphones}"
        exit 1
esac

