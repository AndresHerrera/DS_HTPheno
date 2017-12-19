## Docker 
* docker images
* docker build -t htpheno .
* docker run --rm -it htpheno

* cd data 
* sudo docker run -it -v $(pwd):/source/data --entrypoint /bin/bash --rm htpheno

## upload input images
* scp micasense_image.tif semhc1@45.5.XXX.XXX:/home/semhc1/data/input

## getting all result images
* scp semhc1@45.5.XXX.XXX:/home/semhc1/*.* .

### From Docker Hub 

* docker pull andresherrera/dshtpheno

* docker run -it -v $(pwd):/source/data --entrypoint /bin/bash --rm  andresherrera/dshtpheno

