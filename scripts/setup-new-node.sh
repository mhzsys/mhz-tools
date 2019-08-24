#!/bin/bash

echo "  __  __ _    _ ______ _______     _______ "
echo " |  \/  | |  | |___  // ____\ \   / / ____|"
echo " | \  / | |__| |  / /| (___  \ \_/ / (___  "
echo " | |\/| |  __  | / /  \___ \  \   / \___ \ "
echo " | |  | | |  | |/ /__ ____) |  | |  ____) |"
echo " |_|  |_|_|  |_/_____|_____/   |_| |_____/ "
echo "             MEGAHURTZ SYSTEMS"
echo "      Easy setup of new Node Project"

# ** User data collection **

# Get the name of the new project
echo "What is the name of your new project:"
read projectName
mkdir $projectName
echo "Please enter the port number you would like to use:"
read port
cd $projectName

# ** Check for pre-req installed **
# Create git repo
# -Check if git is installed
echo "Checking if git is installed"
echo "Checking software dependencies"
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: node is not installed.' >&2
  
  echo 'Pulling updates'
  sudo apt-get update

  echo 'Installing git'
  sudo apt-get install git

  echo 'Git installation complete'
fi

# Create NPM package
# -Check if Node and NPM is installed
echo "Checking software dependencies"
if ! [ -x "$(command -v node)" ]; then
  echo 'Error: node is not installed.' >&2
  
  echo 'Pulling updates'
  sudo apt-get update

  echo 'Installing CURL'
  sudo apt-get install curl

  echo 'Downloading packages'
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

  echo 'Installing Node and NPM'
  sudo apt-get install -y nodejs

  echo 'Installing common npm packages'
  sudo npm install -g nodemon live-server -y

  echo 'Node installation complete'
fi

echo "initializing git repository"
git init -y

echo "installing node packages"
npm install express dotenv cors body-parser readline

# Create .gitignore file
echo "Creating and setting up .gitignore file"
touch .gitignore
echo "node_modules" >> .gitignore
echo ".env" >> .gitignore

# Create .env file
echo "Creating .env file"
touch .env
echo "PORT=$port" >> .env

# Create index.js file
echo "Creating index.js file"
touch index.js
echo "'use strict;'" >> index.js
echo "" >> index.js
echo "const fs = require('fs');" >> index.js
echo "require('dotenv').config();" >> index.js
echo "const express = require('express');" >> index.js
echo "const bodyParser = require('body-parser');" >> index.js
echo "const cors = require('cors');" >> index.js
echo "const readline = require('readline');" >> index.js
echo "const PORT = process.env.PORT || 3000;" >> index.js
echo "const app = express();" >> index.js
echo "" >> index.js
echo "app.use(cors());" >> index.js
echo "app.use(bodyParser.urlencoded({ extended: true }));" >> index.js
echo "app.use(bodyParser.json());" >> index.js
echo "" >> index.js
echo "// Web Front End" >> index.js
echo "app.use(express.static('./public'));" >> index.js
echo "app.get('/', (req, res) => {" >> index.js
echo "  res.sendFile('index.html', { root: './public' });" >> index.js
echo "});" >> index.js
echo "" >> index.js
echo "// Server version" >> index.js
echo "function serverVersion() {" >> index.js
echo "  let nodePackage = JSON.parse(fs.readFileSync('package.json'));" >> index.js
echo "  return nodePackage.version" >> index.js
echo "}" >> index.js
echo "" >> index.js
echo "// Starting express server" >> index.js
echo "app.listen(PORT, () => {" >> index.js
echo "  console.log('Listening on port:', PORT, 'use CTRL+C to close.')" >> index.js
echo "  console.log('Server started:', new Date());" >> index.js
echo "  console.log('Currently running on Version', serverIncriment())" >> index.js
echo "});" >> index.js
echo "" >> index.js
echo "// Admin console commands" >> index.js
echo "const rl = readline.createInterface({" >> index.js
echo "  input: process.stdin," >> index.js
echo "  output: process.stdout" >> index.js
echo "});" >> index.js
echo "" >> index.js
echo "// Admin console controls" >> index.js
echo "rl.on('line', (input) => {" >> index.js
echo "  if (input.split(' ')[0] === 'update') {" >> index.js
echo "    console.log('update command hit');" >> index.js
echo "  } else if (input.split(' ')[0] === 'test') {" >> index.js
echo "    console.log('options after test', input.substr(input.indexOf(' ') + 1));" >> index.js
echo "  } else {" >> index.js
echo "    console.log(input, 'is not a valid input')" >> index.js
echo "  };" >> index.js
echo "});" >> index.js
echo "" >> index.js

# Create public folder and files
echo "Creating public folder and files"
mkdir public
cd public

echo "creating index.html"
touch index.html
echo "<!DOCTYPE html>" >> index.html
echo "<html lang="en">" >> index.html
echo "<head>" >> index.html
echo "    <meta charset="UTF-8">" >> index.html
echo "    <meta name="viewport" content="width=device-width, initial-scale=1.0">" >> index.html
echo "    <meta http-equiv="X-UA-Compatible" content="ie=edge">" >> index.html
echo "    <title>$projectName</title>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "    <h1>$projectName</h1>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html