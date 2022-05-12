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

