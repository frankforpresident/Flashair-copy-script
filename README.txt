#README

##########################
#Created by Frank Peters #
#Date: 11/11/2016        #
##########################

Sinds there is no easy way to download from the flashair I created a bash script that reads the html code for specific names to discover the folders and files. 
My script starts looking from {FLASHAIR_IP_ADDRESS}/VIDEO because that is the rootfolder where my camera is dropping the files. 


Tree:
root
├── DCIM
│      └── 100__TSB
│		└──FA000001.JPG
└── VIDEO
	└── 20161111
		└── 123456.AVI


Note: 
My regex wasn't working on my WD worldbook but did work on my raspberry pi. I attached the other line below:
   
WBWE DIR=($(echo $i | grep -o '"[0-9]*"' | sed -e 's/^"//' -e 's/"$//')); #sed -e workaround for [0-9*]
PI DIR=($(echo $i | grep -o '[0-9]*'



Flahsair config

[Vendor]

CIPATH=/DCIM/100__TSB/FA000001.JPG
APPMODE=6
UPLOAD=1
UPDIR=/Files
APPNAME=FlashAir
APPNETWORKKEY=********************

****VERSION DONT ADD ****
****CID DONT ADD ****

PRODUCT=FlashAir
VENDOR=TOSHIBA
APPSSID=FlashAir
LOCK=1
DNSMODE=1
BRGSSID= ****YOUR_WIFI****
BRGNETWORKKEY= ***YOUR_CODE***
APPAUTOTIME=180000
DHCP_Enabled=NO
IP_Address=192.168.1.141
Subnet_Mask=255.255.255.0
Default_Gateway=192.168.1.1
Preferred_DNS_Server=192.168.1.1
NOISE_CANCEL=2
WEBDAV=2
