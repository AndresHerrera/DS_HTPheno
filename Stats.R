###########################################################
#Zonal Statistics Calculation
##########################################################
#
# Andres Herrera - fabio.herrera@correounivalle.edu.co
# Mario Castillo - mario.castillo@correounivalle.edu.co
#
# Code based on Calculo de estadisticas:
# Authors:  
# David Montero, dmontero@cenicana.org
# Mario Soto, msoto@cenicana.org
# Cesar Garcia, cegarcia@cenicana.org 
#
##########################################################

#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

#Load requiere libraries
require(maptools)
require(raster)

#print("Read Raster Files")
#grids <- list.files("data/input", pattern ="*.tif$")
#nfiles <- length(grids)
#print(paste("Raster files: ",nfiles))
#start.time <- Sys.time()
#print("Read Polygon Mask")
#poly <- readShapePoly("data/input/parcelas_mask.shp")
#print(poly)
#s<-stack(paste0("data/input/", grids))
#print(s)
#for(i in 1:nfiles)
#{
#   ex <- extract(s, poly , fun=mean , na.rm=TRUE, df=TRUE)
#}
#end.time <- Sys.time()
#time.taken <- end.time - start.time
#print(time.taken)
#df <- data.frame(ex)
#write.csv(df, file = "data/output/1.csv")
#print("END")


print("Read Shapefile Mask")
shp = shapefile(paste("data/input/",args[1],sep=""))
print(shp)

# Define an environment var
env = args[2]

path = "data/output/"
#  Filter only output files with a certain pattern
images = list.files(path, pattern = paste("^",args[2],"(.*)tif$",sep=""))
indices = list()
print(images)


for(i in 1:length(images)) 
{  
  img = raster(paste(path,"/", images[i], sep = ""))
  indices[[i]] = img
}

#print(indices)

media = NULL
minimo = NULL
maximo = NULL
stdev = NULL
suma = NULL
mediana = NULL
varianza = NULL

#TODO:  Fix Vector to Raster and Intersection

for(j in 1:length(indices))
{
   for (i in 1:nrow(shp)) 
   {
	#print(indices[j])
	#print(shp[i,])
	rpoly = raster(shp[i,])
	print(rpoly)
	print(indices[j])

	int1= intersect(indices[j],rpoly)
	print(int1)
	
	#masked= raster::intersect(indices[j],raster(shp[i,]))
	#print(masked)
	#s=cellStats(masked,stat ="mean",na.rm=T);
	#print(masked)
	#s=cellStats(mask(intersect(indices[j],shp[i,]),shp[i,]),stat ="mean",na.rm=T);
	#s=cellStats(mask(raster::intersect(indices[j],shp[i,]),shp[i,]),stat ="mean",na.rm=T);
        #media=c(media,s)
	#print(media)
   }
   #for (i in 1:nrow(shp)) {s=cellStats(mask(intersect(indices[j],shp[i,]),shp[i,]),stat ="min",na.rm=T);minimo=c(minimo,s)}
   #for (i in 1:nrow(shp)) {s=cellStats(mask(intersect(indices[j],shp[i,]),shp[i,]),stat ="max",na.rm=T);maximo=c(maximo,s)}
   #for (i in 1:nrow(shp)) {s=cellStats(mask(intersect(indices[j],shp[i,]),shp[i,]),stat ="sd",na.rm=T);stdev=c(stdev,s)}
   #for (i in 1:nrow(shp)) {s=cellStats(mask(intersect(indices[j],shp[i,]),shp[i,]),stat ="sum",na.rm=T);suma=c(suma,s)}
   #for (i in 1:nrow(shp)) {s=extract(indices[j],shp[i,],fun = median,na.rm=T);mediana=c(mediana,s)}
   #for (i in 1:nrow(shp)) {s=extract(indices[j],shp[i,],fun = var,na.rm=T);varianza=c(varianza,s)}
   #statics = NULL
   #statics = cbind(statics,ID)
   #statics = cbind(statics,media,minimo,maximo,stdev,suma,mediana,varianza)
   #nombre = strsplit(imagenes[j], "[.]")[1]
   #write.table(statics, paste(path,"/",nombre,sep=""), sep =";", dec = ".", row.names = F)
}

print("Done !")
