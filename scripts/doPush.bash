#!/bin/bash
cd /home/hanno/public_html/exoplanet.hanno-rein.de/webhook
LOCKFILE="scriptisworking.txt"
PUSHNEEDED="pushneeded.txt"
if [[ ! -f $LOCKFILE ]]; then
	if [ -f $PUSHNEEDED ];
	then
		touch $LOCKFILE

		rm -rf tmp
		mkdir tmp
		cd tmp
		wget --no-check-certificate https://github.com/OpenExoplanetCatalogue/open_exoplanet_catalogue/archive/master.zip
		unzip master
		cd ..
		cd oec_gzip
		FILENAME="systems.xml"
		rm $FILENAME.gz
		echo "<systems>" > $FILENAME
		cat ../tmp/open_exoplanet_catalogue-master/systems/*.xml >> $FILENAME
		echo "</systems>" >> $FILENAME
		gzip $FILENAME 
		git add $FILENAME.gz
		git commit -a -m "Automatic update (via webhook)."
		git push

		cd ..
		rm -f $PUSHNEEDED
		rm -f $LOCKFILE
	fi
fi
