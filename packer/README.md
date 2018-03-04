全自动制作基础BOX
1.安装virtualbox - https://www.virtualbox.org
2.安装vagrant - https://www.vagrantup.com
3.下载packer到当前目录 - https://www.packer.io/downloads.html
4.下载对应的系统到当前目录 - https://github.com/boxcutter
（假设当前目录为 D:/vagrant/packer）
5.ubuntu https://www.ubuntu.com/download/server

#######################################
#以ubuntu举例
#把代码拉下来https://github.com/boxcutter/ubuntu
#######################################
cd D:/vagrant/packer/ubuntu
D:/vagrant/packer/packer build -only=virtualbox-iso -var-file=ubuntu1604.json ubuntu.json


注意：如果本地已下载，可更改ubuntu/ubuntu1604.json文件
D:/vagrant/packer/packer build -only=virtualbox-iso -var-file=ubuntu1604.json ubuntu.json
{
  "_comment": "Build with `packer build -var-file=ubuntu1604-local.json ubuntu.json`",
  "vm_name": "ubuntu1604",
  "cpus": "1",
  "disk_size": "65536",
  "iso_checksum": "ee834fbeb94cc55972b38caafa2029c29625e2e8",
  "iso_checksum_type": "sha1",
  "iso_name": "ubuntu-16.04.4-server-amd64",
  "iso_url": "file:///E:/Download/ubuntu-16.04.4-server-amd64.iso",
  "memory": "512",
  "preseed" : "preseed.cfg"
}


查看SHA1
certutil -hashfile ubuntu-16.04.4-server-amd64.iso SHA1