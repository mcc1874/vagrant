- sudo apt update
- sudo apt install python2.7 python2.7-dev
- sudo apt install openjdk-8-jdk
- sudo apt install nginx
- sudo apt install php php-dev
- sudo apt install redis-server
- sudo apt install git
- sudo apt install composer


## 常用命令
- service nginx reload
- service php7.0-fpm reload
- service redis-server restart


## 常用文件/目录
- /etc/nginx/nginx.conf
- /etc/php/7.0/fpm/php.ini
- /usr/lib/php/20151012


## nginx 相关配置 ##
# vi /etc/nginx/nginx.conf
# 更改日志路径
- access_log /data/logs/access.log;
- error_log /data/logs/error.log;
# 关闭sendfile
- sendfile off;
# 添加新的nginx vhost目录
- 在include /etc/nginx/conf.d/*.conf; 后面增加一条
- include /data/vhost/*.conf;


## php 相关配置 ##
# 显示错误
- sed -i 's/^display_errors =.*/display_errors = On/g' /etc/php/7.0/fpm/php.ini
# 错误级别
- sed -i 's/^error_reporting =.*$/error_reporting = E_ALL \& ~E_NOTICE/g' /etc/php/7.0/fpm/php.ini
# 打开禁用函数
- sed -i 's/^disable_functions =.*$/disable_functions = /g' /etc/php/7.0/fpm/php.ini


## php模块安装
# 搜索PHP支持模块
- apt-cache search php7.0
# 搜索PHP已安装模块
- php -m
# 安装模块
- apt -y install php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache  php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext php-bcmath php-xdebug


## phpredis扩展安装配置
- git clone https://github.com/phpredis/phpredis.git
- mv phpredis/ /etc/ && cd /etc/phpredis
- phpize && ./configure
- make && make install
- echo 'extension=redis.so' >> /etc/php/7.0/fpm/php.ini


## xdebug扩展配置
- echo 'zend_extension=xdebug.so' >> /etc/php/7.0/fpm/php.ini
- echo 'xdebug.remote_enable=1' >> /etc/php/7.0/fpm/php.ini
- echo 'xdebug.remote_port=9000' >> /etc/php/7.0/fpm/php.ini
- echo 'xdebug.remote_connect_back=1' >> /etc/php/7.0/fpm/php.ini


##重启服务
- service php7.0-fpm reload
- service nginx reload