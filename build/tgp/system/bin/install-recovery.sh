#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39854080:4406ddf5277ddc8dd78acb279fd15937e0dd6e31; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37578752:70f13df779c08a817e1bc9b956903731ff655355 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 4406ddf5277ddc8dd78acb279fd15937e0dd6e31 39854080 70f13df779c08a817e1bc9b956903731ff655355:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
