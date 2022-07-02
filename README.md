#https://github.com/mcc1874/vagrant

## 前置条件
- [安装VirtualBox] https://www.virtualbox.org
- https://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-Win.exe
- [安装Vagrant] https://www.vagrantup.com
- win7 https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1.msi
- win10 https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.msi
- [CPU开启虚拟化技术]
- 请进入BIOSS设置

## 下载对应的box放到对应目录：
- vagrant/ubuntu/ubuntu-0.1.0.box
https://pan.baidu.com/s/1PK2RTgWWvAtkmxDqklRjwA

## 将后缀为example的copy一份并去掉后缀，
- bootstrap.sh.example => bootstrap.sh
- Vagrantfile.example => Vagrantfile

- 1.安装
- 2.启动（如失败请重新启动）
- 3.链接虚拟机（IP配置：Vagrantfile）
- ssh ip:22 vagrant/vagrant


## 全自动制作box，请看packer


## vagrant 安装查件慢
类似 vagrant plugin install 查件名 --plugin-clean-sources --plugin-source https://gems.ruby-china.com


## 如何共享本地环境
···
# Vagrant Share允许您与世界上的任何人共享您的Vagrant环境，只
# 需一个命令即可在几乎任何网络环境中直接在您的Vagrant环境中进行协作： vagrant share。
# https://www.vagrantup.com/docs/share/
# https://ngrok.com/download

方法2
ngrok http -region ap -host-header=rewrite 本机虚拟域名:80

hosts 10.10.10.11 本机虚拟域名
···


## 公共box仓库
# https://app.vagrantup.com/boxes/search
