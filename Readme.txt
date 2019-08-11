Needs to use centos/systemd docker 

docker rm $(docker ps -a -q) -f ; docker rmi $(docker images -a -q); docker build --rm --no-cache -t pxe . ;  docker run --privileged --name pxe -v /sys/fs/cgroup:/sys/fs/cgroup:ro   -v "/Volumes/disk1/george-s/playpen/source/tftp":/var/ftp/pub  -p 80:80 -d pxe; docker exec -it pxe bash 

https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/

but now need to get on the same network as a client - preferably virtualbox to start testing.


