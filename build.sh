yum -y install mc gcc nano openssl-devel
wget https://github.com/z3APA3A/3proxy/archive/3proxy-0.8.3.tar.gz

tar -xvzf 3proxy-0.8.3.tar.gz
ln -s /usr/lib64/libcrypto.so.10 /usr/lib/libcrypto.so
ln -s /usr/lib64/libssl.so.10 /usr/lib/libssl.so

cd ./3proxy-3proxy-0.8.3/

nano /etc/proxy.h // #define ANONYMOUS 1

make -f Makefile.Linux

mkdir /usr/local/etc/3proxy
mkdir /usr/local/etc/3proxy/bin
mkdir /usr/local/etc/3proxy/logs
mkdir /usr/local/etc/3proxy/stat

cp src/3proxy /usr/local/etc/3proxy/bin
cp ./scripts/rc.d/proxy.sh /etc/init.d/3proxy
chkconfig 3proxy on

cp cfg/3proxy.cfg.sample /usr/local/etc/3proxy/3proxy.cfg

chown -R nobody:nobody /usr/local/etc/3proxy
chmod -R 777 /etc/init.d/3proxy

cd /usr/local/etc/3proxy
nano /usr/local/etc/3proxy/3proxy.cfg

/usr/local/etc/3proxy/bin/3proxy /usr/local/etc/3proxy/3proxy.cfg
tail -f /usr/local/etc/3proxy/logs/3proxy.log.
ps -ef | grep 3proxy
service 3proxy start
