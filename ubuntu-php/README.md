# 更换源
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo wget -O /etc/apt/sources.list http://mirrors.cloud.tencent.com/repo/ubuntu18_sources.list
sudo apt clean all
sudo apt update
sudo apt list --upgradable

sudo apt install -y python
sudo apt install -y openjdk-8-jdk
sudo apt install -y nginx
sudo apt install -y php-fpm
sudo apt install -y redis-server
sudo apt install -y git composer zip
sudo apt install -y lrzsz

## 安装npm
sudo apt install -y nodejs npm
sudo npm config set registry https://registry.npm.taobao.org
sudo npm install n -g
sudo n stable #安装稳定版

## 设置composer服务
sudo composer config -g repo.packagist composer https://mirrors.cloud.tencent.com/composer/

## 设置root密码
sudo passwd root
vagrant

## 常用命令
sudo /etc/init.d/nginx restart
sudo /etc/init.d/php7.2-fpm restart
sudo /etc/init.d/redis-server restart


## 常用文件/目录
/etc/nginx/nginx.conf
/etc/php/7.2/fpm/php.ini
/etc/php/7.2/cli/php.ini
/usr/lib/php/20170718
/data/www
/data/vhost
/data/logs
/data/src


## nginx 相关配置 ##
# sudo vi /etc/nginx/nginx.conf
worker_connections 102400;
# 关闭sendfile
sendfile off;
server_tokens off;
# 更改日志路径
access_log /data/logs/access.log;
error_log /data/logs/error.log;
# 添加新的nginx vhost目录
在include /etc/nginx/conf.d/*.conf; 后面增加一条
include /data/vhost/*.conf;


## php 相关配置 ##
# 显示错误
sudo sed -i 's/^display_errors =.*/display_errors = On/g' /etc/php/7.2/fpm/php.ini
# 错误级别
sudo sed -i 's/^error_reporting =.*$/error_reporting = E_ALL \& ~E_NOTICE/g' /etc/php/7.2/fpm/php.ini
# 打开禁用函数
sudo sed -i 's/^disable_functions =.*$/disable_functions = /g' /etc/php/7.2/fpm/php.ini


## php模块安装
# 搜索PHP支持模块
apt-cache search php7.2
# 搜索PHP已安装模块
php -m
# 安装模块
sudo apt -y install php7.2-mysql php7.2-curl php7.2-gd php7.2-intl php-pear php-imagick php7.2-imap php-memcache php7.2-pspell php7.2-recode php7.2-sqlite3 php7.2-tidy php7.2-xmlrpc php7.2-xsl php7.2-mbstring php-gettext php-bcmath php-xdebug php7.2-zip php-redis


文件打开数：
# sudo vi /etc/security/limits.conf
* - nofile 65536

# sudo vi /etc/sysctl.conf
fs.file-max = 65536

============nginx 优化
# 与php 通讯方式
fastcgi_pass 127.0.0.1:9000;

===========php 优化
sudo vi /etc/php/7.2/fpm/pool.d/www.conf
listen = 127.0.0.1:9000
pm = static
pm.max_children = 5  #生产服100



