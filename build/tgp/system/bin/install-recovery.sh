#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39854080:90f26a9e9d2eb920c35df2ebd273cc32c3e4d912; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37578752:c5a2d9efdc392eacefa2111d92b24776e2670018 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 90f26a9e9d2eb920c35df2ebd273cc32c3e4d912 39854080 c5a2d9efdc392eacefa2111d92b24776e2670018:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
