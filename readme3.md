1. Ознакомился.  
2. Файлы которые являются жесткими ссылками на исходный файл имеют те же права доступа, владельца и т.д., различаться могут только имена. Жесткая ссылка и файлимеют одинаковые inode. Жесткая ссылка это как буд то новое имя для исходнойго файла.  
3. Выполнили замену vagranfile. Запустили виртуалку.  
4. Используя fdisk сделали задание. sudo fdisk /dev/sdb  
Command (m for help): n  
Partition type  
p   primary (1 primary, 0 extended, 3 free)  
e   extended (container for logical partitions)  
Select (default p): p  
Partition number (2-4, default 2): 2  
First sector (4196352-5242879, default 4196352): 4196352  
Last sector, +/-sectors or +/-size{K,M,G,T,P} (4196352-5242879, default 5242879): 5242879  

Created a new partition 2 of type 'Linux' and of size 511 MiB.  
Command (m for help): p  
Disk /dev/sdb: 2.51 GiB, 2684354560 bytes, 5242880 sectors  
Disk model: VBOX HARDDISK  
Units: sectors of 1 * 512 = 512 bytes  
Sector size (logical/physical): 512 bytes / 512 bytes  
I/O size (minimum/optimal): 512 bytes / 512 bytes  
Disklabel type: dos  
Disk identifier: 0xf60184b2  

Device     Boot   Start     End Sectors  Size Id Type  
/dev/sdb1          2048 4196351 4194304    2G 83 Linux  
/dev/sdb2       4196352 5242879 1046528  511M 83 Linux  
 Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.  
  
5. root@vagrant:~# sfdisk -d /dev/sdb > partitions.txt  
root@vagrant:~# sfdisc /dev/sdc < partitions-sda.txt  
-bash: sfdisc: command not found  
root@vagrant:~# sfdisc /dev/sdc < partitions.txt  
-bash: sfdisc: command not found  
root@vagrant:~# sfdisk /dev/sdc < partitions.txt  
Checking that no-one is using this disk right now ... OK  

Disk /dev/sdc: 2.51 GiB, 2684354560 bytes, 5242880 sectors  
Disk model: VBOX HARDDISK  
Units: sectors of 1 * 512 = 512 bytes  
Sector size (logical/physical): 512 bytes / 512 bytes  
I/O size (minimum/optimal): 512 bytes / 512 bytes  

>>> Script header accepted.  
>>> Script header accepted.  
>>> Script header accepted.  
>>> Script header accepted.  
>>> Created a new DOS disklabel with disk identifier 0xba0b276f.  
/dev/sdc1: Created a new partition 1 of type 'Linux' and of size 2 GiB.  
/dev/sdc2: Created a new partition 2 of type 'Linux' and of size 511 MiB.  
/dev/sdc3: Done.  

New situation:  
Disklabel type: dos  
Disk identifier: 0xba0b276f  

Device     Boot   Start     End Sectors  Size Id Type  
/dev/sdc1          2048 4196351 4194304    2G 83 Linux  
/dev/sdc2       4196352 5242879 1046528  511M 83 Linux  

The partition table has been altered.  
Calling ioctl() to re-read partition table.  
Syncing disks.  
6.  mdadm --create --verbose /dev/md0 -l 1 -n 2 /dev/sdb1 /dev/sdc1  
7.  mdadm --create --verbose /dev/md1 -l 0 -n 2 /dev/sdb2 /dev/sdc2  
8.  sudo pvcreate /dev/md0  
sudo pvcreate /dev/md1  
9. sudo vgcreate vlg /dev/md0 /dev/md1  
10. sudo lvcreate -L 100M -n LV0 vlg /dev/md1  
11. sudo mkfs.ext4 /dev/vlg/LV0  
12. cd tmp  
mkdir new  
sudo mount /dev/vlg/LV0 /tmp/new  
13. Файл поместили в директорию new  
14. root@vagrant:/tmp# lsblk  
NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT  
sda                    8:0    0   64G  0 disk  
├─sda1                 8:1    0  512M  0 part  /boot/efi  
├─sda2                 8:2    0    1K  0 part  
└─sda5                 8:5    0 63.5G  0 part  
  ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /  
  └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]  
sdb                    8:16   0  2.5G  0 disk  
├─sdb1                 8:17   0    2G  0 part  
│ └─md0                9:0    0    2G  0 raid1  
└─sdb2                 8:18   0  511M  0 part  
  └─md1                9:1    0 1018M  0 raid0  
    └─vlg-LV0        253:2    0  100M  0 lvm   /tmp/new  
sdc                    8:32   0  2.5G  0 disk  
├─sdc1                 8:33   0    2G  0 part  
│ └─md0                9:0    0    2G  0 raid1  
└─sdc2                 8:34   0  511M  0 part  
  └─md1                9:1    0 1018M  0 raid0  
    └─vlg-LV0        253:2    0  100M  0 lvm   /tmp/new  
15. Протестировали  
root@vagrant:/tmp# gzip -t /tmp/new/test.gz  
root@vagrant:/tmp# echo $?  
0  
16. pvmove /dev/md1 /dev/md0  
17. 


