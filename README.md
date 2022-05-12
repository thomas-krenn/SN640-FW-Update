Das Skript aktualisiert die Varianten TCG & ISE der Western Digital SN640 NVMe auf die Firmware Version R1410004 bzw. R1110021. 
Für weitere Informationen siehe https://www.thomas-krenn.com/de/wiki/Western_Digital_SN640_Firmware_Updates_R1110021_und_R1410004#SSD_durch_Formatieren_wiederherstellen



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
