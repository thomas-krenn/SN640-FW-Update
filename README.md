# SN640-Fw-Update script for updating Western Digital SN640 NVMe to version R1110021 and R1410004

## Disclamer
The script only updates the Western Digital SN640 TCG and ISE. A reset of the storage device is required for the changes to take effect. 
More information regarding the firmware update can be found at  
German: https://www.thomas-krenn.com/de/wiki/Western_Digital_SN640_Firmware_Updates_R1110021_und_R1410004  
English: https://www.thomas-krenn.com/en/wiki/Western_Digital_SN640_firmware_updates_R1110021_and_R1410004

## Requirements 
- requires nvme-cli (automatically installs nvme-cli on debian/ubuntu based operating systems)
- requires admin privileges


## How to use
### Installation
Copy and paste the source code or download it via git. To install git see https://git-scm.com/download/linux

```
git clone https://github.com/thomas-krenn/SN640-FW-Update
cd SN640-FW-Update
chmod +x FW-Update_SN640.sh
```

### Running the script

`./FW-Update_SN640.sh`

The output will be similar to this: 
```
root@pve:~# ./FW-Update_SN640.sh 
Installiere benoetigte Programme (unzip, nvme-cli).
nvme-cli is already the newest version (1.7-1).
0 upgraded, 0 newly installed, 0 to remove and 86 not upgraded.
Lade Firmware Dateien herunter
Download abgeschlossen


########################################
#Starte Updatevorgang - 5 NVMe gefunden#
########################################

------------------------------------------------------------------------------
Firmware bzw. NVMe ist nicht bekannt. Installierte FW: 0105
Verbleibende NVMe: 4

------------------------------------------------------------------------------
Firmware von /dev/nvme3n1 ist aktuell: R1410004
Verbleibende NVMe: 3

------------------------------------------------------------------------------
Firmware muss fuer /dev/nvme2n1 aktualisiert werden. Installierte FW: R1410002
Success activating firmware action:1 slot:0, but firmware requires conventional reset
Update auf /dev/nvme2n1 abgeschlossen
Verbleibende NVMe: 2
[...]
####################################################################
#Updates abgeschlossen. Aenderungen werden erst nach Neustart aktiv#
####################################################################
```

After finishing the script will prompt you if the server should be restarted:  
`Moechten Sie den Server jetzt neu starten? (y/n))`
