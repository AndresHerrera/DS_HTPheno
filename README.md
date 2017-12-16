## Vagrant Notes
#### Just for testing into a vagrant box with a htcondor 
* vagrant box list
* vagrant init hashicorp/precise64
* cd vagrant

* vagrant up
* ssh -p 2222 vagrant@localhost

#### or  

* vagrant ssh 

## Docker notes
* docker images
* docker build -t htpheno .
* docker run --rm -it htpheno

* cd data 
* sudo docker run -it -v $(pwd):/source/data --entrypoint /bin/bash --rm htpheno

## upload input images
scp micasense_image.tif andresherrera@52.224.176.168:/home/andresherrera/DS_HTPheno/data/input

## getting all result images
scp andresherrera@52.224.176.168:/home/andresherrera/DS_HTPheno/data/output/*.* .

