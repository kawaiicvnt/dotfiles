#!/bin/sh
hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x04 
hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x04 
if [ $1 = "off" ]; then 
	hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x04 
else 
	hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x00
fi
