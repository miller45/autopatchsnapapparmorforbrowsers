
### to install as a service...

Download latest version of files via clicking on the tar.gz icon here https://github.com/miller45/autopatchsnapapparmorforbrowsers/tags
Extract the archive e.g. via `tar xzf v0.3.tgz` and change into the subdirectory `autopatchsnapapparmorforbrowsers-0.3'.
Then Use install skript or manual method
#### Install script method
Execute these lines:
```
chmod ugo+x ./install.sh
sudo ./install.sh
```

#### Manual installation method
Then do all the following steps as root (or via sudo)

First install swatch via `apt install swatch`

1) copy `swatchdog.service` to `/etc/systemd/system`
2) copy `fixsshbrowseropen` to `/usr/local/bin`
3) give exec rights via `chmod u+x /usr/local/bin/fixsshbrowseropen` 
4) copy `swatch.conf` to `/etc/`
5) exec the following to enable and start swatch as a service
```
systemctl daemon-reload
systemctl enable swatchdog
systemctl start swatchdog
```
Check if the service is running with this command: `systemctl status swatchdog`.

Hinweis: Vergiss nicht die aktuelle Version von ibsopen (von deinem Rechner) rueber zu kopieren
