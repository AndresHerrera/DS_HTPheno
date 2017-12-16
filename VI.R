###########################################################
#Vegetation Indices Calculation
##########################################################
#
# Andres Herrera - fabio.herrera@correounivalle.edu.co
# Mario Castillo - mario.castillo@correounivalle.edu.co
#
# Code based on Calculo de indices:
# Authors:  
# David Montero, dmontero@cenicana.org
# Mario Soto, msoto@cenicana.org
# Cesar Garcia, cegarcia@cenicana.org 
#
##########################################################

#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

#Load requiere libraries
require(sp)
require(Rcpp)
require(rgdal)
require(raster)

#Read Images

print("Read Raster Image")
img = stack(paste("data/input/",args[1],sep=""))
print(img)

path = "data/output/"

#Image reprojection if needed

if(compareCRS(crs(img),CRS("+init=epsg:3115")) == FALSE)
{
  print("EPSG:3115 Reprojection")
  img = projectRaster(img,crs = CRS("+init=epsg:3115"),res = 0.1,method = "bilinear")
}

#Visible bands
R = img[[strtoi(args[2])]]
G = img[[strtoi(args[3])]]
B = img[[strtoi(args[4])]]
# RedEdge band
RE = img[[strtoi(args[5])]]
# Infrared Band
N = img[[strtoi(args[6])]]

# Define an environment var
env = args[7]

# Indices calculation
print("Indices Calculation")

start.time <- Sys.time()

ind = round(((N-R)/(N+R))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RENDVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RENDVI Done!')
i1.time <- Sys.time()
t1.taken <- i1.time - start.time
print(t1.taken)


ind = round(((RE-R)/(RE+R))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RENDVIRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RENDVIRE Done!')

i2.time <- Sys.time()
t2.taken <- i2.time - start.time
print(t2.taken)


ind = round(((N-RE)/(N+RE))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RENDRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RENDRE Done!')

i3.time <- Sys.time()
t3.taken <- i3.time - start.time
print(t3.taken)

ind = round(((N-G)/(N+G))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REGNDVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REGNDVI Done!')

i4.time <- Sys.time()
t4.taken <- i4.time - start.time
print(t4.taken)


ind = round(((RE-G)/(RE+G))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REGNDRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REGNDRE Done!')

i5.time <- Sys.time()
t5.taken <- i5.time - start.time
print(t5.taken)


ind = round(((N-B)/(N+B))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REBNDVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REBNDVI Done !')

i6.time <- Sys.time()
t6.taken <- i6.time - start.time
print(t6.taken)

ind = round(((RE-B)/(RE+B))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REBNDRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REBNDRE Done !')

i7.time <- Sys.time()
t7.taken <- i7.time - start.time
print(t7.taken)


ind = round((2.5*(N-R)/(N+6*R-7.5*B+1))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REEVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REEVI Done !')

i8.time <- Sys.time()
t8.taken <- i8.time - start.time
print(t8.taken)

ind = round((2.5*(RE-R)/(RE+6*R-7.5*B+1))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REEVIRE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REEVIRE1 Done !')

i9.time <- Sys.time()
t9.taken <- i9.time - start.time
print(t9.taken)

ind = round((2.5*(N-RE)/(N+6*RE-7.5*B+1))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REEVIRE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REEVIRE2 Done !')

i10.time <- Sys.time()
t10.taken <- i10.time - start.time
print(t10.taken)

ind = round((1.5*(N-R)/(N+R+0.5))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RESAVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RESAVI Done !')

i11.time <- Sys.time()
t11.taken <- i11.time - start.time
print(t11.taken)

ind = round((1.5*(RE-R)/(RE+R+0.5))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RESAVIRE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RESAVIRE1 Done !')

i12.time <- Sys.time()
t12.taken <- i12.time - start.time
print(t12.taken)

ind = round((1.5*(N-RE)/(N+RE+0.5))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RESAVIRE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RESAVIRE2 Done !')

i13.time <- Sys.time()
t13.taken <- i13.time - start.time
print(t13.taken)

ind = round((0.5*(2*N+1-sqrt(((2*N+1)^2)-8*(N-R))))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REMSAVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REMSAVI Done !')

i14.time <- Sys.time()
t14.taken <- i14.time - start.time
print(t14.taken)

ind = round((0.5*(2*RE+1-sqrt(((2*RE+1)^2)-8*(RE-R))))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REMSAVIRE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REMSAVIRE1 Done !')

i15.time <- Sys.time()
t15.taken <- i15.time - start.time
print(t15.taken)

ind = round((0.5*(2*N+1-sqrt(((2*N+1)^2)-8*(N-RE))))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REMSAVIRE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REMSAVIRE2 Done !')

i16.time <- Sys.time()
t16.taken <- i16.time - start.time
print(t16.taken)


ind = round((0.5*(120*(N-G)-200*(R-G)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RETVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RETVI Done !')

i17.time <- Sys.time()
t17.taken <- i17.time - start.time
print(t17.taken)

ind = round((0.5*(120*(RE-G)-200*(R-G)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RETVIRE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RETVIRE1 Done !')

i18.time <- Sys.time()
t18.taken <- i18.time - start.time
print(t18.taken)

ind = round((0.5*(120*(N-G)-200*(RE-G)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RETVIRE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RETVIRE2 Done !')

i19.time <- Sys.time()
t19.taken <- i19.time - start.time
print(t19.taken)


ind = round((1.5*(2.5*(N-G)-2.5*(R-G))/sqrt(((2*N+1)^2)-6*N-5*sqrt(R)-0.5))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REMTVI2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REMTVI2 Done !')

i20.time <- Sys.time()
t20.taken <- i20.time - start.time
print(t20.taken)

ind = round((1.5*(2.5*(RE-G)-2.5*(R-G))/sqrt(((2*RE+1)^2)-6*RE-5*sqrt(R)-0.5))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REMTVI2RE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REMTVI2RE1 Done !')

i21.time <- Sys.time()
t21.taken <- i21.time - start.time
print(t21.taken)

ind = round((1.5*(2.5*(N-G)-2.5*(RE-G))/sqrt(((2*N+1)^2)-6*N-5*sqrt(RE)-0.5))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REMTVI2RE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REMTVI2RE2 Done !')

i22.time <- Sys.time()
t22.taken <- i22.time - start.time
print(t22.taken)

ind = round((N*R/((G)^2))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECVI Done !')

i23.time <- Sys.time()
t23.taken <- i23.time - start.time
print(t23.taken)

ind = round((RE*R/((G)^2))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECVIRE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECVIRE1 Done !')

i24.time <- Sys.time()
t24.taken <- i24.time - start.time
print(t24.taken)

ind = round((N*RE/((G)^2))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECVIRE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECVIRE2 Done !')

i25.time <- Sys.time()
t25.taken <- i25.time - start.time
print(t25.taken)

ind = round((N/R-1)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECI Done !')

i26.time <- Sys.time()
t26.taken <- i26.time - start.time
print(t26.taken)

ind = round((RE/R-1)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECIRE1.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECIRE1 Done !')

i27.time <- Sys.time()
t27.taken <- i27.time - start.time
print(t27.taken)

ind = round((N/RE-1)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECIRE2.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECIRE2 Done !')

i28.time <- Sys.time()
t28.taken <- i28.time - start.time
print(t28.taken)

ind = round((N/G-1)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECIG.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECIG Done !')

i29.time <- Sys.time()
t29.taken <- i29.time - start.time
print(t29.taken)

ind = round((RE/G-1)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RECIGRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RECIGRE Done !')

i30.time <- Sys.time()
t30.taken <- i30.time - start.time
print(t30.taken)

ind = round(((G-R)/(G+R))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RENGRDI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RENGRDI Done !')

i31.time <- Sys.time()
t31.taken <- i31.time - start.time
print(t31.taken)

ind = round(((2*G-R-B)/(2*G+R+B))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REGLI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REGLI Done !')

i32.time <- Sys.time()
t32.taken <- i32.time - start.time
print(t32.taken)

ind = round(((G-R)/(G+R-B))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REVARI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REVARI Done !')

i33.time <- Sys.time()
t33.taken <- i33.time - start.time
print(t33.taken)

ind = round((((N+G)-(2*B))/((N+G)+(2*B)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REENDVI.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REENDVI Done !')

i34.time <- Sys.time()
t34.taken <- i34.time - start.time
print(t34.taken)

ind = round((((RE+G)-(2*B))/((RE+G)+(2*B)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REENDRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REENDRE Done !')

i35.time <- Sys.time()
t35.taken <- i35.time - start.time
print(t35.taken)

ind = round((2*(G/(R+G+B)-R/(R+G+B)-B/(R+G+B)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REExG.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REExG Done !')

i36.time <- Sys.time()
t36.taken <- i36.time - start.time
print(t36.taken)

ind = round((2*(G/(RE+G+B)-RE/(RE+G+B)-B/(RE+G+B)))*10000,0); 
writeRaster(ind,paste(path,'/',env,'_REExGRE.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('REExGRE Done !')

i37.time <- Sys.time()
t37.taken <- i37.time - start.time
print(t37.taken)

ind = round((B)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RE475.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RE475 Done!')

i38.time <- Sys.time()
t38.taken <- i38.time - start.time
print(t38.taken)

ind = round((G)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RE560.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RE560 Done!')

i39.time <- Sys.time()
t39.taken <- i39.time - start.time
print(t39.taken)

ind = round((R)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RE668.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RE668 Done !')

i40.time <- Sys.time()
t40.taken <- i40.time - start.time
print(t40.taken)

ind = round((RE)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RE717.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RE717 Done!')

i41.time <- Sys.time()
t41.taken <- i41.time - start.time
print(t41.taken)

ind = round((N)*10000,0); 
writeRaster(ind,paste(path,'/',env,'_RE840.tif',sep=''),datatype='INT4S'); 
remove(ind); 
print('RE840 Done!')

print("Indices Calculation Done !")

end.time <- Sys.time()
end.taken <- end.time - start.time
print(end.taken)

