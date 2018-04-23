#https://github.com/mcc1874/vagrant

## 前置条件
- [安装VirtualBox] https://www.virtualbox.org
- https://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-Win.exe
- [安装Vagrant] https://www.vagrantup.com
- https://releases.hashicorp.com/vagrant/1.9.7/vagrant_1.9.7_x86_64.msi
- [CPU开启虚拟化技术]
- 请进入BIOSS设置

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
