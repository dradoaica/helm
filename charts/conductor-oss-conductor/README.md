# conductor-oss-conductor

![Version: 3.15.0](https://img.shields.io/badge/Version-3.15.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.15.0](https://img.shields.io/badge/AppVersion-3.15.0-informational?style=flat-square)

Chart for deploying a Conductor OSS Conductor on Kubernetes as Deployment

**Homepage:** <https://docs.conductor-oss.org/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| dradoaica | <dradoaica@gmail.com> | <https://dradoaica.blogspot.com/> |

## Source Code

* <https://github.com/conductor-oss/conductor>

## Requirements

Kubernetes: `>= 1.26.0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Node affinity |
| annotations | object | `{}` | Annotations to add to all resources |
| app.enableRemoveRedisKey | bool | `false` | Enable periodic removal of Redis keys |
| app.ttlRedisKeyExpire | string | `""` | TTL for Redis key expiry (e.g., 3600s); set only when enabling key removal |
| app.workflowRepairServiceEnabled | bool | `false` | Enable/disable workflow repair service |
| cluster.name | string | `""` | Logical cluster name for logs/metrics (defaults to Helm release when empty) |
| container.ports | object | `{"http":8080,"ui":5000}` | Container ports used by the Pod spec and as Service targetPort values |
| containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"enabled":true,"privileged":false,"readOnlyRootFilesystem":false,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context configuration |
| containerSecurityContext.enabled | bool | `true` | Enable container security context |
| elasticsearch | object | `{"clusterHealthColor":"yellow","enabled":false,"indexName":"","indexPrefix":"","indexReplicasCount":0,"url":"","username":"","version":7}` | Elasticsearch configuration |
| env | object | `{}` | Application-specific environment variables |
| extraContainers | list | `[]` | Extra sidecar containers to inject into the main pod |
| extraEnvFrom | list | `[]` | Extra envFrom entries to inject into the main container |
| extraEnvVars | list | `[]` | Extra environment variables (key/value list) to inject into the main container |
| extraEnvVarsCM | string | `""` | Name of a ConfigMap with extra environment variables to inject into the main container |
| extraEnvVarsSecret | string | `""` | Name of a Secret with extra environment variables to inject into the main container |
| extraInitContainers | list | `[]` | Extra init containers to inject into the main pod |
| extraVolumeMounts | list | `[]` | Extra volume mounts to add to the main container |
| extraVolumes | list | `[]` | Extra volumes to add to the main pod |
| fullnameOverride | string | `""` | String to fully override the fullname template with a string |
| global.imagePullSecrets | list | `[]` | Global pod image pull secrets |
| global.imageRegistry | string | `""` | Global container image registry override |
| image.pullPolicy | string | `"IfNotPresent"` | Main container image pull policy |
| image.registry | string | `"docker.io"` | Main container image registry |
| image.repository | string | `"conductoross/conductor-standalone"` | Main container image repository |
| image.tag | string | `"3.15.0"` | Main container image tag |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress |
| ingress.className | string | `""` | IngressClass that will be used to implement the Ingress |
| ingress.create | bool | `false` | Create Ingress for external HTTP access |
| ingress.hosts | list | `[{"host":"conductor-api.local","paths":[{"path":"/","pathType":"Prefix","port":8080}]},{"host":"conductor-ui.local","paths":[{"path":"/","pathType":"Prefix","port":5000}]}]` | List of Ingress hosts with paths for API and UI |
| ingress.tls | list | `[]` | TLS configuration for Ingress |
| labels | object | `{}` | Additional labels to add to all resources |
| lifecycleHooks | object | `{}` | Lifecycle hooks configuration |
| livenessProbe | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":8080},"initialDelaySeconds":5,"periodSeconds":30,"successThreshold":1,"timeoutSeconds":10}` | Liveness probe configuration |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| management.endpointsWebExposureInclude | string | `"prometheus"` | Comma-separated actuator endpoints to expose |
| nameOverride | string | `""` | String to partially override the fullname template with a string (will prepend the release name) |
| networkPolicy.create | bool | `false` | Create a NetworkPolicy |
| networkPolicy.egress | list | `[]` | NetworkPolicy egress rules |
| networkPolicy.ingress | list | `[]` | NetworkPolicy ingress rules |
| networkPolicy.name | string | `""` | NetworkPolicy name override (defaults to fullname when empty) |
| nodeSelector | object | `{}` | Node selector |
| podAnnotations | object | `{}` | Additional annotations to add to pods |
| podDisruptionBudget.create | bool | `false` | Create PodDisruptionBudget for high availability |
| podDisruptionBudget.maxUnavailable | string | `""` | Maximum number of pods that can be unavailable during disruptions (mutually exclusive with minAvailable) |
| podDisruptionBudget.minAvailable | int | `1` | Minimum number of pods that must be available during disruptions (mutually exclusive with maxUnavailable) |
| podLabels | object | `{}` | Additional labels to add to pods |
| podSecurityContext | object | `{"enabled":true,"fsGroup":1001,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Pod security context configuration |
| podSecurityContext.enabled | bool | `true` | Enable pod security context |
| priorityClassName | string | `""` | Pod priority class name |
| prometheus | object | `{"enabled":false}` | Enable Prometheus metrics |
| readinessProbe | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":8080},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":10}` | Readiness probe configuration |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| redis | object | `{"host":"","port":"6379","queueNamespacePrefix":"conductor_queues","taskDefCacheRefreshInterval":1,"workflowNamespacePrefix":"conductor"}` | Redis configuration |
| replicaCount | int | `1` | Number of pods |
| resources | object | `{"limits":{"cpu":"2","memory":"3Gi"},"requests":{"cpu":"300m","memory":"2Gi"}}` | Main container requests/limits |
| revisionHistoryLimit | int | `10` | Number of old ReplicaSets to retain |
| secrets | object | `{"elasticsearchPassword":"","redisPassword":""}` | Application-specific secrets |
| service.nodePorts.rest | string | `""` | NodePort value for REST API when service.type is NodePort |
| service.nodePorts.ui | string | `""` | NodePort value for UI when service.type is NodePort |
| service.ports.rest | int | `8080` | Service port for REST API |
| service.ports.ui | int | `5000` | Service port for UI |
| service.type | string | `"ClusterIP"` | Service type (ClusterIP, NodePort, LoadBalancer) |
| serviceAccount.annotations | object | `{}` | Additional annotations to add to ServiceAccount |
| serviceAccount.create | bool | `true` | Create a dedicated ServiceAccount |
| serviceAccount.name | string | `""` | Name for the ServiceAccount (autogenerated when empty) |
| spring.profilesActive | string | `"logrotate"` | Spring profiles passed via SPRING_PROFILES_ACTIVE |
| startupProbe | object | `{"enabled":true,"failureThreshold":15,"httpGet":{"path":"/health","port":8080},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Startup probe configuration |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| terminationGracePeriodSeconds | int | `60` | Pod termination grace period |
| tolerations | list | `[]` | Node tolerations |
| topologySpreadConstraints | list | `[]` | Topology spread constraints |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment update strategy (type only is used) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
