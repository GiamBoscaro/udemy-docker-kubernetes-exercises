# ES 3 - Communication Between Pods

To communicate between Pods, you can send requests to:

* Pod IP: you can see the IP by listing all the Pods. IP can change though.
* Auto generated env variables: every service generates a variable that points to the Pod.
If the service is name `my-service`, then his address will be available in the env var `MY_SERVICE_SERVICE_HOST`. To use this you need to make changes on your code.
* CoreDNS: auto generated DNS names inside the Cluster. You can reach Pods by calling their service name and their name spaces (ex: `my-service.default`)

## Name Spaces

If no namespace is specified, it is the default one.

```bash
kubectl get namespaces
```