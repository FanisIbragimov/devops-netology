**1. Установили дополнение Bitwarden и зарегистрировались.**  
**2. Установили Google authenticator на телефон и произвели настройку входа в Bitwarden.**  
**3. К сожалению мне неудалось добавить сайт на свою систему. При выполнении команда a2ensite site.ru  мне выдает ошибку**  
По этому заданию я установил apache2, далее сгенерировал самоподписанный сертификат. 
>sudo apt install apache2  
>sudo a2enmod ssl  
>sudo systemctl restart apache2  
>root@user-VirtualBox:/etc/ssl/private# sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selsigned.key -out /etc/ssl/certs/apache-selfsigned.crt  
>Can't load /root/.rnd into RNG  
>139640834982336:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/root/.rnd  
>Generating a RSA private key  
>..........+++++  
>........................+++++  
>writing new private key to '/etc/ssl/private/apache-selsigned.key'  
>  
Создал файл конфигурации site.ru.conf в директории /etc/apache2/sites-evailable/  
>sudo nano site.ru.conf
><VirtualHost *:443>  
>ServerName site.ru  
>DocumentRoot /var/www/site.ru/
>SSLEngine on  
>SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt  
>SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key  
></VirtualHost>  
Далее создал тестовый html index.html в директории /var/www/site.ru  
Применил команды sudo a2ensite site.ru.conf выдал ошибку следующую  
>ERROR: Site site.ru not properly enabled: /etc/apache2/sites-enabled/site.ru.conf is a real file, not touching it  
Далее применил команду   
>sudo apache2ctl configtest  
>AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message  
>Syntax OK  
>sudo systemctl reload apache2  
После открыл браузер и набрал сайт site.ru 
Вышла следующая ошибка ![Снимок](https://user-images.githubusercontent.com/87299405/135749453-69f929a2-8b90-4f50-979e-b4b82cbb8605.PNG)
  
**4. Тест сайта на TLS уязвимости**  
>root@vagrant:~/testssl.sh# ./testssl.sh -e --fast --parallel https://www.tb63.ru/  
>  
>###########################################################  
>    testssl.sh       3.1dev from https://testssl.sh/dev/  
>    (b8bff80 2021-09-24 14:21:04 -- )  
>  
>      This program is free software. Distribution and  
>             modification under GPLv2 permitted.  
>      USAGE w/o ANY WARRANTY. USE IT AT YOUR OWN RISK!  
>  
>       Please file bugs @ https://testssl.sh/bugs/  
>  
>###########################################################  
>  
> Using "OpenSSL 1.0.2-chacha (1.0.2k-dev)" [~183 ciphers]  
> on vagrant:./bin/openssl.Linux.x86_64  
> (built: "Jan 18 17:12:17 2019", platform: "linux-x86_64")  
>  
>  
> Start 2021-09-29 14:57:01        -->> 31.31.196.17:443 (www.tb63.ru) <<--  
>  
>..   
>..  
>-----------------------------------------------------------------------------------------------------------------------------  
> xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384          
> xc028   ECDHE-RSA-AES256-SHA384           ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384          
> xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA             
> x9d     AES256-GCM-SHA384                 RSA        AESGCM      256      TLS_RSA_WITH_AES_256_GCM_SHA384                
> x3d     AES256-SHA256                     RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA256                
> x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA                   
> xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256          
> xc027   ECDHE-RSA-AES128-SHA256           ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256          
> xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA             
> x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256                
> x3c     AES128-SHA256                     RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA256                
> x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA                   
>  
>  
> Done 2021-09-29 14:57:06 [   7s] -->> 31.31.196.17:443 (www.tb63.ru) <<--  
  
**5.  Установили ssh сервер и сгенерировали ключи**  
>root@vagrant:~# ssh-keygen  
>Generating public/private rsa key pair.  
>Enter file in which to save the key (/root/.ssh/id_rsa):  
>Created directory '/root/.ssh'.  
>Enter passphrase (empty for no passphrase):  
>Enter same passphrase again:  
>Your identification has been saved in /root/.ssh/id_rsa  
>Your public key has been saved in /root/.ssh/id_rsa.pub  
>The key fingerprint is:  
>SHA256:IV+qp/dBj70SeifAZpQlwlDkYI16S/g/84F4fQmRY+k root@vagrant  
>The key's randomart image is:  
>+---[RSA 3072]----+   
>|    +Bo          |  
>|   ..o+ .o.      |  
>|   o  o.B+.      |  
>|  o o  =o*       |  
>|   + . oE .      |  
>|    o. +=o.=     |  
>|    ..+o+o=.o    |  
>|     .+ooo+...   |  
>|      .=.o.+.    |  
>+----[SHA256]-----+  
  
**6. Я создал вторую виртуальную машину, но мне неудается к ней подключится. Нет связи между двумя виртуалками...**
**7. Сняли дамп с интерфейса eth0 в файл 0001.pcap** 
>root@vagrant:~# tcpdump -w 0001.pcap -c 100 -i eth0  
>tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes  
>100 packets captured  
>111 packets received by filter  
>0 packets dropped by kernel  
  
>root@vagrant:~# tshark -r /root/0001.pcap  
>Running as user "root" and group "root". This could be dangerous.  
>    1   0.000000    10.0.2.15 → 10.0.2.2     SSH 178 Server: Encrypted packet (len=124)  
>    2   0.000203     10.0.2.2 → 10.0.2.15    TCP 60 58086 → 22 [ACK] Seq=1 Ack=125 Win=65535 Len=0  
>    3  41.654546 fe80::a00:27ff:fe73:60cf → ff02::2      ICMPv6 70 Router Solicitation from 08:00:27:73:60:cf  
>    4 352.591119     10.0.2.2 → 10.0.2.15    TCP 60 64151 → 22 [SYN] Seq=0 Win=65535 Len=0 MSS=1460  
>    5 352.591143    10.0.2.15 → 10.0.2.2     TCP 58 22 → 64151 [SYN, ACK] Seq=0 Ack=1 Win=64240 Len=0 MSS=1460  
>    6 352.591249     10.0.2.2 → 10.0.2.15    TCP 60 64151 → 22 [ACK] Seq=1 Ack=1 Win=65535 Len=0  
>    7 352.591595     10.0.2.2 → 10.0.2.15    SSH 87 Client: Protocol (SSH-2.0-OpenSSH_for_Windows_7.7)  
>..  
>..  
>   90 360.183785     10.0.2.2 → 10.0.2.15    TCP 60 64151 → 22 [ACK] Seq=2966 Ack=4090 Win=65535 Len=0  
>   91 361.300392     10.0.2.2 → 10.0.2.15    SSHv2 90 Client: Encrypted packet (len=36)  
>   92 361.300726    10.0.2.15 → 10.0.2.2     SSHv2 90 Server: Encrypted packet (len=36)  
>   93 361.300999     10.0.2.2 → 10.0.2.15    TCP 60 64151 → 22 [ACK] Seq=3002 Ack=4126 Win=65535 Len=0  
>   94 361.460306     10.0.2.2 → 10.0.2.15    SSHv2 90 Client: Encrypted packet (len=36)  
>   95 361.460650    10.0.2.15 → 10.0.2.2     SSHv2 90 Server: Encrypted packet (len=36)  
>   96 361.460884     10.0.2.2 → 10.0.2.15    TCP 60 64151 → 22 [ACK] Seq=3038 Ack=4162 Win=65535 Len=0  
>   97 361.748021     10.0.2.2 → 10.0.2.15    SSHv2 90 Client: Encrypted packet (len=36)  
>   98 361.748340    10.0.2.15 → 10.0.2.2     SSHv2 90 Server: Encrypted packet (len=36)  
>   99 361.748612     10.0.2.2 → 10.0.2.15    TCP 60 64151 → 22 [ACK] Seq=3074 Ack=4198 Win=65535 Len=0  
>  100 361.915701     10.0.2.2 → 10.0.2.15    SSHv2 90 Client: Encrypted packet (len=36)  
  
