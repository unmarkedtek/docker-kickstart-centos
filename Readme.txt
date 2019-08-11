==Prerequisites On Docker Host==
hdiutil attach -nomount CentOS-7-x86_64-DVD-1810.iso
sudo mount -t cd9660 /dev/disk2 /mnt
cp -av /mnt/* /disk1/george-s/playpen/source/tftp


==To Run==
docker rm $(docker ps -a -q) -f ; docker rmi $(docker images -a -q); docker build --rm --no-cache -t pxe . ;  docker run --privileged --name pxe -v /sys/fs/cgroup:/sys/fs/cgroup:ro   -v "/Volumes/disk1/george-s/playpen/source/tftp":/var/ftp/pub  -p 80:80 -d pxe; docker exec -it pxe bash 

==To Do==
but now need to get on the same network as a client - preferably virtualbox to start testing.


==NOTES==
Needs to use centos/systemd docker
https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/

==REF==
https://www.linuxtechi.com/configure-pxe-installation-server-centos-7/

https://unix.stackexchange.com/questions/298685/can-a-mac-mount-a-debian-install-cd

https://github.com/xrowgmbh/docker-systemd-example-httpd

https://www.server-world.info/en/note?os=CentOS_7&p=dhcp
