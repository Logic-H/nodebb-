#!/bin/bash

#作者：logich| a fish lover
#感谢nodebb-cn
#动画开始
clear
echo " _____      ______      ______     ______     ______     ______"
echo "/     \    /      \    |      \   |          |      \   |      \ "
echo "|     |   |        |   |      |   |          |      /   |      /"
echo "|  F  |   |        | I |      |   |——————  S |——————    |———H——"
echo "|     |   |        |   |      |   |          |      \   |      \ "
echo "|     |    \______/    |______/   |______    |______/   |______/"
sleep 3s
clear
echo " _     ___   ____ ___ ____ _   _ "
echo "| |   / _ \ / ___|_ _/ ___| | | |"
echo "| |  | | | | |  _ | | |   | |_| |"
echo "| |__| |_| | |_| || | |___|  _  |"    
echo "|_____\___/ \____|___\____|_| |_|"

sleep 3s
clear
echo "鸣谢 nodebb .Inc nodebb中文社区 以及 nodebb中国 群"
echo "Thanks for nodebb .Inc nodebb-cn and nodebb中国 QQ group"
sleep 3s
#正文开始

#函数
ask_user(){
	echo -e "\e[92m\e[41m$3\e[39m\e[49m"
	while true
	do
		read -p "请输入 $1" USER_INPUT
		echo "$1" | tr "/" "\n" | grep -Eiq "^${USER_INPUT}$" && eval "$2=\"$USER_INPUT\"" && break
	done
}
INFO="[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]"
echo -e "\e[101m[WARN]所有选择请使用小写字符|[WARN]All options use Lowercase letters\e[49m"
ask_user "y/n" "YES_OR_NO" "您需要切换到英文吗？|Do you want to use English?"
[ "$YES_OR_NO" = "y" ] && {
    L1="Quick installation script for nodebb on Ubuntu"
    L2="[IMPORTANT]We need to make sure that the apt is not occupied and that the software will be update,Otherwise we will fail."
    L3="Start getting parameters"
    L4="Is your server overseas or in mainland China? It doesn't matter, but it affects speed."
    L5="Please use M/O, M to represent the mainland, O means overseas; if you want to use official download links, please input O."
    L6="done, backup is in /root."
    L7="Which database do you want to use,redis or mongoDB?"
    L8="Please use R/M, R represents redis, and M represents mongoDB."
    L9="redis choosed"
    L10="Enter the password of redis"
    L11="It is detected that you have already installed redis-server in the system. Have you set the password?"
    L12="Please use Y/N, Y means yes, N means no."
    L13="We will not set password for you,pleaseuse your old password"
    L14="Enter the password of redis"
    L15="Database mongoDB"
    L16="Enter the path for nodebb (default /root/nodebb)."
    L17="Please do not create folders, we will create automatically for you."
    L18="We will use apt. We need to make sure that apt is not occupied, and we will update the software."
    L19="apt update completed"
    L20="Start installing curl"
    L21="done"
    L22="script is running."
    L23="Nodejs installation completed"
    L24="Start installing redis"
    L25="done"
    L26="Redis security settings completed"
    L27="done, Please check if there has error."
    L28="Read the system information,start setting source."
    L29="Start installing mongoDB"
    L30="done"
    L31="Please complete the security settings yourself, press enter to continue, Ctrl+C quit."
    L32="Start installing git"
    L33="done"
    L34="Clone nodebb completed"
    L35="Start installing nodebb"
    L36="Next, please install nodebb by yourself"
	L37="Do you want to install nginx? If it is your first installation, it is extremely not recommended that nginx be installed."
    L38="Server nginx"
}
[ "$YES_OR_NO" = "n" ] && {
	L1="nodebb on Ubuntu快速设置脚本启动"
	L2="[重要]请确保apt没有被占用，否则将造成无法安装"
	L3="开始获取参数"
	L4="您的服务器在大陆还是海外？这无关紧要，但是影响速度\e[49m"
	L5="请使用M/O，M表示大陆，O表示海外；如果您想使用官方的下载，请输入O"
	L6="软件源设置成功，旧的源备份在/root下"
	L7="您想使用那种数据库，redis还是mongoDB？"
	L8="请使用R/M，R表示redis，M表示mongoDB"
	L9="数据库redis"
	L10="输入用于redis的密码"
	L11="检测到系统中存在redis-server，您是否设置过它的密码？"
	L12="请使用Y/N，Y表示是，N表示否"
	L13="脚本将不再设置密码，请牢记您以前的密码"
	L14="输入用于redis的密码"
	L15="数据库mongoDB"
	L16="输入安装nodebb的路径（留空为/root/nodebb）"
	L17="请不要创建文件夹，我们将会为您自动创建"
	L18="正在设置apt，我们需要确保apt没有被占用，同时将更新软件"
	L19="系统源更新完成"
	L20="开始设置curl"
	L21="curl设置完毕"
	L22="nodejs快速脚本运行完毕"
	L23="nodejs安装完成"
	L24="开始安装redis"
	L25="redis安装完成"
	L26="redis安全设置完成"
	L27="redis重新启动完成，请检查有无报错"
	L28="系统信息读取成功，开始设置源"
	L29="开始安装mongoDB"
	L30="mongoDB安装完成"
	L31="请自行完成安全设置，按下回车继续，Ctrl+C退出"
	L32="开始安装Git"
	L33="Git安装完成"
	L34="克隆nodebb完成"
	L35="开始安装nodebb"
	L36="nodebb安装程序接管窗口"
	L37="您是否要安装nginx？如果是初次安装，极其不推荐不安装nginx"
    L38="服务器nginx"
}
echo -e "\e[44m$INFO$L1\n$L2\n$L3$L3"
ask_user "m/o" "M_OR_O" "$L4\n$L5"
[ "$M_OR_O" = "m" ] && {
    cp /etc/apt/sources.list /root/sources.list
	sed -i 's/us.archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
	echo -e "\e[44m$INFO$L6\e[39m\e[49m"
}
if [[ `which nginx` == "" ]]; then
		wget http://nginx.org/keys/nginx_signing.key
		sudo apt-key add nginx_signing.key
		v=`lsb_release -a | sed -n '3p' |sed 's/Release://g' | sed 's/[[:space:]]//g'`
		if [ $v = "18.04" ]; then
			echo "deb http://nginx.org/packages/ubuntu/ bionic nginx" >> /etc/apt/sources.list
			echo "deb-src http://nginx.org/packages/ubuntu/ bionic nginx" >> /etc/apt/sources.list
		elif [ $v = "16.04" ]; then
			echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list
			echo "deb-src http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list
		elif [ $v = "20.04" ]; then
			echo "deb http://nginx.org/packages/ubuntu/ focal nginx" >> /etc/apt/sources.list
			echo "deb-src http://nginx.org/packages/ubuntu/ focal nginx" >> /etc/apt/sources.list
		fi
	sudo apt-get update
	sudo apt-get install nginx
	echo -e "\e[41m$L38\e[49m\e[39m"
	read -r -p "输入域名|domin (example.com) " DOMAIN
		sudo rm /etc/nginx/nginx.conf
		cat > /etc/nginx/nginx.conf<< EOF
		user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;
	
	server {
			listen 80;
			server_name $DOMAIN; # 你的域名
			location / {
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header X-Forwarded-Proto $scheme;
				proxy_set_header Host $http_host;
				proxy_set_header X-NginX-Proxy true;
				proxy_pass http://127.0.0.1:4567;
				proxy_redirect off;
				# Socket.IO Support
				proxy_http_version 1.1;
				proxy_set_header Upgrade $http_upgrade;
				proxy_set_header Connection "upgrade";
			}
    
			# 配置 502 页? 参考: 高级 - 配置 Nginx
		}
    #gzip  on;
	
	include /etc/nginx/conf.d/*.conf;

}
EOF
fi
ask_user "r/m" "R_OR_M" "$L7\n$L8"
[ "$R_OR_M" = "r" ] && {
	echo -e "\e[92m$L9"
	setdb=R
	if [[ `which redis-server` == "" ]]; then
		echo -e "\e[41m$L10\e[49m\e[39m"
		read password 
	else	
		ask_user "y/n" "YES_OR_NO" "$L11\n$L12"
	[ "$YES_OR_NO" = "y" ] && {
		echo -e "\e[92m$L13"
		setpw=N
	}
	[ "$YES_OR_NO" = "n" ] && {
		echo -e "\e[41m$L14\e[49m\e[39m"
		read password 
		setpw=Y
	}
	fi
}
[ "$R_OR_M" = "m" ] && {
	echo -e "\e[92m$L15"
	setdb=M
}
echo -e "\e[92m$L16\n$L17\e[39m"
read path
if [ -z "$path" ] 
then
    path="/root/nodebb"
fi 
echo -e "\e[44m$INFO$L18\e[49m"
rm -rf /var/lib/dpkg/lock && rm -rf /var/lib/apt/lists/lock && rm -rf /var/cache/apt/archives/lock
apt update
apt upgrade
echo -e "\e[44m$INFO$L19\e[49m"
if [[ `which curl` == "" ]]; then
    echo -e "\e[44m$INFO$L20\e[49m"
	apt-get install -y curl
fi
echo -e "\e[44m$INFO$L21\e[49m"
if [[ `which node` == "" ]]; then
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	echo -e "\e[44m$INFO$L22\e[49m"
	[ "$M_OR_O" = "m" ] && sed -i 's/deb.nodesource.com/mirrors.ustc.edu.cn\/nodesource\/deb/g' /etc/apt/sources.list.d/nodesource.list
	sudo apt-get update
	sudo apt-get install -y nodejs
fi
echo -e "\e[44m$INFO$L23\e[49m"
if [[ $setdb != "M"&&$setdb != "m" ]]; then
	if [[ `which redis-server` == "" ]]; then
		echo -e "\e[44m$INFO$L24\e[49m"
		sudo add-apt-repository ppa:chris-lea/redis-server
		sudo apt-get update
		sudo apt-get install -y redis-server
	fi
	echo -e "\e[44m$INFO$L25\e[49m"
	if [[ $setpw == "Y"||$setpw == "y" ]]; then
		sed -i '1i requirepass $password \n bind 127\.0\.0\.1 \n rename-command FLUSHALL \"\"' /etc/redis/redis.conf
	fi
	echo -e "\e[44mr$INFO$L26\e[49m"
	sudo systemctl restart redis-server
	echo -e "\e[44m$INFO$L27\e[49m"
else
	if [[ `which mongod` == "" ]]; then
		sudo apt install apt-transport-https
		rm -rf /etc/apt/sources.list.d/mongodb-org-4.4.list
		wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
		v=`lsb_release -a | sed -n '3p' |sed 's/Release://g' | sed 's/[[:space:]]//g'`
		echo -e "\e[44m$INFO$L28\e[49m"
		if [ $v = "18.04" ]; then
			echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
		elif [ $v = "16.04" ]; then
			echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
		elif [ $v = "20.04" ]; then
			echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
		fi
		if [[ $slocal == "M"||$slocal == "m" ]]; then
			sed -i 's/repo.mongodb.org/mirrors.aliyun.com\/mongodb/g' /etc/apt/sources.list.d/mongodb-org-4.4.list
		fi
		echo -e "\e[44m$INFO$L29\e[49m"
		sudo apt update
		sudo apt install -y mongodb-org
		rm -rf /etc/apt/wources.list.d/mongodb-org-4.4.list
	fi
	echo -e "\e[44m$INFO$L30\e[49m"
	if [[ $setpw != "N"||$setpw != "n" ]]; then
		echo -e "\e[101m$L31\e[49m"
		read
	fi
fi
if [[ `which git` == "" ]]; then
	echo -e "\e[44m$INFO$L32\e[49m"
	sudo apt install -y git build-essential
fi
echo -e "\e[44m$INFO$L33\e[49m"
mkdir $path
if [[ $sloacl == "M"||$slocal == "m" ]]; then
	sudo git clone -b v1.17.x https://gitee.com/qiai365/NodeBB.git $path
else
	sudo git clone -b v1.17.x https://github.com/NodeBB/NodeBB.git $path
fi
echo -e "\e[44m$INFO$L34"
echo "$INFO$L35"
echo -e "$INFO$L36\e[49m"
sudo $path/nodebb setup

echo "请在nodebb目录下手动执行./nodebb start"
