[
{
   "apiVersion": "networking.k8s.io/v1",
   "kind": "Ingress",
   "metadata": {
      "name": "ingress-hosts"
   },
   "spec": {
      "rules": [
         {
            "host": "fanis.ru",
            "http": {
               "paths": [
                  {
                     "path": "/",
                     "pathType": "Prefix",
                     "back": {
                        "service": {
                           "name": "front-service",
                           "port": {
                              "number": 8010
                           }
                        }
                     }
                  }
               ]
            }
         }
      ]
   }
},
]
