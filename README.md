How to build the container:
```
docker build -t tilemill-petz --build-arg http_proxy=$HTTP_PROXY --build-arg https_proxy=$HTTPS_PROXY
```
If you are running this on a dev machine with no direct access to db, you first
need to create a tunnel to the db machine:
```
ssh -L 0.0.0.0:5432:<db_host_name>:5432 -N workshop
```
Then you can run the container, specifying the tunnel route for homer
```
docker run -d -e no_proxy='<db_host_name>' -e TILEMILL_HOST='localhost' --add-host=<db_host_name>:<ip_address> -p 20008:20008 -p 20009:20009 -v /Users/gcc538/projects/docker-tilemill/basemap/cartocss:/root/Documents/MapBox/project tilemill-petz
```

