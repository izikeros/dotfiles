#!/bin/sh
rm -f /tmp/nasreport
touch /tmp/nasreport
chmod +x /tmp/nasreport
cat <<EOF >>/tmp/nasreport
#!/bin/sh
#
# NAS Report by Patrick Wilson
# see: http://forum.qnap.com/viewtopic.php?f=185&t=82260#p366188
#
# 
echo "[code]*********************"
echo "** QNAP NAS Report **"
echo "*********************"
echo " "
echo "NAS Model:      \$(getsysinfo model)"
echo "Firmware:       \$(getcfg system version) Build \$(getcfg system 'Build Number')"
echo "System Name:    \$(/bin/hostname)"
echo "Workgroup:      \$(getcfg system workgroup)"
echo "Base Directory: \$(dirname \$(getcfg -f /etc/config/smb.conf Public path))"
echo "NAS IP address: \$(ifconfig \$(getcfg network 'Default GW Device') | grep addr: | awk '{ print \$2 }' | cut -d: -f2)"
echo " " 
echo "Default Gateway Device: \$(getcfg network 'Default GW Device')" 
echo " "
ifconfig \$(getcfg network 'Default GW Device') | grep -v HWaddr
echo " "
echo -n "DNS Nameserver(s):" 
cat /etc/resolv.conf | grep nameserver | cut -d' ' -f2
echo " "
echo " "
echo "HDD Information:"
echo " "
alpha='abcdefghijklmnopqrstuvwxyz'
drives=\$(getcfg Storage 'Disk Drive Number')
for ((i=1;i<=drives;++i)) ; do
   echo -n "HDD\$i -"
   if [ ! -b /dev/sd\${alpha:\$i-1:1} ] ; then
      echo "Drive absent"
   else
      hdparm -i /dev/sd\${alpha:\$i-1:1} | grep "Model"
      echo " "
      parted /dev/sd\${alpha:\$i-1:1} print
      echo " "
      /sbin/get_hd_smartinfo -d \$i
      echo " "
   fi
done
echo "Volume Status"
echo " "
mdadm -D /dev/md0 /dev/md1 2>/dev/null
echo " "
cat /proc/mdstat
echo " "
echo "Disk Space:"
echo " "
df -h | grep -v qpkg
echo " "
echo "Mount Status:" 
echo " "
mount | grep -v qpkg
echo " "
#echo "Contents of \$(dirname \$(getcfg -f /etc/config/smb.conf Public path)):"
#echo " "
#ls -lF \$(dirname \$(getcfg -f /etc/config/smb.conf Public path))/
echo " "
echo "Windows Shares:" 
echo " "
for i in \$(grep \] /etc/config/smb.conf | sed 's/^\[//g' | sed 's/\]//g' | grep -v global) ;do 
   echo -n "\$i:"
   testparm -s -l --section-name="\$i" --parameter-name=path 2>/dev/null 
done
#echo " "
#echo "QNAP Media Scanner / Transcoder processes running: "
#echo " " 
#/bin/ps | grep medialibrary | grep -v grep
#echo " " 
#echo -n "MediaLibrary Configuration file: " 
#ls -alF /etc/config/medialibrary.conf
#echo " " 
#echo "/etc/config/medialibrary.conf:"
#cat /etc/config/medialibrary.conf
echo " "
echo "iTunes Music Store: \$(getcfg -f /etc/config/mt-daapd.conf general mp3_dir)"
echo " "
echo "Memory Information:" 
echo " "
free | grep -v cache:
echo " "
echo "NASReport completed on \$(date +'%Y-%m-%d %T') (\$0) [/code]"
echo " "
EOF
sleep 2
clear
/tmp/nasreport
#done