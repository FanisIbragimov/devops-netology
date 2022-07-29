local p = import '../params.libsonnet';
local params = p.components.fanis;

  [
  {
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {
      "name": "front",
      "labels": {
        "name": "front"
      }
    },
    "spec": {
      "replicas": params.replicasFront,
      "selector": {
        "matchLabels": {
          "name": "front"
        }
      },
      "template": {
        "metadata": {
          "labels": {
            "name": "front"
          }
        },
        "spec": {
          "containers": [
            {
              "name": "front",
              "image": params.imageFront,
              "imagePullPolicy": "IfNotPresent",
              "ports": [
                {
                  "containerPort": 8010
                }
              ],
              "env": [
                {
                  "name": "BASE_URL",
                  "value": "http://localhost:9010"
                }
              ]
            }
          ]
        }
      }
    }
  },
  {
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {
      "name": "back",
      "labels": {
        "name": "back"
      }
    },
    "spec": {
      "replicas": params.replicasBack,
      "selector": {
        "matchLabels": {
          "name": "back"
        }
      },
      "template": {
        "metadata": {
          "labels": {
            "name": "back"
          }
        },
        "spec": {
          "containers": [
            {
            "name": "back",
            "image": params.imageBack,
            "imagePullPolicy": "IfNotPresent",
            "ports": [
              {
                "containerPort": 9010
              }
            ],
            "env": [
              {
                "name": "DATABASE_URL",
                "value": "postgres://postgres:postgres@db-service:5432/news"
              }
            ]
          }
        ]
      }
    }
  }
},
{
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {
      "name": "db",
      "labels": {
        "name": "db"
      }
    },
    "spec": {
      "replicas": params.replicasDb,
      "selector": {
        "matchLabels": {
          "name": "db"
        }
      },
      "template": {
        "metadata": {
          "labels": {
            "name": "db"
          }
        },
        "spec": {
          "containers": [
            {
              "name": "db",
              "image": params.imageBack,
              "imagePullPolicy": "IfNotPresent",
              "ports": [
                {
                  "containerPort": 5432
                }
              ]
            },
          ]
        },
      }
    }
  },
]
