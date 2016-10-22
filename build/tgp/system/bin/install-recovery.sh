#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39796736:e22297f95aced58b654f6056ac41834ab5e37b62; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37523456:a260da33a78426adf0e83599737ad6a995ccc9cd EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY e22297f95aced58b654f6056ac41834ab5e37b62 39796736 a260da33a78426adf0e83599737ad6a995ccc9cd:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
