# Automated VirtualBox AD Setup Script suite by @Trismah & @maikroservice

We plugged some of the scripts from: https://github.com/clong/DetectionLab

## TODO List

### Major

- change the username to something h4xx0ry
- change the password to something h4xx0ry
- create a shutdown script / use the one from detectionlab?

### Next

- create VMWare Version
- create kerberoastable user? / AS-Rep-roastable?
- remove internet access via firewall?
- try to setup script for Windows Server 2016 & Windows Server 2022
- setup 2nd machine (Windows 10) in AD and connect to Forest
- create user-account as local admin on the Windows10 machine
- create domain user for this account
- create constrained / unconstrained delegation user/profile

## requirements

- packer from https://packer.io
- **download the correct binary for your system from this page https://www.packer.io/downloads**

## how to run?

```bash
packer build DC_virtualbox_W2019.json
```

this will create a virtualbox file/folders in which the VMs reside for you to use.
You might want to adapt the `variables` section of the `DC_virtualbox_W2019.json`.

You can switch the `iso_url` to a file of your liking (expected is a Windows Server 2019 iso), if you do please make sure to also adapt the `iso_checksum` to match the checksum of your iso.

The `disk_size` can be reduced but should be 20gb at least.

Both `memory_size` and `cpu_count` can be adjusted based on your machine/available resources.

Depending on the speed of your machine/disk, the `boot_wait` time should be adjusted accordingly based on how long it takes for your machine to reach the install screen. As a hint, `2m` might work for you, or if you have a fast machine leave it at `30s`.

```json
"variables": {
    "iso_url": "https://software-download.microsoft.com/download/pr/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso",
    "iso_checksum": "md5:70fec2cb1d6759108820130c2b5496da",
    "disk_size": "30720",
    "autounattend": "./answers/2019/Autounattend.xml",
    "packer_build_dir": "./win2019",
    "memory_size": "4096",
    "cpu_count": "2",
    "vm_name": "DC_PwnAndProtect",
    "boot_wait": "30s"
  }
```
