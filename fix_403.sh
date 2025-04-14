GNU nano 8.2                                             403.sh                                                       #!/bin/bash

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
                                                   [ Read 125 lines ]
^G Help        ^O Write Out   ^F Where Is    ^K Cut         ^T Execute     ^C Location    M-U Undo       M-A Set Mark
^X Exit        ^R Read File   ^\ Replace     ^U Paste       ^J Justify     ^/ Go To Line  M-E Redo       M-6 Copy
