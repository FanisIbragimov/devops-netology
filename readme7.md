**1. Установили дополнение Bitwarden и зарегистрировались.**  
**2. Установили Google authenticator на телефон и произвели настройку входа в Bitwarden.**  
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
..   
..  
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
  
5.
