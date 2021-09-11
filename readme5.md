**1.** Для просмота достпных сетевых интерфейсов linux можно использовать ip -c -br link
>root@vagrant:~# ip -c -br link  
>lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>  
>eth0             UP             08:00:27:73:60:cf <BROADCAST,MULTICAST,UP,LOWER_UP>  
  
Для windows есть команда ipconfig или netsh interface show interface  
  
**2.** Соседей по сети можно обнаружить командой ip neigh show. Выведится список доступных в сети хостов.  
  
**3.** Для разделения L2 коммутатора используется технология VLAN создаются виртуальные подсети.  
В Linux есть пакет vlan, с помощью него можно конфигурировать VLAN.  
>auto eth0.1700  
>iface eth0.1700 inet static  
>address 192.168.1.2  
>netmask 255.255.255.0  
>vlan-raw-device eth0  
  
**4.** Сущетсвует 6 типов агрегации интерфейсов в Linux.  
mode=0 (balance-rr)  
mode=1 (active-backup)  
mode=2 (balance-xor)   
mode=3 (broadcast)  
mode=4 (802.3ad)  
mode=5 (balance-tlb)  
mode=6 (balance-alb)  
Выделяют 4 типа распределения нагрузки: rr, xor, tlb, Alb. 
Конфиг  
>auto eth0  
>iface eth0 inet manual  
>bond-master bond0  
>  
>auto eth1  
>iface eth1 inet manual  
>bond-master bond0  
>  
>auto bond0  
>iface bond0 inet dhcp  
>bond-mode 4  
>bond-slaves eth0 eth1  
  
**5.** Маска /29 позволяет получить лишь 8 адресов.  
>root@vagrant:~# ipcalc -b --split 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 10.10.10.0/24  
>Needed size:  256 addresses.  
>Used network: 10.10.10.0/24  
>Unused:  
  
**6.** Можно использовать чатсный диапазон 100.64.0.0 — 100.127.255.255. Нам потребуется 100.64.1.0/26 и/или 10.64.2.0/26
  
**7.** Просмотр arp таблицы linux  
>ip neigh show  
windows  
>arp -a  
Очистка arp кэш  
>sudo ip -s -s neigh flush all  
Очистка arp записей в Windows  
>arp -d *  
Удалить один хост  
>sudo ip -d 192.168.0.102
