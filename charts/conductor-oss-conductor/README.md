# conductor-oss-conductor

![Version: 3.15.1](https://img.shields.io/badge/Version-3.15.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.15.0](https://img.shields.io/badge/AppVersion-3.15.0-informational?style=flat-square)

Conductor OSS Conductor is a platform originally created at Netflix to orchestrate workflows that span across microservices. This chart deploys Conductor OSS Conductor as a Deployment.

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
| app | object | `{"asyncUpdateShortRunningWorkflowDuration":"10m","enableRemoveRedisKey":false,"lockTimeToTry":500,"maxTaskInputPayloadSizeThreshold":"4GB","maxTaskOutputPayloadSizeThreshold":"4GB","maxWorkflowInputPayloadSizeThreshold":"4GB","maxWorkflowOutputPayloadSizeThreshold":"4GB","maxWorkflowVariablesPayloadSizeThreshold":"100MB","systemTaskMaxPollCount":20,"systemTaskWorkerThreadCount":20,"taskInputPayloadSizeThreshold":"1MB","taskOutputPayloadSizeThreshold":"1MB","ttlRedisKeyExpire":"","workflowExecutionLockEnabled":true,"workflowInputPayloadSizeThreshold":"1MB","workflowOutputPayloadSizeThreshold":"1MB","workflowRepairServiceEnabled":false}` | App configuration |
| autoscaling.create | bool | `false` | Create a HorizontalPodAutoscaler |
| autoscaling.maxReplicas | int | `10` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization percentage |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Target memory utilization percentage |
| container.ports | object | `{"rest":8080,"ui":5000}` | Container ports used by the Pod spec and as Service targetPort values |
| containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"enabled":true,"privileged":false,"readOnlyRootFilesystem":false,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context configuration |
| containerSecurityContext.enabled | bool | `true` | Enable container security context |
| db | object | `{"type":"redis_standalone"}` | DB configuration. Allowed values: redis_standalone, mysql, postgres, memory |
| elasticsearch | object | `{"clusterHealthColor":"yellow","enabled":false,"indexName":"","indexPrefix":"","indexReplicasCount":0,"password":"","restClientConnectionTimeout":5000,"restClientReadTimeout":30000,"url":"","username":"","version":7}` | Elasticsearch configuration |
| env | object | `{"EXTRA_JVM_OPTS":""}` | Environment variables |
| externalPayloadStorage | object | `{"type":null}` | External payload storage configuration. Allowed values: postgres, null |
| extraContainers | list | `[]` | Extra sidecar containers to inject into the main Pod spec |
| extraEnvFrom | list | `[]` | Extra envFrom entries to inject into the main container |
| extraEnvVars | list | `[]` | Extra environment variables to inject into the main container |
| extraEnvVarsCM | string | `""` | Name of a ConfigMap with extra environment variables to inject into the main container |
| extraEnvVarsSecret | string | `""` | Name of a Secret with extra environment variables to inject into the main container |
| extraInitContainers | list | `[]` | Extra init containers to inject into the main Pod spec |
| extraVolumeMounts | list | `[]` | Extra volume mounts to add to the main container |
| extraVolumes | list | `[]` | Extra volumes to add to the main Pod spec |
| fullnameOverride | string | `""` | String to fully override the fullname template with a string |
| global.imagePullSecrets | list | `[]` | Global pod image pull secrets |
| global.imageRegistry | string | `""` | Global container image registry override |
| image.pullPolicy | string | `"IfNotPresent"` | Main container image pull policy |
| image.registry | string | `"docker.io"` | Main container image registry |
| image.repository | string | `"conductoross/conductor-standalone"` | Main container image repository |
| image.tag | string | `""` | Main container image tag |
| indexing | object | `{"enabled":true,"type":"elasticsearch"}` | Indexing configuration. Allowed values: elasticsearch, opensearch, postgres, standalone |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress |
| ingress.className | string | `""` | IngressClass that will be used to implement the Ingress |
| ingress.create | bool | `false` | Create an Ingress for external HTTP access |
| ingress.hosts | list | `[{"host":"conductor-api.local","paths":[{"path":"/","pathType":"Prefix","port":8080}]},{"host":"conductor-ui.local","paths":[{"path":"/","pathType":"Prefix","port":5000}]}]` | List of Ingress hosts with paths for API and UI |
| ingress.tls | list | `[]` | TLS configuration for Ingress |
| labels | object | `{}` | Additional labels to add to all resources |
| lifecycleHooks | object | `{}` | Lifecycle hooks configuration |
| livenessProbe | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":8080},"initialDelaySeconds":5,"periodSeconds":30,"successThreshold":1,"timeoutSeconds":10}` | Liveness probe configuration |
| livenessProbe.enabled | bool | `true` | Enable liveness probe |
| management.endpointsWebExposureInclude | string | `"health,info,metrics,prometheus"` | Comma-separated actuator endpoints to expose |
| management.healthRedisEnabled | bool | `true` | Enable Redis health check |
| memory.g1HeapRegionSizeMb | string | `""` | JVM G1 Heap region size in MB. If not set, defaults to 1 |
| memory.maxDirectMemorySizeMb | string | `""` | JVM DirectMemory max size in MB. If not set, defaults to 256 |
| memory.maxMetaspaceSizeMb | string | `""` | JVM Metaspace max size in MB. If not set, defaults to 256 |
| memory.onHeapMb | string | `""` | On-heap memory limit in MB. If set, -Xms and -Xmx will be value. If not set, defaults to 2048 |
| memory.reservedCodeCacheSizeMb | string | `""` | JVM ReservedCodeCache size in MB. If not set, defaults to 240 |
| metrics | object | `{"loggerEnabled":false,"loggerReportPeriodSeconds":1,"prometheusEnabled":false}` | Metrics configuration |
| mysql | object | `{"database":"","host":"","password":"","port":3306,"username":""}` | MySQL configuration |
| nameOverride | string | `""` | String to partially override the fullname template with a string (will prepend the release name) |
| networkPolicy.create | bool | `false` | Create a NetworkPolicy |
| networkPolicy.egress | list | `[{"ports":[{"port":53,"protocol":"UDP"},{"port":53,"protocol":"TCP"}],"to":[{"ipBlock":{"cidr":"0.0.0.0/0"}}]}]` | NetworkPolicy egress rules |
| networkPolicy.ingress | list | `[]` | NetworkPolicy ingress rules |
| networkPolicy.name | string | `""` | Name for the NetworkPolicy (defaults to fullname when empty) |
| nodeSelector | object | `{}` | Node selector |
| opensearch | object | `{"clusterHealthColor":"green","indexName":"","indexPrefix":"","indexReplicasCount":0,"password":"","restClientConnectionTimeout":5000,"restClientReadTimeout":30000,"url":"","username":"","version":0}` | OpenSearch configuration |
| podAnnotations | object | `{}` | Additional annotations to add to pods |
| podDisruptionBudget.create | bool | `false` | Create a PodDisruptionBudget for high availability |
| podDisruptionBudget.maxUnavailable | string | `""` | Maximum number of pods that can be unavailable during disruptions (mutually exclusive with minAvailable) |
| podDisruptionBudget.minAvailable | int | `1` | Minimum number of pods that must be available during disruptions (mutually exclusive with maxUnavailable) |
| podLabels | object | `{}` | Additional labels to add to pods |
| podSecurityContext | object | `{"enabled":true,"fsGroup":1001,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Pod security context configuration |
| podSecurityContext.enabled | bool | `true` | Enable pod security context |
| postgres | object | `{"database":"","host":"","password":"","port":5432,"username":""}` | PostgreSQL configuration |
| priorityClassName | string | `""` | Pod priority class name |
| queue | object | `{"type":"redis_standalone"}` | Queue configuration. Allowed values: redis_standalone, postgres |
| readinessProbe | object | `{"enabled":true,"failureThreshold":3,"httpGet":{"path":"/health","port":8080},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":10}` | Readiness probe configuration |
| readinessProbe.enabled | bool | `true` | Enable readiness probe |
| redis | object | `{"host":"","password":"","port":6379,"queueNamespacePrefix":"conductor_queues","ssl":false,"taskDefCacheRefreshInterval":1,"workflowNamespacePrefix":"conductor"}` | Redis configuration |
| replicaCount | int | `1` | Number of pods |
| resources | object | `{"limits":{"cpu":"2","memory":"3Gi"},"requests":{"cpu":"300m","memory":"2Gi"}}` | Main container requests/limits  memory calculation: onHeapMb (JVM Heap max size)   + maxMetaspaceSizeMb (JVM Metaspace max size)   + reservedCodeCacheSizeMb (JVM ReservedCodeCache size)   + maxDirectMemorySizeMb (JVM DirectMemory max size)   + ~512MB (other overheads; e.g., thread stacks, GC, symbols, etc.) |
| revisionHistoryLimit | int | `10` | Number of old ReplicaSets to retain |
| service.nodePorts.rest | string | `""` | NodePort value for REST API when service.type is NodePort |
| service.nodePorts.ui | string | `""` | NodePort value for UI when service.type is NodePort |
| service.ports | object | `{"rest":8080,"ui":5000}` | Service ports used by the Service spec. targetPort fields reference container.ports.* |
| service.ports.rest | int | `8080` | Service port for REST API |
| service.ports.ui | int | `5000` | Service port for UI |
| service.type | string | `"ClusterIP"` | Service type (ClusterIP, NodePort, LoadBalancer) |
| serviceAccount.annotations | object | `{}` | Additional annotations to add to ServiceAccount |
| serviceAccount.create | bool | `true` | Create a dedicated ServiceAccount |
| serviceAccount.name | string | `""` | Name for the ServiceAccount (autogenerated when empty) |
| spring.profilesActive | string | `"logrotate"` | Spring profiles passed via SPRING_PROFILES_ACTIVE |
| startupProbe | object | `{"enabled":true,"failureThreshold":15,"httpGet":{"path":"/health","port":8080},"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Startup probe configuration |
| startupProbe.enabled | bool | `true` | Enable startup probe |
| terminationGracePeriodSeconds | int | `60` | Pod termination grace period |
| tolerations | list | `[]` | Node tolerations |
| topologySpreadConstraints | list | `[]` | Topology spread constraints |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment update strategy (type only is used) |
| workflowExecutionLock | object | `{"type":"redis"}` | Workflow execution lock configuration. Allowed values: redis, noop |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
