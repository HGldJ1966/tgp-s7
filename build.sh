#!/bin/bash
# TGP Build Script for Linux v1.00 by djb77 / XDA-Developers

export RDIR=$(pwd)
export tgpfirmware=$(<tools/firmware)
export tgpversion=$(<tools/version)
export ZIP_NAME='TGP_G93xx_'$tgpfirmware'_v'$tgpversion'.zip'

echo ""
echo "Building Zip File $ZIP_NAME"
cd build
zip -gq $ZIP_NAME -r META-INF/ -x "*~"
zip -gq $ZIP_NAME -r tgp/ -x "*~"
mv $ZIP_NAME $RDIR/$ZIP_NAME
cd $RDIR
if [ -n `which java` ]; then
echo "Java Detected, Signing Zip File"
mv $ZIP_NAME old$ZIP_NAME
java -Xmx1024m -jar $RDIR/tools/signapk-linux.jar -w $RDIR/tools/testkey.x509.pem $RDIR/tools/testkey.pk8 old$ZIP_NAME $ZIP_NAME
rm old$ZIP_NAME
fi
chmod a+r $ZIP_NAME
echo ""
echo "Done."
echo ""

