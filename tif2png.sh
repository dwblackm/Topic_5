#!/bin/bash



gdal_translate -of PNG -scale -co worldfile=yes $1 $2
