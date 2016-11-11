#!/bin/bash
#
#Created by Frank Peters
#Date: 11/11/2016
#

#Download video assets from the SD card based on a folder with a date
folders=($(curl -s {IP_ADDRESS}/VIDEO | grep -o '"fname":"[0-9]*"'));

for i in ${folders[@]}
do

   echo "File" $i
   DIR=($(echo $i | grep -o '"[0-9]*"' | sed -e 's/^"//' -e 's/"$//')); #WD World Book World Edition II
   #DIR=($(echo $i | grep -o '[0-9*]' # RASPBERRY PI
   echo "Dir:" $DIR;
   mkdir -p /shares/internal/CAM/$DIR/

   directories=($(curl -s {IP_ADDRESS}/VIDEO/$DIR | grep -o '"fname":"[0-9]*.AVI"'));

        for j in ${directories[@]}
        do
        files=$(echo "$j" | grep -o '[0-9]*.AVI');

                #for every file in the current dir
                for FILE in ${files[@]}
                do
                if [ ! -f /shares/internal/CAM/$DIR/$FILE ]
                then
                        #Download file from Flashair card because it doesn't exists
                        echo "File:" $FILE "does not exists. Downloading...";
                        wget http://{IP_ADDRESS}/VIDEO/$DIR/$FILE -P /shares/internal/CAM/$DIR/

                else
                        echo "File:" $FILE "exists. Skipping";
                        #File Exists. DO NOTHING :)
                fi
                done
        done
done
exit 0;

