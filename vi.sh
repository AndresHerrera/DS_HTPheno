#!/bin/bash
echo "Vegetation Index for HTPhenotyping"
echo "Usage: image.tif bands(red green blue rededge nir)"
Rscript VI.R micasense_image.tif 3 2 1 4 5 micasense_image
echo "Done !"
