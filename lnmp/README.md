##centos69-lnmp14-0.1.0.box


#关闭iptables && selinux
- service iptables stop && chkconfig iptables off
- setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config


#安装基本工具
- yum -y install wget git curl python-setuptools
- 经过clean up 后的box 可能缺少(yum -y install autoconf gcc)


#配置基本目录
- mkdir -p /data/logs /data/src /data/supervisor /data/wwwroot /data/vhost && chmod -R 777 /data/logs

#配置守护进程supervisor 文档http://www.jianshu.com/p/326da8d1ba84
- easy_install pip supervisor && echo_supervisord_conf > /etc/supervisord.conf
- sed -i 's/^;files =.*/files = \/data\/supervisor\/*.conf/g' /etc/supervisord.conf


#安装ImageMagick  7.0有BUG roundCorners
- cd /data/src
- wget https://www.imagemagick.org/download/ImageMagick-6.9.9-5.tar.gz
- tar -zxvf ImageMagick-6.9.9-5.tar.gz && cd ImageMagick-6.9.9-5
- ./configure --prefix=/usr/local/imagemagick && make && make install


#安装lnmnp (mysql5.7/php7.1) 官网http://lnmp.org
- cd /data/src && git clone -b v1.4 https://github.com/licess/lnmp.git && chmod -R 777 lnmp && cd lnmp && ./install.sh


#php 显示错误 && 不禁用函数
- cp /usr/local/php/etc/php.ini /usr/local/php/etc/php.ini.bak
- sed -i 's/^display_errors =.*/display_errors = On/g' /usr/local/php/etc/php.ini
- sed -i 's/^error_reporting =.*$/error_reporting = E_ALL \& ~E_NOTICE/g' /usr/local/php/etc/php.ini
- sed -i 's/^disable_functions =.*$/disable_functions = /g' /usr/local/php/etc/php.ini

#添加新的nginx vhost目录 && 关闭sendfile
- cp /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.bak
- sed -i 's/sendfile   on/sendfile   off/g' /usr/local/nginx/conf/nginx.conf
- sed -i '/^include vhost.*/a\include /data/vhost/*.conf;' /usr/local/nginx/conf/nginx.conf

#注释open_basedir
- cp /usr/local/nginx/conf/fastcgi.conf /usr/local/nginx/conf/fastcgi.conf.bak
- sed -i '/^fastcgi_param PHP_ADMIN_VALUE/s/^/#/' /usr/local/nginx/conf/fastcgi.conf

#mysql开启远程
- mysql -uroot -proot
- mysql>use mysql;
- mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
- mysql>flush privileges;


#用lnmp安装扩展(xcache/Redis/memcached/eAccelerator/imageMagick)
- cd /data/src/lnmp
- ./addons.sh install memcached
- ./addons.sh install redis
- （注意：./addons.sh install imagemagick 有BUG roundCorners）

#安装php扩展 - xdebug
- cd /data/src && wget -c https://xdebug.org/files/xdebug-2.5.5.tgz && tar -zxvf xdebug-2.5.5.tgz && cd xdebug-2.5.5
- phpize && ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install
- echo 'zend_extension=xdebug.so' >> /usr/local/php/etc/php.ini
- echo 'xdebug.remote_enable=1' >> /usr/local/php/etc/php.ini
- echo 'xdebug.remote_port=9000' >> /usr/local/php/etc/php.ini
- echo 'xdebug.remote_connect_back=1' >> /usr/local/php/etc/php.ini


#安装php扩展libzookeeper/zookeeper
- cd /data/src && wget -c http://mirror.bit.edu.cn/apache/zookeeper/stable/zookeeper-3.4.10.tar.gz && tar -zxvf zookeeper-3.4.10.tar.gz && cd zookeeper-3.4.10/src/c
- ./configure --prefix=/usr/local/zookeeper && make && make install

- cd /data/src && wget -c http://pecl.php.net/get/zookeeper-0.3.2.tgz && tar -zxvf zookeeper-0.3.2.tgz && cd zookeeper-0.3.2
- phpize && ./configure --with-php-config=/usr/local/php/bin/php-config --with-libzookeeper-dir=/usr/local/zookeeper && make && make install

#安装php扩展 - imagick
- wget http://pecl.php.net/get/imagick-3.4.3.tgz
- tar -zxvf imagick-3.4.3.tgz && cd imagick-3.4.3
- phpize && ./configure --with-php-config=/usr/local/php/bin/php-config --with-imagick=/usr/local/imagemagick && make && make install
- echo 'extension=imagick.so' >> /usr/local/php/etc/php.ini

#配置composer
- composer config -g repos.packagist composer https://packagist.jp

#其他
- php扩展目录：/usr/local/php/lib/php/extensions/no-debug-non-zts-20160303/
