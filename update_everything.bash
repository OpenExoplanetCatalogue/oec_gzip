#!/bin/bash
mkdir tmp
pushd tmp
wget --no-check-certificate https://github.com/OpenExoplanetCatalogue/open_exoplanet_catalogue/archive/master.zip
unzip master
popd

FILENAME="systems.xml"
rm $FILENAME.gz
echo "<systems>" > $FILENAME
cat tmp/open_exoplanet_catalogue-master/systems/*.xml >> $FILENAME
echo "</systems>" >> $FILENAME
gzip $FILENAME 
git add $FILENAME.gz
git commit -a -m "Automatic update (via webhook)."
git push

rm -rf tmp
