#!/bin/bash
FILENAME="systems.xml"
rm $FILENAME.gz
echo "<systems>" > $FILENAME
cat open_exoplanet_catalogue/systems/*.xml >> $FILENAME
echo "</systems>" >> $FILENAME
gzip $FILENAME 
git add $FILENAME.gz
git commit -a -m "Automatic update (via webhook)."
git push
