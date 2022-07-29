[
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "back-service",
      "labels": {
         "name": "back-service"
      }
   },
   "spec": {
      "ports": [
         {
            "port": 9010
         }
      ],
      "selector": {
         "name": "back"
      },
      "type": "ClusterIP"
   }
},
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "frontend-service",
      "labels": {
         "name": "front-service"
      }
   },
   "spec": {
      "ports": [
         {
            "port": 8010
         }
      ],
      "selector": {
         "name": "front"
      },
      "type": "ClusterIP"
   }
},
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "db-service",
      "labels": {
         "name": "db-service"
      }
   },
   "spec": {
      "ports": [
         {
            "port": 5432
         }
      ],
      "selector": {
         "name": "db"
      },
      "type": "ClusterIP"
   }
},
]
