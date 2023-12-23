#!/bin/bash


echo "  _____           _     ___           _        _ _       "    
echo " |_   _|__   ___ | |___|_ _|_ __  ___| |_ __ _| | | ___ _ __  "
echo "   | |/ _ \ / _ \| / __|| || '_ \/ __| __/ _` | | |/ _ \ '__| "'
echo "   | | (_) | (_) | \__ \| || | | \__ \ || (_| | | |  __/ |   "
echo "   |_|\___/ \___/|_|___/___|_| |_|___/\__\__,_|_|_|\___|_|   "
                                                             
                                                             

echo "# Install gnupg"
sudo apt update && apt upgrade -y
sudo apt install gnupg -y

echo "# Add Kali Linux repository key"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

echo "# Add Kali Linux repository to sources.list"
echo "deb https://mirrors.ocf.berkeley.edu/kali/ kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list

echo "# Install required packages"
sudo apt update && apt upgrade -y
sudo apt --fix-broken install -y
sudo apt install nmap sqlmap subfinder httpx-toolkit python3-pip dirsearch golang-go slowhttptest screen -y

echo "# Install Nuclei"
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
sudo cp /root/go/bin/nuclei /usr/bin/
nuclei

echo "# Install DalFox"
go install github.com/hahwul/dalfox/v2@latest
sudo cp /root/go/bin/dalfox /usr/bin/

echo "# Install ParamSpider"
git clone https://github.com/devanshbatham/paramspider
cd paramspider
pip install .
