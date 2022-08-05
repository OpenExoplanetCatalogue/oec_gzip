#!/bin/bash
FILENAME="systems.xml"
rm $FILENAME.gz
echo "<systems>" > $FILENAME
cat open_exoplanet_catalogue/systems/*.xml >> $FILENAME
echo "</systems>" >> $FILENAME
gzip -n $FILENAME
git add $FILENAME.gz
git commit -a -m "Automatic update oec (via webhook)."
git push

FILENAME="systems-exoplaneteu.xml"
rm $FILENAME.gz
echo "<systems>" > $FILENAME
cat open_exoplanet_catalogue/systems_exoplaneteu/*.xml >> $FILENAME
echo "</systems>" >> $FILENAME
gzip -n $FILENAME
git add $FILENAME.gz
git commit -a -m "Automatic update oec_exoplaneteu (via webhook)."
git push

FILENAME="systems-exoplanetarchive.xml"
rm $FILENAME.gz
echo "<systems>" > $FILENAME
cat open_exoplanet_catalogue/systems_exoplanetarchive/*.xml >> $FILENAME
echo "</systems>" >> $FILENAME
gzip -n $FILENAME
git add $FILENAME.gz
git commit -a -m "Automatic update oec_exoplanetarchive (via webhook)."
git push
