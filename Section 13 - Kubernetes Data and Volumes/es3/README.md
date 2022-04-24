# ES 3 - ENV Variables

## Static Variables

Env variables inside a container can be set directly on the spec file

```yaml
env:
  - name: ENV_VAR
    value: value
```

## Config Map

Env variables can also be set in a config map in a separated spec file and used by many deployments.

```yaml
env:
    - name: ENV_VAR
      valueFrom:
        configMapKeyRef:
            name: config-map-name
            key: env-var-name
```