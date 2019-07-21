#!/bin/bash

for NUM in $(seq -w 50 50 100)

do

	gdalwarp -tr $NUM $NUM -r average -co "TFW=YES" -overwrite ncrast/elev_ned_30m.tif srtm_$NUM.tif

	echo $NUM

done

for NUM in $(seq -w 100 100 300)

do

	gdalwarp -tr $NUM $NUM -r average -co "TFW=YES" -overwrite ncrast/elev_ned_30m.tif srtm_$NUM.tif

	echo $NUM

done

for NUM in $(seq -w 50 50 100)

do

	./tif2png.sh srtm_$NUM.tif srtm_$NUM.png

	echo $NUM

done

for NUM in $(seq -w 100 100 300)

do

	./tif2png.sh srtm_$NUM.tif srtm_$NUM.png

	echo $NUM

done



convert -coalesce -delay 1/1 -resize 500x srtm_*.png srtm.gif
