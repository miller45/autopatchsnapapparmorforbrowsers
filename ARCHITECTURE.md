# Background
Browser installed via snap are also bundled with a bunch of security rules (use by apparmor), which folders the browser is allowed to access.
These apparmor security rules are kept on a seperate location than the usual apparmor settings (and also a seperate snapd.apparmor service is running them).
If you want to allow your browser to read a unusual location (like /var/run) the apparmor rules for that browser need to adapted.
The challenge is, that they are overwritted whenever a snap for a browser is updated. That happens often.

In order to patch the file automatically if jurry-rigged together that works like this.

# Operation

## Basic idea

We permanently look for a entry in syslog that tells us the the snap service has been reloaded:

<code>
Reloading requested ('systemctl') (unit snapd.service)
</code>

When this entry shows up we launch a bash skript that patches the browser related apparmor rules, to our liking.

## Implementation

### Watching syslog and executing things

There is a ready-made program called [swatch](https://github.com/ToddAtkins/swatchdog) or swatchdog that can be installed via package manager (e.g. apt)
We configure the program via /etc/swatch.conf with a regex that indicates the restart of the snapd service (which happens after each snap update) and launch our patching skript.

See swatch.conf in the repo

Because the swatch program is not running as service by default, we to make configuration for that program for systemd

See swatchdog.service


### The patching skript
The patching script is looking for string in each browser related apparmor conmfiguration from snap for a keyword that indicated if it has been already patched.
If the file is not yet patched (or overwritten thanks to the update) the skript puts the addtional rules and the keyword at the end of the existing apparmor file

See fixsshbrowseropen

## Installation

See [INSTALL.md](INSTALL.md)





