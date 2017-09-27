#!/bin/bash

PROJECT_NAME=$1

echo "Updating box...."
apt-get -y update

echo "Creating project directory"
mkdir /var/www/src/$PROJECT_NAME/

echo "Installing bundle nodejs and npm"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

echo "Installing npm packages"
npm install lodash -g
npm install nodemon -g
npm install express-generator -g

echo "Installing default project packages"
cd /var/www/src/
express $PROJECT_NAME
cd $PROJECT_NAME 
npm install express --save
npm install ejs --save
npm install moment --save
npm install body-parser --save
npm install moongoose --save

echo "Cleaning Box"
apt-get -y autoremove



