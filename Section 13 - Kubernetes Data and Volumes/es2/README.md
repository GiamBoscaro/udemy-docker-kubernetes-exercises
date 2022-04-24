# ES 2 - Persistent Volumes

Volumes that are not locked to Nodes or Pods and can be configured in a spec file. They are controlled by the cluster administrator (they are not cloud storage from some cloud provider).

hostPath can be used as a persistent volume but only for testing purposes on single node clusters.

```bash
kubectl get pv
```

## Access Modes

* ReadWriteOnce: can be mounted by multiple Pods but on the same node.
* ReadOnlyMany: can be claimed by multiple Pods on different nodes, only in readmode.
* ReadWriteMany: can be claimed by multiple Pods on different nodes, and can be also written by different nodes.

## Claims

Volumes needs to be claimed. The claim can be static (I select a configured volume) but also dynamic. Dynamically, I can claim a volume that has a bunch of space free, or that belong to a group etc.
There can be multiple claims for one volume, and each claim can claim some or all the resources of a volume.

```bash
kubectl get pvc
```

## Storage Class

Tells how the storage is provisioned. There's already a default storage class that is configured for the hostPath.

To get all the storage classes:

```bash
kubectl get sc
```