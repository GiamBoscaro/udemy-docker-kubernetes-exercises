# ES 2 - Declarative Approach

File names are NOT important. The object type is defined with the `kind` key.

## Deployment spec

To deploy the spec:

```bash
kubectl apply -f=path/to/spec.yaml
```

In the deployment, you need to specify which labels the deployment will control. These are the same label assignet to the Pod Template in the spec file.
The deployment will control only the Pods that match ALL the labels assigned (key AND values).
Labels can have custom key and value.

## Service spec

In selector you select the labels of the Pods you want to connect and expose. No need to select ALL the labels of a Pod, there's a lot of flexibility.

To deploy a service from a spec file, the command is the same as before:

```bash
kubectl apply -f=path/to/spec.yaml
```

## Update specs

After modifying the spec.yaml, you can rollout changes by applying the spec again:

```bash
kubectl apply -f=path/to/spec.yaml
```

Everything can be changed (replicas, images etc.)

## Scaling

Changing the number of replicas and applying can scale the system.
If the system hasn't got enough resources to scale or the limits set are too high, an error will occur on some Pods and they will stay pending until limits are lowered or machine resources are added.

## Deleting spec

Resources created by a spec or more specs can be deleted with the command:

```bash
kubectl delete -f=path/to/spec.yaml,...,...
```

## Single file spec

A single yaml file can have more objects defined. Object must be divided by:

```bash
---
```

it is good practice to put service and deployment in the same file, service first.

## Match Expressions

Labels can also be selected from expressions:

```yaml
matchExpressions:
    - {key: app, operator: In, values: [first, second]}
    # In, NotIn, Exists, DoesNotExist
```

Commands can also target objects by expressions, but first labels need to be defined on the object:


```yaml
kind: Deployment
metadata:
    labels:
        group: group-1
```

Then all the objectgs with the label can be targeted by 

```bash
-l key=value
# Example
kubectl delete deployments,services -l group=group-1
```

You need to specify also the kind of object, for safety reasons.

## Health Check

Health check can be customized:

```yaml
containers:
- name: node
    image: giammarcoboscaro/kubernetes-course:section12-es1
    livenessProbe:
        httpGet:
            path: /
            port: 8080
        periodSeconds: 3
        initialDelaySeconds: 10
```
