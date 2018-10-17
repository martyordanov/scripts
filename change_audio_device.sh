#!/bin/bash
#This script makes it easy to map the long cli commands to key combinations.
#Use pacmd list-sinks to get the names of available devices.

dev1='bluez_sink.B8_69_C2_21_1A_61.a2dp_sink'
dev2='alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1'
dev3='alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo'

case $1 in 
    bluetooth_speaker)
        pacmd set-default-sink $dev1
        ;;
    hdmi)
        pacmd set-default-sink $dev2
        ;;
    headphones)
        pacmd set-default-sink $dev3
        ;;
    *)
        echo $"Usage: $0 {bluetooth_speaker|hdmi|headphones}"
        exit 1
esac

