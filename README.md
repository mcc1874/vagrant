#https://github.com/mcc1874/vagrant

## 前置条件
- [安装VirtualBox]
windows：http://download.virtualbox.org/virtualbox/5.1.14/VirtualBox-5.1.14-112924-Win.exe
OSX：http://download.virtualbox.org/virtualbox/5.1.14/VirtualBox-5.1.14-112924-OSX.dmg
- [安装Vagrant]
windows：https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1.msi
OSX：https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1.dmg
- [安装Vagrant plugin]
cmd：vagrant plugin install vagrant-vbguest

- 说明：注意下载对应版本，其他版本不保证正确。

## 下载对应的box放到对应目录：
- vagrant/centos/centos69-0.1.0.box
- vagrant/lnmp/centos69-lnmp14-0.1.0.box

## 将后缀为example的copy一份并去掉后缀，
- bootstrap.sh.example => bootstrap.sh
- Vagrantfile.example => Vagrantfile

- 1.安装
- 2.启动（如失败请重新启动）
- 3.链接虚拟机（IP配置：Vagrantfile）
- ssh ip:22 root/vagrant