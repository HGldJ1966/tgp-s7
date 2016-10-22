#!/bin/bash
# TGP Build Script for Linux v1.01 by djb77 / XDA-Developers

export rootdir=$(pwd)
export tgpfirmware=$(<tools/firmware)
export tgpversion=$(<tools/version)
export zipname='TGP_G93xx_'$tgpfirmware'_v'$tgpversion'.zip'
export heapsize=$(free -m | gawk '/^Mem:/{print $2-500}')

echo ""
echo "Building Zip File $zipname"
cd build
zip -gq $zipname -r META-INF/ -x "*~"
zip -gq $zipname -r tgp/ -x "*~"
mv $zipname $rootdir/$zipname
cd $rootdir
if [ -n `which java` ]; then
echo "Java Detected, Signing Zip File"
mv $zipname old$zipname
java -Xmx${heapsize}m -jar $rootdir/tools/signapk.jar -w $rootdir/tools/testkey.x509.pem $rootdir/tools/testkey.pk8 old$zipname $zipname
rm old$zipname
fi
chmod a+r $zipname
echo ""
echo "Done."
echo ""

