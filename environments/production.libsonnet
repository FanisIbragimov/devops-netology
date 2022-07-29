local base = import './base.libsonnet';

base {
  components +: {
    fanis +: {
       replicasFront: 3,
       replicasBack: 3,
       replicasDb: 3,
       imageFront: "praqma/network-multitool:ver2",
       imageBack: "praqma/network-multitool:ver2",
       imageDb: "praqma/network-multitool:ver2",
    },
  }
}
