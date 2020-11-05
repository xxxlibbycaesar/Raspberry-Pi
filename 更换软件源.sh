#!/bin/bash
# 用于更新树莓派中国大陆的软件源
apt install curl wget -y
cp /etc/apt/sources.list{,.bak}
cp /etc/apt/sources.list.d/raspi.list{,.bak}
sed -i '1,$d' /data/scripts/sources.list
echo "请选择用哪个源?"
read -p ">1.阿里云  >2.清华大学  >3.华中科技大学" Yuan
if [ $Yuan == 1 ]
then
cat > /etc/apt/sources.list << EOF
# 阿里云
deb http://mirrors.aliyun.com/raspbian/raspbian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/raspbian/raspbian/ buster main non-free contrib
EOF
echo "已切换为阿里云源"
elif [ $Yuan == 2 ]
then
cat > /etc/apt/sources.list << EOF
# 清华大学
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib
EOF
echo "已切换为清华大学源"
elif [ $Yuan == 3 ]
then
cat > /etc/apt/sources.list << EOF
# 华中科技大学
deb http://mirrors.hustunique.com/raspbian/raspbian/ buster main non-free contrib
deb-src http://mirrors.hustunique.com/raspbian/raspbian/ buster main non-free contrib
EOF
echo "已切换为华中科技大学源"
else
echo "???"
fi
apt update -y
apt upgrade
apt dist-upgrade
rpi-update
