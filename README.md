Cringe on main ≖‿≖


No support attached. Good luck have fun.

Some notes on stuff I should keep in mind.

### udev rules
#### microcontrollers
##### Flipper Zero
```
#Flipper Zero serial port
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess"
#Flipper Zero DFU
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", ATTRS{manufacturer}=="STMicroelectronics", TAG+="uaccess"
#Flipper ESP32s2 BlackMagic
SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="40??", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess"
```
##### micro:bit
The difference between v1 and v2, seems to be that the v2 product attribute string is quoted, while v1 is not.
```
#micro:bit v2
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0d28", ATTRS{idProduct}=="0204", ATTRS{manufacturer}=="ARM", ATTRS{product}=="\"BBC micro:bit CMSIS-DAP\"", TAG+="uaccess"
#micro:bit v1
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0d28", ATTRS{idProduct}=="0204", ATTRS{manufacturer}=="ARM", ATTRS{product}=="BBC micro:bit CMSIS-DAP", TAG+="uaccess"
```

### HP Envy - system audio

**THIS DOES NOT WORK RELIABLY**
While the documentation below, is useful to know, it doesn't solve, neither works around the volume fluctuation problem. It might work for a few boot cycles, it eventually breaks (usually around suspend). Also it entirely fucks up headphone detection. When my mental health declines again, I'll take a deeper look into this.

HP really loves messing with their audio..\
Firstly, we need to ensure our kernel is after 6.10, as we need some patches that were upstreamed at 6.7 or 6.10 (it's been a while..).

For HP Envy x360 13-bf0xxx with the ALC245 sound card, I had to set a boot override using hdajackretask. Specifically on pin `0x14` the hda verb `0x90170110` (same as `0x17`).
You can achieve said hda verb in hdajackretask with "show unconnected pins" and "advanced override" on, then enabling `0x14` and copying `0x17` settings.\
Specifically in my case they are:
- Connectivity: Internal
- Location: Internal
- Device: Speaker
- Jack: Other Analog
- Color: Unknown
- Jack detection: Not present
- Channel group: 1
- Channel (in group): Front

However, this messes up hardware mixing and makes volume control impossible through Master (except toggling mute), but possible through PCM. This means we need to switch to software mixing. The easiest way to achieve that would be through wireplumber (or pulseaudio, if you still use that..). Check [here](./wireplumber/wireplumber.conf.d/10-soft-mixer.conf) for implementation.

HDA VERB TDLR:
`0x14 -> 0x90170110 -> Int,Int,Sp,OA,Uk,NP,1,F`
