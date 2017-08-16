- service iptables stop && chkconfig iptables off
- yum -y install wget curl

#安装node
- curl --silent --location https://rpm.nodesource.com/setup_6.x | bash
- yum -y install nodejs

#安装yarn 代替npm的包管理器
- wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
- yum -y install yarn



#其他：
#升级node.js到最新稳定版
- npm install -g n
- n stable

#升级npm
- npm install -g npm

#安装yarn 第二种安装方法
- npm install -g yarn
