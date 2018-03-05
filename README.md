#https://github.com/mcc1874/vagrant

## 前置条件
- [安装VirtualBox] https://www.virtualbox.org
- win7 http://download.virtualbox.org/virtualbox/5.1.14/VirtualBox-5.1.14-112924-Win.exe
- win10 https://download.virtualbox.org/virtualbox/5.2.4/VirtualBox-5.2.4-119785-Win.exe
- [安装Vagrant] https://www.vagrantup.com
- win7 https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1.msi
- win10 https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.msi
- [安装Vagrant plugin]
- vagrant plugin install vagrant-vbguest

## 下载对应的box放到对应目录：
- vagrant/ubuntu/ubuntu-0.1.0.box

## 将后缀为example的copy一份并去掉后缀，
- bootstrap.sh.example => bootstrap.sh
- Vagrantfile.example => Vagrantfile

- 1.安装
- 2.启动（如失败请重新启动）
- 3.链接虚拟机（IP配置：Vagrantfile）
- ssh ip:22 vagrant/vagrant


## 全自动制作box，请看packer
