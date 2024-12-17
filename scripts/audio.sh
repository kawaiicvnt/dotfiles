sudo modprobe snd-hda-intel index=0 model=auto vid=8086 pid=51cc

sudo hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x45
sudo hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x5289
sudo hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x46
sudo hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x0004
