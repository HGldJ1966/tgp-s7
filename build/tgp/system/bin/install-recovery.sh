#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39854080:527d52553b8f87cd6a20804f0058e64dcf51549c; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37578752:e3b2a487ccad2c5e94ad75fb53859578a6566f87 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 527d52553b8f87cd6a20804f0058e64dcf51549c 39854080 e3b2a487ccad2c5e94ad75fb53859578a6566f87:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
