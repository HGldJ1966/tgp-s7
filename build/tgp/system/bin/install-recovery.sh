#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39794688:d4bcc4808ac7d926482a4a44589bef726fcecebf; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37523456:6957c1af149013fb6bfd5a2ebf92e0a9f7dfc4b3 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY d4bcc4808ac7d926482a4a44589bef726fcecebf 39794688 6957c1af149013fb6bfd5a2ebf92e0a9f7dfc4b3:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
