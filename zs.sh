#!/bin/bash
echo "Zonal Statistics for HTPhenotyping"
echo "Usage: Mask shape [.shp] env"
Rscript Stats.R parcelas_mask.shp micasense_image
echo "Done !"
