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
Скрин страницы во вложении 1.  
  
3. Мой ip 	62.213.30.74.  
4. Провайдер samtel. AS - AS15500  
5. 
