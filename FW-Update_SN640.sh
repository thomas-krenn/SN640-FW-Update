#!/bin/bash

#NVMe-CLI + unzip wird zum Updaten benötigt
echo 'Installiere benoetigte Programme (nvme-cli).'
apt install -y -qq nvme-cli


#Firmware Dateien herunterladen
echo "Lade Firmware Dateien herunter"
wget https://www.thomas-krenn.com/redx/tools/mb_download.php/ct.Yn0ChQ/mid.y46c5839fc8b3fbcb/FW_SN640ISE_R1110021_20220512.vpkg 2>/dev/null
wget https://www.thomas-krenn.com/redx/tools/mb_download.php/ct.Yn0Eng/mid.y3037ba26ded63fdb/FW_SN640TCG_R1410004_20220512.vpkg 2>/dev/null
echo "Download abgeschlossen"


#Array initialisieren
declare -a updatearray=(`nvme list | grep nvme`)


#Anzahl NVMe erfassen
tnvme=${#updatearray[@]}
tnvme=$(( tnvme / 15 ))


#NVMe Firmware auf Update Notwendigkeit pruefen
echo
echo
echo "########################################"
echo "#Starte Updatevorgang -" $tnvme "NVMe gefunden#"
echo "########################################"
echo
echo
i=$tnvme
while [ $i -ne 0 ]
	do
		devnrnvme=$(( i *15 - 15 ))
		fwnrnvme=$(( i * 15 - 1)) 
		fwnvme=${updatearray[$fwnrnvme]}
		devnvme=${updatearray[$devnrnvme]}

########################Teste ob NVMe TCG Variante aktuell ist##################################################
echo "------------------------------------------------------------------------------"
		if [ $fwnvme == "R1410002" ] || [ $fwnvme = "R1410000" ]
			then
				echo "Firmware muss fuer" $devnvme "aktualisiert werden. Installierte FW:" $fwnvme
				#Update $devnvme
				nvme fw-download $devnvme --fw=FW_SN640TCG_R1410004_20220512.vpkg >/dev/null 2>&1
				nvme fw-commit $devnvme -a 1
				echo "Update auf" $devnvme "abgeschlossen"
		elif [ $fwnvme = "R1410004" ]
			then
				echo "Firmware von" $devnvme "ist aktuell:" $fwnvme
				#Kein Update
#########################Teste ob NVMe SE Variante aktuell ist##################################################
		elif [ $fwnvme = "R1110007" ] || [ $fwnvme = "R1110009" ] || [ $fwnvme = "R1110012" ]
			then
				echo "Firmware muss fuer" $devnvme "aktualisiert werden. Installierte FW:" $fwnvme
				#Update $devnvme
				nvme fw-download $devnvme --fw=FW_SN640ISE_R1110021_20220512.vpkg >/dev/null 2>&1
				nvme fw-commit $devnvme -a 1
				echo "Update auf" $devnvme "abgeschlossen"
		elif [ $fwnvme = "R1110021" ]
			then
				echo "Firmware von" $devnvme "ist aktuell:" $fwnvme
				#Kein Update
#######################Firmware nicht bekannt - kein Update wird installiert####################################
		else
			echo "Firmware bzw. NVMe ist nicht bekannt. Installierte FW:" $fwnvme
		fi
		i=$(( i - 1 ))
		echo "Verbleibende NVMe:" $i
		echo
	done
echo
echo "####################################################################"
echo "#Updates abgeschlossen. Aenderungen werden erst nach Neustart aktiv#"
echo "####################################################################"
echo
echo
read -p "Moechten Sie den Server jetzt neu starten? (y/n)) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sleep 3
    reboot
fi

