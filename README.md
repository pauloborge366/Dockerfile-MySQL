# Dockerfile-MySQL

#Create a container named "some-mysql" from the "mysql: test" image.

sudo docker run --name some-mysql -h some-mysql -p 3306:3306 -v $HOME/mysql:/var/lib/mysql -d mysql:test

#Use these commands above, after loading the Dockerfile.

sudo docker build -t mysql:test .
