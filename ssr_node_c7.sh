#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
cat << "EOF"
 ______                               ____              __      
/\__  _\               __            /\  _`\           /\ \__   
\/_/\ \/   ___   __  _/\_\    ___    \ \ \/\_\     __  \ \ ,_\  
   \ \ \  / __`\/\ \/'\/\ \  /'___\   \ \ \/_/_  /'__`\ \ \ \/  
    \ \ \/\ \L\ \/>  </\ \ \/\ \__/    \ \ \L\ \/\ \L\.\_\ \ \_ 
     \ \_\ \____//\_/\_\\ \_\ \____\    \ \____/\ \__/.\_\\ \__\
      \/_/\/___/ \//\/_/ \/_/\/____/     \/___/  \/__/\/_/ \/__/
                                                                
Author: Wiki
Github: https://github.com/Toxic-Cat/Airport-toolkit                                 
EOF
do_service(){
	echo "Writting system config..."
	wget -O ssr_node.service https://raw.githubusercontent.com/zhangweiqiandy/-/master/ssr_node.service.el7
	chmod 754 ssr_node.service && mv ssr_node.service /usr/lib/systemd/system
	echo "Starting SSR Node Service..."
	systemctl enable ssr_node && systemctl start ssr_node
}
while :; do echo
	echo -n "Do you want to register SSR Node as system service?(Y/N)"
	read is_service
	if [[ ${is_service} != "y" && ${is_service} != "Y" && ${is_service} != "N" && ${is_service} != "n" ]]; then
		echo -n "Bad answer! Please only input number Y or N"
	else
		break
	fi
done
if [[ ${is_service} == "y" || ${is_service} == "Y" ]]; then
	do_service
fi
echo "System require a reboot to complete the installation process, press Y to continue, or press any key else to exit this script."
read is_reboot
if [[ ${is_reboot} == "y" || ${is_reboot} == "Y" ]]; then
  reboot
else
  echo -e "Reboot has been canceled..."
	exit 0
fi
