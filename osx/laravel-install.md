Downloading 1.1.1...

Composer successfully installed to: /Users/rogersouza/composer.phar
Use it: php composer.phar
Some settings on your machine may cause stability issues with Composer.
If you encounter issues, try to change the following:

The OpenSSL library (0.9.8zc) used by PHP does not support TLSv1.2 or TLSv1.1.
If possible you should upgrade OpenSSL to version 1.0.1 or above.


upgrade ssl
brew update
brew install openssl
brew link --force openssl


Composer global
mv composer.phar /usr/local/bin/composer

nano ~/.bashrc
alias laravel='~/.composer/vendor/laravel/installer'
alias valet='~/.composer/vendor/laravel/valet/valet'
source ~/.bashrc

nano ~/.bash_profile
export PATH="~/.composer/vendor/laravel/installer:$PATH"
export PATH="~/.composer/vendor/laravel/valet/valet:$PATH"

Servindo valet
valet install
valet start
valet park
valet domain dev
valet link (appname)
valet open 
