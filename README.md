# MegahurtZ Systems Linux Admin Tools
Linux administration tools \
Currently only tested to work with Ubuntu

## Update

## System Information

## Battery Information

## Screen Settings

## Change Log
### 2019-01-11
- Started github repo

### 2019-01-12
- Created return to main menu option
- Fixed code spacing issues


## Things to add
### Change termial size
- Will get the current size of the window
```
echo -e "lines\ncols"|tput -S
```
- will resize the window to 100x40 characters.
```
printf '\033[8;40;100t'
```

### mtr is a better tool for network troubleshooting. It is faster and easier to use than original traceroute.
```
$ sudo apt install mtr
```
- To trace route, simply type:
```
$ mtr -t 8.8.8.8
```

### File usage view
```
sudo apt install pydf
pydf
```

### Speedometer
```
sudo apt-get install speedometer
speedometer -r wlo1 -t wlo1
```

### NMAP
```
sudo nmap -sP -PE -PA21,23,80,3389 192.168.1.*
```

### Nodejs
- https://github.com/nodesource/distributions/tree/master/deb