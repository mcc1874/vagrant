#https://github.com/mcc1874/vagrant

## 前置条件
- [安装VirtualBox] https://www.virtualbox.org
- [安装Vagrant] https://www.vagrantup.com
- [安装Vagrant plugin] cmd：vagrant plugin install vagrant-vbguest

## 下载对应的box放到对应目录：
- vagrant/centos/centos69-0.1.0.box

## 将后缀为example的copy一份并去掉后缀，
- bootstrap.sh.example => bootstrap.sh
- Vagrantfile.example => Vagrantfile

- 1.安装
- 2.启动（如失败请重新启动）
- 3.链接虚拟机（IP配置：Vagrantfile）
- ssh ip:22 root/vagrant


## 全自动制作box，请看packer