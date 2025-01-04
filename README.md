Home 1
Kernel update

sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline

mainline –check
sudo mainline --install-latest

reboot

Посмотреть список ядер, установленных в системе
apt list --installed | grep linux-image

