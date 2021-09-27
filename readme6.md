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
  
**2.Создаем Dummy интерфейс и назначаем ему адреса. Ниже приведен результат выполнения команды ifconfig**  
>root@vagrant:~# ifconfig  
>dummy0: flags=195<UP,BROADCAST,RUNNING,NOARP>  mtu 1500  
>        inet 10.2.2.2  netmask 255.255.255.255  broadcast 10.2.2.2  
>        inet6 fe80::b4ec:44ff:fe20:71ea  prefixlen 64  scopeid 0x20<link>  
>        ether b6:ec:44:20:71:ea  txqueuelen 1000  (Ethernet)  
>        RX packets 0  bytes 0 (0.0 B)  
>        RX errors 0  dropped 0  overruns 0  frame 0  
>        TX packets 12  bytes 840 (840.0 B)  
>        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0  
  
**Добавляем маршрут до сети**  
>ip route add 10.2.2.2 via 10.0.2.15  
>ip route   
>default via 10.0.2.2 dev eth0 proto dhcp src 10.0.2.15 metric 100  
>10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15  
>10.0.2.2 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100  
>10.2.2.2 via 10.0.2.15 dev eth0  
   
**3.Чтобы увидеть открытые TCP порты нужно увидеть следующую команду**  
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
  
**5. Диаграмма сети**  
<a href="https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Untitled%20Diagram.drawio#R7Zptb%2BI4EIB%2FTT4eim3y9rFA212pd1epEnv3qTKJN3ibxMiYAvvrz06c95BGLHBUC1LTZDxJzMzjmbGNgabx7pHj1fJPFpDIgGawM9DMgBB4NpL%2FlGSvJQA6mSTkNNCyUvBCfxItNLV0QwOyrikKxiJBV3Whz5KE%2BKImw5yzbV3tO4vqb13hkLQELz6O2tJvNBDL%2FGuYZtnwhdBwqV%2FtWrphgf23kLNNot%2BXsIRkLTHOH6NV10scsG1FhO4NNOWMiews3k1JpOyaWyy77%2BFAa9FlThIx5AbHR47r%2BSYcEx8vPO8Px80e8Y6jjbaDMTMNb6yOk%2Fv0OE2PpjEDhuum57P0%2FEEfYdYE0iYrPYfpcaq%2FtNjnNk6tRFRngIEm2yUV5GWFfdW6lVhJ2VLEkW4ujGXKC5%2FF1Nfna8HZG5myiPH0schEtus5RUvuPmneyXcaRblm6hgpYol4wDGNFKlzwgOcYC3WVEJXX1feYbsumCApxxENEynzpc0JVwLu6%2FuA6vY74YJKrO60nmDqe7U9pZ2n1MmuItKeeyQsJoLvpYpudazsDj3A7Jy%2FbYVW09ZKywqp4xw%2FrIdIWDy7ZEWeaFwGogPclntJIEeUvmRcLFnIEhzdl9KqeyO8INGkGDsNJ5EkuFODuiZ5oKp7FQZqnv7QrcBqu7VA56CD1mzDfXLACJ4OVJiHRBwylLa%2Bsk6vnzmJsKDv9XjU5TN96zOjsq8FHwDkb9KEINDwe9ZNfVvpemlovK%2BorZTCuudFsPEix0P1sPPRDcrkdfayPpQkFmY5Dk4L9sKpkbpeGiWEfP%2BPevrINK1c8G8qcKCdC2Y73YHsal%2B9eiacShOqEJUKjwM8d1wv4Ra6EOFjr5ujjwg%2FBVK5JSqpkq7ktQ1HEKARko4ZG9COpJEmCy7PQnUW4%2FWbVIKWNcr%2FgEwvLb0QC7JNR2Hleait15bMn%2B7%2BAioJt1rS7gEPjoDtjsyRVHqA49a4aCJo2vZ0ejCP5dInNV6e2ZoKylTrggnB4nwgVRrKNNnMm5XRV83Ssg%2FT9NOV6YssHHIcUFL2XA%2FLXDyjXNaIWQ8SlYo6B6msMFbKCvEuVEXtKCFiy%2FjbeiRjQNbHsmAx%2ByqSE2R3gMwG2y7syO9mO72js2T3Fuw5SGAEvBtJQ0la%2BRelSFpdJozyA90aUx7qqhk7mHLOwRTqYQpaN6aulCkbNJi6IqTsXqTGN6YGM8VpcumU5zi9YEFrGFiF8FfImgfzx%2FkXJ2ATAOYT%2BvMbnfzdEbCGzCr8DX8v1jjq1iwnxU9MwZWq%2FCBC7PWkAG8Eq4NSmXqwFUlSr2JeTCLGmUr1Mqvni%2FJfLbDQJJStalVDF8jdjcdNEYbMgU8%2BQTg6Ynh9hY2OF81Cuqyh7VtEGRpRtvL2iKzXr8vN4rL5ymqsTgzNUN5ZCmk0JGZc70rEcTEhX8DviwneqWNC96KBxKEny7jNsuScKwjtwPEboID%2BDxSOH67O7%2Bgj%2B3P5qL040XLaFSdGme7i14gmb6%2BZLU9H04CdreNXggdtdcCBkAyu6X8x%2BHtmb%2FC3GsFfl87N4N%2FOKSbqeayT74VfIqfAnnoW3pZ8B4%2FKmC1oukV5uUIVwTqcqEaRbbfLVutc09%2BDWzoVrr4qJ0p7fapYG7FN0E6XxdsHOrsFcvPHAiegAVjNTVKzDQBCXQSMz7UA0rcLoHacbsHlKldsx6AvsFx0xbYTq0HLaJ%2B8xu4bT2ef8jqNSNLcIjy6IJGX5a%2FVMvXy54Do%2Fj8%3D">Ссылка на диаграмму</a>   

