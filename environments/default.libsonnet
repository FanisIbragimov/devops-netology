local base = import './base.libsonnet';

base {
  components +: {
    fanis +: {
       replicasFront: 1,
       replicasBack: 1,
       replicasDb: 1,
       imageFront: "praqma/network-multitool:ver2",
       imageBack: "praqma/network-multitool:ver2",
       imageDb: "praqma/network-multitool:ver2",
    },
  }
}
