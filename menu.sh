#!/bin/bash

#inisialisasi warna
hijau="\e[32m"
oren="\e[33m"
merah="\e[31m"
cyan="\e[36m"
default="\e[0m"

show_time_and_greeting() {
            current_hour=$(date +'%H')
            if [ "$current_hour" -ge 5 ] && [ "$current_hour" -lt 12 ]; then
                    greeting="Selamat Pagi jangan telat lihat orang berangkat kerja $nama"
                elif [ "$current_hour" -ge 12 ] && [ "$current_hour" -lt 18 ]; then
                    greeting="Selamat Siang waktunya bobo ciang $nama"
                elif [ "$current_hour" -ge 18 ] && [ "$current_hour" -lt 21 ]; then
                    greeting="Selamat Sore waktunya main bola sampai maghrib  $nama"
                else
                    greeting="Selamat Malam waktunya ngepush sampai pagi $nama"
                fi
                echo -e "\n$greeting!"
            }


clear
figlet "MENU SISTEM" | lolcat

while true; do
echo -e "${hijau}"
echo "╔════════════════════════════════════════╗"
echo "║              PILIHAN MENU              ║"
echo "╠════════════════════════════════════════╣"
echo -e "║ ${oren}1.${default} Tampilkan Kehidupan Saat Ini        ║"
echo -e "║ ${oren}2.${default} Tampilkan Daftar Direktori          ║"
echo -e "║ ${oren}3.${default} Tampilkan Detail OS                 ║"
echo -e "║ ${oren}4.${default} Tampilkan Waktu Install Pertama OS  ║"
echo -e "║ ${oren}5.${default} Informasi User                      ║"
echo -e "║ ${oren}6.${default} Keluar                              ║"
echo "╚════════════════════════════════════════╝"
echo -ne "\n${oren}Pilih opsi [1-6]:${default}"
    read pilihan

    case $pilihan in
        1)
        	nama="Rayyan"
		echo -e "\n${hijau}Kehidupan Saat Ini:${default}HIDUP"
		show_time_and_greeting
		echo -e "\n${hijau}Tanggal dan Waktu Saat Ini:${default}"
		date +"%a %b %d %r WIB %Y"
		;;
			

        2)
            echo -e "\n${hijau}Daftar Direktori:${default}"
            ls -l
            ;;

        3)
            echo -e "\n${hijau}Detail OS:${default}"
            echo -e "Nama OS       : $(lsb_release -d | cut -f2)"
            echo -e "Versi         : $(lsb_release -r | cut -f2) ($(lsb_release -c | cut -f2))"
            echo -e "ID            : $(lsb_release -i | cut -f2)"
            echo -e "Keterangan    : $(lsb_release -d | cut -f2)"

            echo -e "\n${hijau}Informasi Kernel:${default}"
            uname -r

            echo -e "\n${hijau}Proses CPU Terakhir:${default}"
            top -bn1 | grep "%Cpu"

            echo -e "\n${hijau}Penggunaan Memori:${default}"
            free -h

            echo -e "\n${hijau}Penggunaan Disk:${default}"
            df -h | grep -E '^Filesystem|^/dev/'
            ;;

        4)
            echo -e "\n${hijau}Waktu OS Pertama Kali Diinstall:${default}"
            sudo head -n 1 "/var/log/installer/cloud-init.log" 2>/dev/null
            ;;

        5)
            echo -e "\n${hijau}Informasi Pengguna Saat Ini:${default}"
            echo -e "${cyan}Username${default}        : $(whoami)"
            echo -e "${cyan}User ID${default}         : $(id -u)"
            echo -e "${cyan}Group ID${default}        : $(id -g)"
            echo -e "${cyan}Nama Lengkap${default}    : $(getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ',' -f 1)"
            echo -e "${cyan}Shell${default}           : $SHELL"
            echo -e "${cyan}Home Directory${default}  : $HOME"
            ;;

        6)
            echo -e "\n+----------------------------------------+"
            echo -e "| Sistem keluar dengan exit code 0.      |"
            echo -e "| Mission complete.Get on another mission|"
            echo -e "| Debugging kehidupan... Selesai ✅      |"
            echo -e "+----------------------------------------+"
            exit 0
            ;;

        *)
            echo -e "\n${merah}Salah"
            ;;
    esac

    echo -e "\nTekan Enter untuk kembali " | lolcat
    read
    clear
    figlet "MENU SISTEM" | lolcat
done
