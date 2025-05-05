#!/bin/bash
ISROOT=0
if [ "$EUID" -ne 0 ]; then
   echo "!In order do something the script must be started with sudo!"
else
   if [ ! -d "/var/lib/snapd" ]; then
     echo "this system has no snap installed, so the solution is of no use here"
     exit 1
   else
     mkdir -p /usr/local/bin
     echo "copying fixsshbrowseropen to /usr/local/bin"
     cp ./fixsshbrowseropen /usr/local/bin
     chown root:root /usr/local/bin/fixsshbrowseropen
     chmod ug+x /usr/local/bin/fixsshbrowseropen
     echo "copying swatch.conf to /etc"
     cp ./swatch.conf /etc/
     chown root:root /etc/swatch.conf
     echo "install swatch via apt"
     apt install swatch -y
     cp ./swatchdog.service /etc/systemd/system/
     chown root:root /etc/swatch.conf
     echo "refresh systemd daemon"
     systemctl daemon-reload
     echo "enable new swatch service"
     systemctl enable swatch
     echo "start swatch service"
     systemctl start swatch
     echo "status of swatch service is:"
     systemctl status swatch
   fi
fi
