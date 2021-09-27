**1.** Подключаемся к серверу и выполняем команды.  
**>route-views>show ip route 62.213.30.74**  
>Routing entry for 62.213.0.0/19  
>  Known via "bgp 6447", distance 20, metric 10  
>  Tag 3257, type external  
>  Last update from 89.149.178.10 5w2d ago  
>  Routing Descriptor Blocks:  
>  * 89.149.178.10, from 89.149.178.10, 5w2d ago  
>      Route metric is 10, traffic share count is 1  
>      AS Hops 2  
>      Route tag 3257  
>      MPLS label: none  
  
**>route-views>show bgp 62.213.30.74**
>BGP routing table entry for 62.213.0.0/19, version 970102009
>Paths: (24 available, best #24, table default)
>  Not advertised to any peer
>  Refresh Epoch 1
>  ..  
>  19214 3257 12389  
>    208.74.64.40 from 208.74.64.40 (208.74.64.40)  
>      Origin IGP, localpref 100, valid, external  
>      Community: 3257:4000 3257:8794 3257:50001 3257:50110 3257:54900 3257:54901  
>      path 7FE0FCC0D8C8 RPKI State valid  
>      rx pathid: 0, tx pathid: 0  
>  Refresh Epoch 1  
>  3257 12389  
>    89.149.178.10 from 89.149.178.10 (213.200.83.26)  
>      Origin IGP, metric 10, localpref 100, valid, external, best  
>      Community: 3257:4000 3257:8794 3257:50001 3257:50110 3257:54900 3257:54901  
>      path 7FE11209F9E0 RPKI State valid  
>      rx pathid: 0, tx pathid: 0x0  
  
**2.**Чтобы увидеть открытые TCP порты нужно увидеть следующую команду**  
>**root@vagrant:~# netstat -ltupn**  
>Active Internet connections (only servers)
>Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name  
>tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      1/init  
>tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      616/systemd-resolve  
>tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      742/sshd: /usr/sbin  
  
**4. Для просмотре UDP портов нужно выполнить следующую команду**  
>**root@vagrant:~# netstat -ltupn**   
>udp        0      0 127.0.0.53:53           0.0.0.0:*                           616/systemd-resolve  
>udp        0      0 10.0.2.15:68            0.0.0.0:*                           415/systemd-network  
>udp        0      0 0.0.0.0:111             0.0.0.0:*                           1/init  
>udp6       0      0 :::111                  :::*                                1/init  
  
