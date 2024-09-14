#!/bin/bash
# Author: drak3hft7
# Date: 08/09/2021

# Check if the script is executed with root privileges
if [ "${UID}" -eq 0 ]; then
    echo ""; echo -e "\e[32m\e[1mOK. The script will install the tools.\e[0m\e[39m"; echo ""
else
    echo ""; echo -e "\e[91m\e[1mRoot privileges are required\e[0m\e[39m"; echo ""
    exit 1
fi

#---------Update & upgrade full
echo -e "\e[93m\e[1m----> Updating all Packages"
apt-get -y update && apt-get -y upgrade
echo -e "\e[32mDone!"
sleep 1.5
clear

#---------Install essential packages
echo -e "\e[93m\e[1m----> Installing essential and useful packages"
apt-get install -y git rename findutils terminator chromium-browser tmux
echo -e "\e[32mDone!"
sleep 1.5

#---------Generic OS
#Python, ruby, and some packages
echo -e "\e[93m\e[1m----> Installing Python, Ruby, and some packages"
apt-get install -y python python-pip python3 python3-pip python-dnspython python-dev python-setuptools virtualenv unzip make gcc libpcap-dev curl build-essential libcurl4-openssl-dev libldns-dev libssl-dev libffi-dev libxml2 jq libxml2-dev libxslt1-dev build-essential ruby-dev ruby-full libgmp-dev zlib1g-dev
echo -e "\e[32mDone!"
sleep 1.5

#---------Install Golang
echo -e "\e[93m\e[1m----> Installing Golang environment"
cd /tmp && wget -q https://go.dev/dl/go1.21.6.linux-amd64.tar.gz && tar xzf go1.21.6.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go && export GOPATH=$HOME/go && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile && echo 'export GOPATH=$HOME/go' >> ~/.bash_profile && echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
echo -e "\e[32mGolang environment installation is done!"
sleep 1.5

#---------Create a Tools folder in Home ~/
echo -e "\e[93m\e[1m----> Creating Tools folder"
mkdir -p ~/tools
cd ~/tools/
echo -e "\e[32mDone!"
sleep 1.5

#---------Install Network scanner
#Nmap
echo -e "\e[93m\e[1m----> Installing nmap"
apt-get install -y nmap
echo -e "\e[32mDone! Nmap installed."
sleep 1.5

#Masscan
echo -e "\e[93m\e[1m----> Installing Masscan"
git clone -q https://github.com/robertdavidgraham/masscan && cd masscan && make && make install && mv bin/masscan /usr/local/bin/
echo -e "\e[32mDone! Masscan installed."
sleep 1.5

#Naabu
echo -e "\e[93m\e[1m----> Installing Naabu"
go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu && ln -s ~/go/bin/naabu /usr/local/bin/
echo -e "\e[32mDone! Naabu installed."
sleep 1.5

#---------Install subdomain enumeration and DNS Resolver
#dnsutils
echo -e "\e[93m\e[1m----> Installing dnsutils"
apt-get install -y dnsutils
sleep 1.5

#Massdns
echo -e "\e[93m\e[1m----> Installing massdns"
git clone -q https://github.com/blechschmidt/massdns.git && cd ~/tools/massdns && make
cd ~/tools/
echo -e "\e[32mDone! Massdns installed."
sleep 1.5

#Subfinder
echo -e "\e[93m\e[1m----> Installing Subfinder"
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder && ln -s ~/go/bin/subfinder /usr/local/bin/
echo -e "\e[32mDone! Subfinder installed."
sleep 1.5

#Knock
echo -e "\e[93m\e[1m----> Installing Knock"
git clone -q https://github.com/guelfoweb/knock.git
echo -e "\e[32mDone! Knock installed."
sleep 1.5

#LazyRecon
echo -e "\e[93m\e[1m----> Installing LazyRecon"
git clone -q https://github.com/nahamsec/lazyrecon.git
echo -e "\e[32mDone! LazyRecon installed."
sleep 1.5

#Github-subdomains
echo -e "\e[93m\e[1m----> Installing Github-subdomains"
go get -u github.com/gwen001/github-subdomains && ln -s ~/go/bin/github-subdomains /usr/local/bin/
echo -e "\e[32mDone! Github-subdomains installed."
sleep 1.5

#Sublist3r
echo -e "\e[93m\e[1m----> Installing Sublist3r"
git clone -q https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && pip install -r requirements.txt
cd ~/tools/
echo -e "\e[32mDone! Sublist3r installed."
sleep 1.5

#Crtndstry
echo -e "\e[93m\e[1m----> Installing Crtndstry"
git clone -q https://github.com/nahamsec/crtndstry.git
echo -e "\e[32mDone! Crtndstry installed."
sleep 1.5

#Assetfinder
echo -e "\e[93m\e[1m----> Installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder && ln -s ~/go/bin/assetfinder /usr/local/bin/
echo -e "\e[32mDone! Assetfinder installed."
sleep 1.5

#dnsx
echo -e "\e[93m\e[1m----> Installing dnsx"
go get -v github.com/projectdiscovery/dnsx/cmd/dnsx && ln -s ~/go/bin/dnsx /usr/bin/
echo -e "\e[32mDone! Dnsx installed."
sleep 1.5

#dnsgen
echo -e "\e[93m\e[1m----> Installing dnsgen"
pip3 install dnsgen
echo -e "\e[32mDone! Dnsgen installed."
sleep 1.5

#---------Install subdomain takeovers
#SubOver
echo -e "\e[93m\e[1m----> Installing SubOver"
go get -v github.com/Ice3man543/SubOver && ln -s ~/go/bin/subover /usr/bin/
echo -e "\e[32mDone! SubOver installed."
sleep 1.5

#---------Install Fuzzing Tools
#Dirsearch
echo -e "\e[93m\e[1m----> Installing dirsearch"
git clone -q https://github.com/maurosoria/dirsearch.git && cd dirsearch && pip3 install -r requirements.txt
cd ~/tools/
echo -e "\e[32mDone! Dirsearch installed."
sleep 1.5

#ffuf
echo -e "\e[93m\e[1m----> Installing ffuf"
go get -u github.com/ffuf/ffuf && ln -s ~/go/bin/ffuf /usr/local/bin/
echo -e "\e[32mDone! Ffuf installed."
sleep 1.5

#---------Wordlists
echo -e "\e[93m\e[1m----> Downloading Seclists"
cd ~/tools/ && git clone -q https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
# Clean up the file
head -n -14 dns-Jhaddix.txt > clean-jhaddix-dns.txt
rm dns-Jhaddix.txt
cd ~/tools/
echo -e "\e[32mDone! Seclists downloaded."
sleep 1.5

#---------Scanner CMS
#WPScan
echo -e "\e[93m\e[1m----> Installing wpscan"
gem install wpscan
echo -e "\e[32mDone! wpscan installed."
sleep 1.5

#Droopescan
echo -e "\e[93m\e[1m----> Installing
