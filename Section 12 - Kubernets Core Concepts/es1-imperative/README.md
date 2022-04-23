# ES 1 - Imperative Approach

## Deployments

The image must be on a remote registry so the cluster can download it. The cluster cannot see the local images.

```bash
kubectl create deployment <name> --image=<image_registry_uri>
# example:
kubectl create deployment section12-es1 --image=giammarcoboscaro/kubernetes-course:section12-es1
```

Create and delete deployments

```bash
kubectl create deployment
kubectl delete deployment
```

Check status of the deployment

```bash
kubectl get deployments
kubectl get pods
```

## Services

Pods have an internal IP address that is not easily reachable and it changes all the time when Pods are changed, scaled etc.

A Service is needed to make Pods reachable internally and externally.

Types:

* ClusterIP (default): visible only inside the cluster.
* NodePort: exposed (also externally) with the IP address of the worker node.
* LoadBalancer: creates a load balancer that assigns addresses automatically. The infostructure needs to support this type. Works with minikube, AWS and other cloud providers.

```bash
kubectl expose deployment <name> --port=8080 --type=LoadBalancer
```

```bash
kubectl get services
```

```bash
kubectl delete service <service_name>
```

On minicube, EXTERNAL-IP is always pending. This is normal. A trick to emulate an external service is:

```bash
minikube service <name> --url # --url shows the url to connect to
```

## Scaling

```bash
kubectl scale deployment/<name> --replicas=<n_replicas>
```

LoadBalancer distributes the traffic automatically to the replicast. To scale down, just use less replicas. The pods will be stopped automatically.

## Update deployment

```bash
kubectl set image deployment/<deployment_name> <current_container_name>=<new_image_url>
# example:
kubectl set image deployment/section12-es1 kubernetes-course=giammarcoboscaro/kubernetes-course:section12-es1-v2
```

The current container name can be checked in the dashboard, on Pods > Containers.
New images are downloaded only if the tag changes. latest will not work.

To check the status of the update:

```bash
kubectl rollout status deployment/<deployment_name>
```

## Rollback

Beware that the deployment tries to update the image even if the tag does not exist, but the old pod will not be removed until the new one is running. It is fail safe, but the deployment rollout will be stuck. The deployment will need to be rolled back.

```bash
kubectl rollout undo deployment/<deployment_name>
```

You can see all the rollout history and rollback to a specific revision:

```bash
kubectl rollout history deployment/<deployment_name> # full list
kubectl rollout history deployment/<deployment_name> --revision=<revision_number> # specific revision
```

To rollback to a specific revision

```bash
kubectl rollout undo deployment/<deployment_name> --to-revision=<revision_number>
```

