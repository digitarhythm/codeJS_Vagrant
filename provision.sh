sudo apt-get update
sudo apt-get -y install apache2
sudo apt-get -y install php5
sudo apt-get -y install php5-cli
sudo apt-get -y install php5-cgi
sudo apt-get -y install smarty
sudo apt-get -y install sqlite3
sudo apt-get -y install php5-sqlite
sudo apt-get -y install coffeescript
sudo apt-get -y install imagemagick
sudo apt-get -y install git
if [ ! -d /usr/local/bin/codeJS ] ; then
	sudo git clone https://github.com/digitarhythm/codeJS.git /usr/local/bin/codeJS
	sudo chmod 777 /usr/local/bin/codeJS/templates_c
fi
cp /vagrant/.alias /home/vagrant/.alias
cp /vagrant/.vimrc /home/vagrant/.vimrc
sudo echo ". ~/.alias" >> /root/.profile
sudo echo "export PATH='$PATH:/usr/local/bin/codeJS/bin'" >> /home/vagrant/.profile
sudo echo ". ~/.alias" >> /home/vagrant/.profile
sudo chown vagrant:vagrant /home/vagrant/.alias
sudo chown vagrant:vagrant /home/vagrant/.vimrc
sudo chmod 755 /home/vagrant
sudo cp /vagrant/.alias /root/.alias
sudo cp /vagrant/php5.conf /etc/apache2/mods-available/php5.conf
sudo cp /vagrant/userdir.conf /etc/apache2/mods-available/userdir.conf
if [ ! -d /home/vagrant/public_html ] ; then
	mkdir /home/vagrant/public_html
	chown vagrant:www-data /home/vagrant/public_html
	chmod 775 /home/vagrant/public_html
	chmod g+s /home/vagrant/public_html
	chmod u+s /home/vagrant/public_html
fi
sudo a2enmod userdir

sudo service apache2 restart
