## How to build Oracle custom image for Porta


1) Clone Oracle Docker build files

git clone https://github.com/oracle/docker-images/

2) Download Oracle Database 19c for linux as Zip file, accepting the license is necessary.
https://www.oracle.com/database/technologies/oracle-database-software-downloads.html#19c

3) Place the downloaded zip file inside of the docker-images/OracleDatabase/SingleInstance/dockerfiles/19.3.0
This directory is present in the repository you cloned in step 1.

4) Then execute these command

```
cd docker-images/OracleDatabase/SingleInstance/dockerfiles/
./buildDockerImage.sh -e -v 19.3.0
```

This will create an image called `oracle/database:19.3.0`, we need this image image to create our custom image:

Run in this repository and watch the logs to see when the database is ready:

```
oracle/build-image.sh
```

When the DATABASE is ready, run:

```
docker stop -t 600 oracle-custom
docker commit -m "Creating custom image of Oracle for 3scale/porta" oracle-custom quay.io/3scale/oracle:19.3.0-ee-ci-prebuilt
```
