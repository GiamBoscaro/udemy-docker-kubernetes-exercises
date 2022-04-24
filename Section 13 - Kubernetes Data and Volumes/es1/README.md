# ES 1 - Volumes

* Node Volumes: volume inside the Pod. Lifetime depends of the Pod, so volume get destroyed when Pod is replaced, but persist if the container inside the Pod is restarted.
* Cloud Provider Volumes: permanent even after nodes and cluster is restarted

## Drivers

There are many drivers for volumes:

* emptyDir: creates a new empty directory when the Pod starts. The data is maintained until the Pod is removed. The directory is in the Pod so the replicas will not have the same files! It is useful to test stuff easily.

* hostPath: similar to bind mount of docker. Binds to a path in the machine who hosts the node. The folder is Node specific so if multiple worker nodes are spread to different machines, they will not share the volume.

* CSI: can use any storage solution as long as an integration has been developed for it.
