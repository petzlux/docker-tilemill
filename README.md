If you are running this on a dev machine with no direct access to db, you first
need to create a tunnel to the db machine:
```
ssh -L 0.0.0.0:5432:homer:5432 -N workshop
```
Then you can run the container, specifying the tunnel route for homer
```
docker run -d -it -e no_proxy='homer' --add-host=homer:148.110.80.232 -p 20008:20008 -p 20009:20009 -v /Users/gcc538/projects/docker-tilemill/basemap/cartocss:/root/Documents/MapBox/project tilemill-petz
```

