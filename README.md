Cringe on main ≖‿≖


No support attached. Good luck have fun.

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
