
#!/bin/bash

#################
# DE kurucu apt #
#################


#Colors
    cyan='\e[0;36m'
    lightcyan='\e[96m'
    lightgreen='\e[1;32m'
    white='\e[1;37m'
    red='\e[1;31m'
    yellow='\e[1;33m'
    blue='\e[1;34m'
    tp='\e[0m'
    green='\e[0;32m'
    blink='\e[5m'

[ $UID != 0 ] && { echo -e "${red}Lütfen${tp} '${blue}sudo bash $0${tp}'${tp} olarak tekrar çalıştırınız${red}" ; exit 1 ; }
#Functions
guncelle() {
     apt update
}

spinlong ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
    echo -e "[${green}OK${tp}]"
}

trap ctrl_c INT
ctrl_c() {
echo -e "\n"
echo -e "[${blink}${yellow}*${tp}]$blue DE kurucuyu tercih ettiğiniz için teşekkürler Beğendiyseniz bir star alırız :)$tp"
exit 0
}

xfce() {
     sudo apt install xfce4 xfce4-goodies lxdm
}

xfce2() {
    sudo systemctl enable lxdm
}

gnome() {
    sudo apt install gnome
}

gnome2() {
    sudo systemctl start gdm.service
}

kde() {
    sudo apt install xorg plasma plasma-wayland-session kde-applications
}

kde2() {
    systemctl enable sddm.service && systemctl enable NetworkManager.service
}

cinnamon() {
    sudo apt install cinnamon gnome-terminal && sudo pacman -S xorg lightdm lightdm-gtk-greeter
}

cinnamon2() {
    systemctl enable lightdm && systemctl enable NetworkManager
}

kde-mini() {
    sudo apt install plasma-desktop
}

kde-mini2() {
    sudo apt install plasma-nm plasma-pa dolphin konsole kdeplasma-addons 
}

kde-mini3() {
    systemctl enable gdm && systemctl 
}

#Interface
echo -e "$white DE Kurucuya Hoşgeldin $USER"
echo ""
echo -e "$yellow 1-)$white Kde$yellow      2-)$white Xfce"
echo -e "$yellow 3-)$white Gnome$yellow     4-)$white Cinnamon"
echo -e "$yellow 5-)$white Kde-Mini$yellow "
echo ""
echo -ne "❨${red}Firemium@DEkurucu${tp}❩:(${yellow}./DEkurucu(apt).sh${tp}]➢ " ; read soru


if [[ $soru = "1" ]] ; then
    echo -e "Kde Desktop Kuruluyor..."
    guncelle
    spinlong
    kde
    spinlong
    kde2
    spinlong
    guncelle
    spinlong
fi

if [[ $soru = "2" ]] ; then 
    echo "Xfce Desktop Kuruluyor..."
    guncelle
    spinlong
    xfce
    spinlong
    xfce2
    spinlong
    guncelle
    spinlong
fi

if [[ $soru = "3" ]] ; then 
    echo -e "Gnome Desktop Kuruluyor..."
    guncelle
    spinlong
    gnome
    spinlong
    gnome2
    spinlong
    guncelle
    spinlong
fi

if [[ $soru = "4" ]] ; then 
    echo -e "Cinnamon Desktop Kuruluyor..."
    guncelle
    spinlong
    cinnamon
    spinlong
    cinnamon2
    spinlong
    guncelle
    spinlong
fi

if [[ $soru = "5" ]] ; then 
    echo -e "Kde-mini Desktop Kuruluyor..."
    guncelle
    spinlong
    kde-mini
    spinlong
    kde-mini2
    spinlong
    kde-mini3
    spinlong
    guncelle
    spinlong
fi