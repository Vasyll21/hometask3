#!/bin/bash

sudo touch /root/sysinfo.sh
echo $'#!/bin/bash \n\n' >> /root/sysinfo.sh
echo $'echo "Date: >> /var/log/sysinfo.txt"'>> /root/sysinfo.sh
echo "date +%c >> /var/log/sysinfo.txt">> /root/sysinfo.sh
echo $'echo "System state info: >> /var/log/sysinfo.txt"'>> /root/sysinfo.sh
echo "w -u >> /var/log/sysinfo.txt">> /root/sysinfo.sh
echo $'echo "Memory|Disk usage: >> /var/log/sysinfo.txt"'>> /root/sysinfo.sh
echo "free -h >> /var/log/sysinfo.txt">> /root/sysinfo.sh
echo "df -h >> /var/log/sysinfo.txt">> /root/sysinfo.sh
echo $'echo "Open TCP: >> /var/log/sysinfo.txt"'>> /root/sysinfo.sh
echo "ss -tulpn >> /var/log/sysinfo.txt">> /root/sysinfo.sh
echo $'echo "Connection to ukr.net: >> /var/log/sysinfo.txt"'>> /root/sysinfo.sh
echo $'ping -c 3 "ukr.net" >> /var/log/sysinfo.txt'>> /root/sysinfo.sh
echo $'echo "Current SUID: >> /var/log/sysinfo.txt"'>> /root/sysinfo.sh
echo "find / -user root -perm -4000 -exec ls -ldb >> /var/log/sysinfo.txt">> /root/sysinfo.sh
sudo chmod +x /root/sysinfo.sh
sudo touch /etc/cron.d/sysinfo
echo "* * * * 1,2,3,4,5 root bash /root/sysinfo.sh" >> /etc/cron.d/sysinfo
chown -R root:root /etc/cron.d/sysinfo