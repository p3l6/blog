---
title: Raspberry PI as a Print server
layout: reference
---

## Initialization
1. Use "Raspberry PI Imager" to install Rasbian onto the sd card
2. Create a file called `ssh` at the root to start ssh for the next boot
3. Create a file called `wpa_supplicant.conf` at the root to set wifi password with the following contents: (Note: the pi zero w does not support 5ghz)
    ```
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    country=<Insert country code here, i.e. us>

    network={
    ssid="<Name of your WiFi>"
    psk="<Password for your WiFi>"
    }
    ```
4. After turning on the pi, use the router to assign a permanent ip address
5. When connecting to the pi for the first time, use `sudo raspi-config` to enable ssh permanently, under the "Interfacing options".

Note: Placing a new `wpa_supplicant.conf` will allow resetting the wifi to a new network. Still will need to assign a permanent ip address, and update below. 

## SSH connection
router reserved ip address: `192.168.1.70`
user: `pi`
password: `raspberry`

## Print server setup
Mostly taken from [This post](https://medium.com/@anirudhgupta281998/setup-a-print-server-using-raspberry-pi-cups-part-2-2d6d48ccdc32)

1. `sudo apt-get update`
2. `sudo apt-get upgrade`
3. `sudo apt-get install vim`
4. `sudo apt-get install cups`
5. `sudo reboot`
6. `sudo vim /etc/cups/cupsd.conf` edit to read as follows by adding `Allow @Local`
    ```
    # Restrict access to the server…
    <Location />
      Order allow,deny
      Allow @Local
    </Location>

    # Restrict access to the admin pages…
    <Location /admin>
      Order allow,deny
      Allow @Local
    </Location>

    # Restrict access to configuration files...
    <Location /admin/conf>
      AuthType Default
      Require user @SYSTEM
      Order allow,deny
      Allow @Local
    </Location>
    ```
7. `sudo usermod -a -G lpadmin pi`
8. `sudo cupsctl --remote-any`
9. `sudo /etc/init.d/cups restart`
10. To enable printing from windows:
	1. `sudo apt-get install samba`
	2. `sudo vim /etc/samba/smb.conf` 
		1. edit print section to `guest ok = yes`
		2. edit printer driver section to `read only = no`
	3. `sudo /etc/init.d/samba restart`
11. Add the printer to cups via the admin interface in a  web browser `http://192.168.0.10:631`, see post for details, remember printer name for next step. (Note: If the printer does not show in the list, drivers may be needed.) 
	1. `sudo apt-get install printer-driver-hpijs`
	2. download hl1250 from  `https://www.openprinting.org/printer/Brother/Brother-HL-2240`
	3. use that file as the PPD when adding the printer
12. `lpadmin -p <printer name> -o usb-no-reattach-default=true`
13. `sudo reboot`

## Print wirelessly
Now, the printer should show up in add printer lists on various platforms! 
On windows, it had to be added in system preferences.
On mac, it just showed up in the printer list.

