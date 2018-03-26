#自动安装请看packer

#手动安装
#从ios创建ubuntu 16.04.3-64x box

网络:
    网卡1, 网络地址转换(NAT)
    网卡2, 仅主机(Host-Only)适配器

设置vagrant用户：vagrant/vagrant
设置root密码：sudo passwd

更新/安装 apt update && apt -y install gcc make openssh-server

允许密码登录 
vi /etc/ssh/sshd_config {
	PermitRootLogin yes
}
/etc/init.d/ssh restart

sudo vi /etc/resolv.conf {
	nameserver 10.0.2.3
}


配置私有网络
vi /etc/network/interfaces {
	auto enp0s8
	iface enp0s8 inet dhcp
}
重启reboot


安装 VBoxGuestAdditions
挂载iso (VirtualBox 目录上传VBoxGuestAdditions.iso)
输入命令：mkdir /mnt/cdrom && mount /dev/cdrom /mnt/cdrom
输入命令：cd /mnt/cdrom && ./VBoxLinuxAdditions.run

SSH免登录证书
输入命令：groupadd vagrant
输入命令：useradd vagrant -g vagrant -G wheel
输入命令：echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
输入命令：mkdir -pm 700 /home/vagrant/.ssh && echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/vagrant/.ssh/authorized_keys
输入命令：chmod 0600 /home/vagrant/.ssh/authorized_keys && chown -R vagrant:vagrant /home/vagrant/.ssh


瘦身
rm -rf /tmp/* && apt clean

导出盒子
