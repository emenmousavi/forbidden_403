#!/bin/bash

green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
reset="\e[0m"

trap 'echo -e "\n${red}❌ Script interrupted. Exiting.${reset}"; exit 1' INT

echo -e "${blue}🚀 Forbidden 403 Auto-Fix Script By Emen Mousavi${reset}"

read -p "🌐 Enter the SFTP host: " host
read -p "📦 Enter the SFTP port [default 55100]: " port
port=${port:-55100}
read -p "👤 Enter the SFTP username: " username

remote_dir="/home/wplive/web/wp-live"
remote_file="index.php"
raw_url="https://raw.githubusercontent.com/emenmousavi/forbidden_403/main/index.php"

echo -e "${yellow}🔍 Checking if $remote_file exists on the server...${reset}"

# Check if the file exists on the server
sftp -P "$port" "$username@$host" <<EOF
ls $remote_dir/$remote_file
EOF

if [ $? -eq 0 ]; then
    echo -e "${green}✅ $remote_file exists on the server.${reset}"
else
    echo -e "${red}❌ $remote_file does not exist on the server. Uploading...${reset}"
    
    # Download the file from the raw URL and upload it to the server
    curl -o /tmp/$remote_file $raw_url
    sftp -P "$port" "$username@$host" <<EOF
    put /tmp/$remote_file $remote_dir/$remote_file
EOF
    echo -e "${green}✅ $remote_file has been uploaded to the server.${reset}"
fi

# Clean up
rm /tmp/$remote_file
