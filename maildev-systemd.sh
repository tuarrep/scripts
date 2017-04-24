# Install maildev dev mail server as a systemd service to auto start at boot


#!/bin/bash

echo "Installing maildev server as systemd service..."

# Test if user is root for npm and systemd files
if [ "$EUID" -ne 0 ]; then 
	echo -e "\e[31mPlease run as root"
  	exit
fi

# Test if NodeJs and npm are installed
for cmd in node npm; do
	if ! type "$cmd" > /dev/null; then
		echo -e "\e[31mPlease install $cmd before continuing"
		exit;
	fi
done
echo -e "\e[32mDependencies OK"

# Installing Maildev
NPM_RESULT=$(npm i -g maildev)
if ! type "maildev" > /dev/null; then
	echo -e "\[31mInstall failed"
	echo $NPM_RESULT
	exit
fi
echo -e "\e[32mMaildev install OK"

# Create systemd service
cat > /etc/systemd/system/maildev.service << EOF
[Unit]
Description=Dev mail server
[Service]
ExecStart=/usr/bin/maildev -s 25
[Install]
WantedBy=multi-user.target
EOF
systemctl enable maildev
systemctl start maildev
systemctl is-active maildev >/dev/null 2>&1 && echo -e "\e[32mService creation OK" || echo -e "\e[31mService creation failed"
systemctl status maildev
