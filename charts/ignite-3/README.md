# Apache Ignite 3

This is a helm chart for [Apache Ignite 3](https://ignite.apache.org/)

## Install

```console
helm install ignite-3 ./charts/ignite-3
```

## Configuration

| Parameter                       | Description                                                                                           | Default                                                                                              |
|---------------------------------|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| `global.imageRegistry`          | Global container image registry override                                                              | `""`                                                                                                 |
| `nameOverride`                  | String to partially override fullname template with a string (will prepend the release name)          | `""`                                                                                                 |
| `fullnameOverride`              | String to fully override fullname template with a string                                              | `""`                                                                                                 |
| `commonAnnotations`             | Annotations to add to all resources                                                                   | `{}`                                                                                                 |
| `labels`                        | Additional labels to add to all resources                                                             | `{}`                                                                                                 |
| `podLabels`                     | Additional labels to add to pods                                                                      | `{}`                                                                                                 |
| `podAnnotations`                | Additional annotations to add to pods                                                                 | `{}`                                                                                                 |
| `customLabels`                  | Custom labels to merge on chart resources                                                             | `{}`                                                                                                 |
| `extraInitContainers`           | Extra init containers to inject into the pod                                                          | `[]`                                                                                                 |
| `extraContainers`               | Extra sidecar containers to inject into the pod                                                       | `[]`                                                                                                 |
| `extraVolumes`                  | Extra volumes to add to the pod spec                                                                  | `[]`                                                                                                 |
| `extraVolumeMounts`             | Extra volume mounts to add to the main container                                                      | `[]`                                                                                                 |
| `extraEnvVars`                  | Extra environment variables (key/value list)                                                          | `[]`                                                                                                 |
| `extraEnvVarsCM`                | Name of a ConfigMap with additional environment variables                                             | `""`                                                                                                 |
| `extraEnvVarsSecret`            | Name of a Secret with additional environment variables                                                | `""`                                                                                                 |
| `envFrom`                       | Additional `envFrom` entries for the container                                                        | `[]`                                                                                                 |
| `image.registry`                | Image registry                                                                                        | `docker.io`                                                                                          |
| `image.repository`              | Image repository                                                                                      | `apacheignite/ignite`                                                                                |
| `image.tag`                     | Image tag                                                                                             | `3.1.0`                                                                                              |
| `image.pullPolicy`              | Image pull policy                                                                                     | `IfNotPresent`                                                                                       |
| `image.pullSecrets`             | Image pull secrets                                                                                    | `[]`                                                                                                 |
| `image.debug`                   | Enable debug mode (affects command/args/logging if chart supports)                                    | `false`                                                                                              |
| `serviceAccount.create`         | Whether or not to create dedicated ServiceAccount                                                     | `true`                                                                                               |
| `serviceAccount.name`           | If created, name for the ServiceAccount (otherwise autogenerated)                                     | `""`                                                                                                 |
| `serviceAccount.annotations`    | Annotations to add to the ServiceAccount                                                              | `{}`                                                                                                 |
| `rbac.create`                   | Whether or not to create RBAC items (Role, RoleBinding)                                               | `true`                                                                                               |
| `podManagementPolicy`           | StatefulSet pod management policy                                                                     | `OrderedReady`                                                                                       |
| `revisionHistoryLimit`          | Number of old ReplicaSets to retain                                                                   | `10`                                                                                                 |
| `updateStrategy`                | StatefulSet update strategy                                                                           | `{ "type": "RollingUpdate", "rollingUpdate": { "partition": 0 } }`                                   |
| `priorityClassName`             | Pod Priority Class Name for Ignite application                                                        | `""`                                                                                                 |
| `terminationGracePeriodSeconds` | Pod termination grace period                                                                          | `60`                                                                                                 |
| `podSecurityContext`            | Pod security context configuration                                                                    | `{ "enabled": true, "runAsUser": 1001, "runAsGroup": 1001, "fsGroup": 1001 }`                        |
| `containerSecurityContext`      | Container security context configuration                                                              | `{ "enabled": true, "runAsUser": 1001, "runAsGroup": 1001, "allowPrivilegeEscalation": false }`      |
| `resources`                     | Pod requests/limits                                                                                   | `{ "requests": { "cpu": "2", "memory": "4Gi" }, "limits": { "cpu": "2", "memory": "4Gi" } }`         |
| `livenessProbe`                 | Liveness probe configuration                                                                          | `{ "enabled": true, "httpGet": { "path": "/management/v1/node/state", "port": 10300 }, ... }`        |
| `readinessProbe`                | Readiness probe configuration                                                                         | `{ "enabled": true, "httpGet": { "path": "/management/v1/node/state", "port": 10300 }, ... }`        |
| `startupProbe`                  | Startup probe configuration                                                                           | `{ "enabled": false, "httpGet": { "path": "/management/v1/node/state", "port": 10300 }, ... }`       |
| `service`                       | Service configuration                                                                                 | `{ "ports": { "management": 10300, "rest": 10800, "cluster": 3344 } }`                               |
| `persistence.enabled`           | (Boolean) Enable persistent settings for Ignite                                                       | `true`                                                                                               |
| `persistence.size`              | Persistent volume size for Ignite application                                                         | `10Gi`                                                                                               |
| `persistence.storageClass`      | Persistent volume storage class                                                                       | `"microk8s-hostpath"`                                                                                |
| `persistence.accessModes`       | Persistent volume access modes                                                                        | `["ReadWriteOnce"]`                                                                                  |
| `nodeSelector`                  | Node selector for Ignite application                                                                  | `{}`                                                                                                 |
| `tolerations`                   | Node tolerations for Ignite application                                                               | `[]`                                                                                                 |
| `affinity`                      | Node affinity for Ignite application                                                                  | `{}`                                                                                                 |
| `topologySpreadConstraints`     | Topology spread constraints                                                                           | `[]`                                                                                                 |
| `replicaCount`                  | Number of pods for Ignite application                                                                 | `1`                                                                                                  |
| `jmx.enabled`                   | Enable JMX agent sidecar for Prometheus scraping                                                      | `false`                                                                                              |
| `jmx.port`                      | JMX agent port                                                                                        | `9404`                                                                                               |
| `jmx.agent.image`               | JMX agent image (registry/repository:tag and pull policy)                                             | `{ "registry": "docker.io", "repository": "busybox", "tag": "1.36", "pullPolicy": "IfNotPresent" }`  |
| `jmx.agent.resources`           | JMX agent container resources                                                                         | `{ "limits": { "cpu": "100m", "memory": "128Mi" }, "requests": { "cpu": "50m", "memory": "64Mi" } }` |
| `jmx.config`                    | JMX exporter configuration                                                                            | Multi-line config (see `values.yaml`)                                                                |
| `env`                           | JVM memory settings and other environment variables                                                   | `{ "JVM_MAX_MEM": "4g", "JVM_MIN_MEM": "4g" }`                                                       |
| `initializationJob.enabled`     | (Boolean) Enable the cluster initialization job with topology verification and intelligent CMG sizing | `true`                                                                                               |
| `initializationJob.resources`   | Resources for the initialization job                                                                  | `{ "requests": { "cpu": "500m", "memory": "2Gi" }, "limits": { "cpu": "1", "memory": "2Gi" } }`      |

## Persistence

Data persistence can be enabled by specifying appropriate variables. Default persistence configuration is for MicroK8s (
`microk8s-hostpath`).

```console
helm install --name my-release \
    --set persistence.enabled=true \
    --set persistence.size=20Gi \
    ./charts/ignite-3
```
