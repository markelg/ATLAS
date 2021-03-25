#!/bin/bash
set -e
# Requires GDAL installed
izipfile="../ocean-biomes_shapefile.zip"
tempdir="/tmp/ocean-biomes/"
unzip ${izipfile} -d ${tempdir}
ifile="${tempdir}"
ofile="../ocean-biomes.geojson"
echo "Transforming ${ifile} to ${ofile}"
ogr2ogr -f "GeoJSON" ${ofile}  ${ifile}
#
# Monsoons
#
izipfile="../monsoons_shapefile.zip"
tempdir="/tmp/monsoons/"
unzip ${izipfile} -d ${tempdir}
ifile="${tempdir}"
ofile="../monsoons.geojson"
# Use -segmentize to add extra points between the vertices of the polygons
echo "Transforming ${ifile} to ${ofile}"
ogr2ogr -f "GeoJSON" ${ofile}  ${ifile}
#
# Small islands
#
izipfile="../small-islands_shapefile.zip"
tempdir="/tmp/small_islands/"
unzip ${izipfile} -d ${tempdir}
ifile="${tempdir}"
ofile="../small-islands.geojson"
# Use -segmentize to add extra points between the vertices of the polygons
echo "Transforming ${ifile} to ${ofile}"
ogr2ogr -segmentize 2.5 -f "GeoJSON" ${ofile}  ${ifile}
