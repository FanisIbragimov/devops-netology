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


