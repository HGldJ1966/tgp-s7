#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39854080:9733f83e5f8c4aae3d746e3301188ec770b25a6e; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37578752:ba19018bfc93a0757336043b08a3d8ecedadd538 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 9733f83e5f8c4aae3d746e3301188ec770b25a6e 39854080 ba19018bfc93a0757336043b08a3d8ecedadd538:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
