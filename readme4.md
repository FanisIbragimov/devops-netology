1. telnet stackoverflow.com 80  
>HTTP/1.1 301 Moved Permanently  
>cache-control: no-cache, no-store, must-revalidate  
>location: https://stackoverflow.com/questions  
>x-request-guid: 6d871e49-7495-466d-b4dc-b172e5385568  
>feature-policy: microphone 'none'; speaker 'none'  
>content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com  
>Accept-Ranges: bytes  
>Date: Sat, 11 Sep 2021 11:33:29 GMT  
>Via: 1.1 varnish  
>Connection: close  
>X-Served-By: cache-fra19137-FRA  
>X-Cache: MISS  
>X-Cache-Hits: 0  
>X-Timer: S1631360009.232743,VS0,VE92  
>Vary: Fastly-SSL  
>X-DNS-Prefetch-Control: off  
>Set-Cookie: prov=c6210ddd-9ee3-39c8-8901-ac172192bc8b; domain=.stackoverflow.com; expires=Fri, 01-Jan-2055 00:00:00 GMT; path=/; HttpOnly  
  
Мы выполнили http запрос. Нам вернулся ответ от сервера. Выполнился редирект с кодом 301 на https://stackoverflow.com/questions.  
  
2. Выполнили запрос и прикладывают ответ из влладки headers  
>Request URL: https://stackoverflow.com/
>Request Method: GET
>Status Code: 200 
>Remote Address: 151.101.193.69:443
>Referrer Policy: strict-origin-when-cross-origin
>accept-ranges: bytes
>cache-control: private
>content-encoding: gzip
>content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com
>content-type: text/html; charset=utf-8
>date: Sat, 11 Sep 2021 11:55:27 GMT
>feature-policy: microphone 'none'; speaker 'none'
>strict-transport-security: max-age=15552000
>vary: Accept-Encoding,Fastly-SSL
>via: 1.1 varnish
>x-cache: MISS
>x-cache-hits: 0
>x-dns-prefetch-control: off
>x-frame-options: SAMEORIGIN
>x-request-guid: acbdfb96-eeef-406b-af7d-eab0a5990886
>x-served-by: cache-fra19180-FRA
>x-timer: S1631361327.352244,VS0,VE100
>:authority: stackoverflow.com
>:method: GET
>:path: /
>:scheme: https
>accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
>accept-encoding: gzip, deflate, br
>accept-language: ru,en;q=0.9
>cache-control: max-age=0
>cookie: prov=c86b0cc9-31b0-9a3d-b007-c298870ab233; _ga=GA1.2.811281006.1626245645; OptanonAlertBoxClosed=2021-07-22T04:46:45.053Z; >OptanonConsent=isIABGlobal=false&datestamp=Thu+Jul+22+2021+08%3A46%3A45+GMT%2B0400+(%D0%9F%D0%B5%D1%80%D1%81%D0%B8%D0%B4%D1%81%D0%BA%D0%B8%D0%B9+%D0%B7%D0%B0%D0%BB%D0%B8%D0%B2)&version=6.10.0&hosts=&landingPath=NotLandingPage&groups=C0003%3A1%2CC0004%3A1%2CC0002%3A1%2CC0001%3A1; _ym_d=1627302477; _ym_uid=162730247712899393; __qca=P0-694918614-1627302477209; __gads=ID=b3aab695f762d6aa:T=1627989481:S=ALNI_MbA-TFyQGfUvdzm6IDowHmIX3DDoA; >mfnes=cdccCAYQARoLCNDV59Tl7/U5EAUyCDk1MzM3NTY3; _gid=GA1.2.844173120.1631361310; _gat=1
>sec-ch-ua: "Chromium";v="92", " Not A;Brand";v="99", "Yandex";v="21"
>sec-ch-ua-mobile: ?0
>sec-fetch-dest: document
>sec-fetch-mode: navigate
>sec-fetch-site: none
>sec-fetch-user: ?1
>upgrade-insecure-requests: 1
>user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 YaBrowser/21.8.2.381 Yowser/2.5 Safari/537.36  
  
Самый долгий запрос был на beacon.js (168 ms). Время выполнения скрипта 351 ms.  
![screen](https://user-images.githubusercontent.com/87299405/132948076-5b1a9493-dc99-4e42-a3b3-732b1d99d7f8.png) 
  
3. Мой ip 	62.213.30.74.  
4. Провайдер samtel. AS - AS15500  
5. Traceroute 8.8.8.8 сразу проходит через 10.0.2.2. Internet Assigned Numbers Authority (IANA).  
6. Наибольшая задержка оказалась на 108.170.250.146 где то в США.  
7. ЗА доменное имя отвечают сервера 8.8.8.8 и 8.8.4.4  
>root@vagrant:~# root@vagrant:~# dig dns.google  
>  
>; <<>> DiG 9.16.1-Ubuntu <<>> dns.google  
>;; global options: +cmd  
>;; Got answer:  
>;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42727  
>;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1  
>  
>;; OPT PSEUDOSECTION:  
>; EDNS: version: 0, flags:; udp: 65494  
>;; QUESTION SECTION:  
>;dns.google.                    IN      A  
>  
>;; ANSWER SECTION:  
>dns.google.             865     IN      A       8.8.4.4  
>dns.google.             865     IN      A       8.8.8.8  
>  
>;; Query time: 0 msec  
>;; SERVER: 127.0.0.53#53(127.0.0.53)  
>;; WHEN: Sat Sep 11 12:26:17 UTC 2021  
>;; MSG SIZE  rcvd: 71  
  
8.  ip 8.8.8.8 соответствует dns.google
>root@vagrant:~# dig -x 8.8.8.8  
>  
>; <<>> DiG 9.16.1-Ubuntu <<>> -x 8.8.8.8   
>;; global options: +cmd  
>;; Got answer:  
>;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 39952  
>;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1  
>  
>;; OPT PSEUDOSECTION:  
>; EDNS: version: 0, flags:; udp: 65494  
>;; QUESTION SECTION:  
>;8.8.8.8.in-addr.arpa.          IN      PTR  
>  
>;; ANSWER SECTION:  
>8.8.8.8.in-addr.arpa.   6467    IN      PTR     dns.google.  
>  
>;; Query time: 0 msec  
>;; SERVER: 127.0.0.53#53(127.0.0.53)  
>;; WHEN: Sat Sep 11 12:32:37 UTC 2021  
>;; MSG SIZE  rcvd: 73  
  
ip 8.8.4.4 соответствует dns.google  
>root@vagrant:~# dig -x 8.8.4.4  
>  
>; <<>> DiG 9.16.1-Ubuntu <<>> -x 8.8.4.4  
>;; global options: +cmd  
>;; Got answer:  
>;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 7129  
>;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1  
>  
>;; OPT PSEUDOSECTION:  
>; EDNS: version: 0, flags:; udp: 65494  
>;; QUESTION SECTION:  
>;4.4.8.8.in-addr.arpa.          IN      PTR  
>  
>;; ANSWER SECTION:  
>4.4.8.8.in-addr.arpa.   1395    IN      PTR     dns.google.  
>  
>;; Query time: 7 msec  
>;; SERVER: 127.0.0.53#53(127.0.0.53)  
>;; WHEN: Sat Sep 11 12:37:39 UTC 2021   
>;; MSG SIZE  rcvd: 73    
