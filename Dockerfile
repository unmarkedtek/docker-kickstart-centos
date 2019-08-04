FROM centos/systemd

MAINTAINER "george siddiqui" georgesiddiqui@gmail.com 

RUN yum -y  install dhcp tftp tftp-server syslinux vsftpd xinetd net-tools; yum clean all
ADD files/dhcpd.conf /etc/dhcp/dhcpd.conf
ADD files/dhcpd /etc/sysconfig/dhcpd
RUN mkdir -p /var/lib/tftpboot/networkboot; ln -s /var/ftp/pub/images/pxeboot/vmlinuz /var/lib/tftpboot/networkboot/vmlinuz ; ln -s /var/ftp/pub/images/pxeboot/initrd.img /var/lib/tftpboot/networkboot/initrd.img
RUN mkdir -p /var/ftp/pub/; mkdir -p /var/lib/tftpboot/pxelinux.cfg/
ADD files/default /var/lib/tftpboot/pxelinux.cfg/default
ADD files/centos7.cfg /var/ftp/pub/centos7.cfg
RUN systemctl enable dhcpd.service; systemctl enable xinetd.service; systemctl enable vsftpd.service 

EXPOSE 80

CMD ["/usr/sbin/init"]
