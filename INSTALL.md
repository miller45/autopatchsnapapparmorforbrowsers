
### to install as a service...

First install swatch via apt install swatch

Do everything as root or sudo

1) copy swatchdog.service to /etc/systemd/system
2) copy fixsshbrowseropen to /usr/local/bin
3) give exec rights via chmod u+x /usr/local/bin/fixsshbrowseropen 
4) copy swatch.conf to /etc/
5) exec the following to enable and start swatch as a service
```
systemctl daemon-reload
systemctl enable swatch
systemctl start swatch
```


