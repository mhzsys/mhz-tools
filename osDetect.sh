#!/bin/bash

echo "***Operating System Detection***"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # ...
  # echo "Linux Found"
	cat /etc/os-release
	lsb_release -a
	hostnamectl
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
	echo "Found MacOS"
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
	echo "Windows Compatibility Layer"
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
	echo "Windows Git Bash"
elif [[ "$OSTYPE" == "win32" ]]; then
  # I'm not sure this can happen.
	echo "Windows 32"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # ...
	echo "freebsd"
else
  # Unknown.
	echo "Unknown Operating System"
fi