########################
## 全自动制作基础BOX  ##
########################
# 1.安装VirtualBox https://www.virtualbox.org
- win7 http://download.virtualbox.org/virtualbox/5.1.14/VirtualBox-5.1.14-112924-Win.exe
- win10 https://download.virtualbox.org/virtualbox/5.2.4/VirtualBox-5.2.4-119785-Win.
# 2.下载packer到当前目录 - https://www.packer.io/downloads.html  packer.exe
# 3.下载对应的系统到当前目录 - https://github.com/boxcutter
-（假设当前目录为 D:/vagrant/packer）
# 4.下载ubuntu-server https://www.ubuntu.com/download/server
http://mirrors.aliyun.com/ubuntu-releases/18.04/
http://cdimage.ubuntu.com/ubuntu/releases/18.04.4/release/

#######################################
# 以ubuntu举例
# 把代码拉下来https://github.com/boxcutter/ubuntu
#######################################
# cd D:/vagrant/packer/ubuntu
# D:/vagrant/packer/packer build -only=virtualbox-iso -var-file=ubuntu1804-local.json ubuntu.json


## 注意：如果本地已下载，可更改ubuntu/ubuntu1804.json文件
{
  "_comment": "Build with `packer build -var-file=ubuntu1804-local.json ubuntu.json`",
  "vm_name": "ubuntu1804",
  "cpus": "1",
  "disk_size": "65536",
  "iso_checksum": "sha256:8c5fc24894394035402f66f3824beb7234b757dd2b5531379cb310cedfdf0996",  
  "iso_name": "ubuntu-18.04.5-server-amd64.iso",
  "iso_url": "file:///D:/vagrant/packer/ubuntu-18.04.5-server-amd64.iso",
  "memory": "512",
  "preseed" : "preseed.cfg"
}
## 查看SHA256
# certutil -hashfile ubuntu-18.04.5-server-amd64.iso SHA256


########################
## 从虚拟机中导出盒子 ##
########################
- 在虚拟机上执行对应的cleanup.sh脚本，如：./ubuntu/script/cleanup.sh
# 修复ssh 用git bash登录，输入vagrant ssh
- mkdir -pm 700 /home/vagrant/.ssh && echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/vagrant/.ssh/authorized_keys && chmod 0600 /home/vagrant/.ssh/authorized_keys && chown -R vagrant:vagrant /home/vagrant/.ssh
- 然后在主机上执行{从虚拟机中导出盒子.bat}

