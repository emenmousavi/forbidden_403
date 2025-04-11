#!/bin/bash

green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
reset="\e[0m"

# Trap Ctrl+C
trap 'echo -e "\n${red}❌ Script interrupted. Exiting.${reset}"; exit 1' INT

echo -e "${blue}🚀 Forbidden 403 Auto-Fix Script By Emen Mousavi${reset}"

read -p "🌐 Enter the SFTP host: " host
read -p "📦 Enter the SFTP port [default 55100]: " port
port=${port:-55100}
read -p "👤 Enter the SFTP username: " username

remote_dir="/home/wplive/web/wp-live"
remote_file="index.php"
raw_url="https://raw.githubusercontent.com/emenmousavi/forbidden_403/main/index.php"

echo -e "${yellow}🔍 Checking if index.php exists on the server...${reset}"
sftp -oBatchMode=no -P "$port" "$username@$host" <<EOF 2>/dev/null | grep "$remote_file" &> /dev/null
ls $remote_dir/$remote_file
EOF

if [ $? -eq 0 ]; then
    echo -e "${green}✅ index.php already exists on the server. No action needed.${reset}"
    exit 0
fi

echo -e "${yellow}📥 index.php not found. Downloading from GitHub...${reset}"
curl -s -O "$raw_url"

if [ ! -f "$remote_file" ]; then
    echo -e "${red}❌ Download failed. Please check your internet connection or the URL.${reset}"
    exit 1
fi

echo -e "${yellow}📤 Uploading index.php to the server...${reset}"
sftp -oBatchMode=no -P "$port" "$username@$host" <<EOF
cd $remote_dir
put $remote_file
EOF

# Check if upload succeeded
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Upload complete. Forbidden 403 error should now be fixed!${reset}"
else
    echo -e "${red}❌ Upload failed. Please check credentials or connection.${reset}"
    exit 1
fi
