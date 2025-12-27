# clamav-openshift

![Version: 1.5.1](https://img.shields.io/badge/Version-1.5.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.1](https://img.shields.io/badge/AppVersion-1.5.1-informational?style=flat-square)

ClamAV is an open-source antivirus engine for detecting trojans, viruses, malware & other malicious threats. This chart deploys ClamAV as a StatefulSet with persistence support.

**Homepage:** <https://github.com/dradoaica/clamav-docker-openshift/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| dradoaica | <dradoaica@gmail.com> | <https://dradoaica.blogspot.com/> |

## Source Code

* <https://github.com/dradoaica/clamav-docker-openshift/>

## Requirements

Kubernetes: `>= 1.26.0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Node affinity |
| annotations | object | `{}` | Annotations to add to all resources |
| container.ports | object | `{"clamav":3310,"milter":7357}` | Container ports used by the Pod spec and as Service targetPort values |
| containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"enabled":true,"privileged":false,"readOnlyRootFilesystem":false,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context configuration |
| containerSecurityContext.enabled | bool | `true` | Enable container security context |
| env | object | `{}` | Application-specific environment variables |
| extraContainers | list | `[]` | Extra sidecar containers to inject into the main pod |
| extraEnvFrom | list | `[]` | Extra envFrom entries to inject into the main container |
| extraEnvVars | list | `[]` | Extra environment variables (key/value list) to inject into the main container |
| extraEnvVarsCM | string | `""` | Name of a ConfigMap with extra environment variables to inject into the main container |
| extraEnvVarsSecret | string | `""` | Name of a Secret with extra environment variables to inject into the main container |
| extraInitContainers | list | `[]` | Extra init containers to inject into the main pod |
| extraVolumeMounts | list | `[]` | Extra volume mounts to add to the main container |
| extraVolumes | list | `[]` | Extra volumes to add to the main pod |
| freshclam.httpsProxyHost | string | `""` | HTTPS proxy host for freshclam updates |
| freshclam.httpsProxyPort | string | `""` | HTTPS proxy port for freshclam updates |
| freshclam.mirrors | string | `"database.clamav.net"` | ClamAV database mirror servers |
| fullnameOverride | string | `""` | String to fully override the fullname template with a string |
| global.imagePullSecrets | list | `[]` | Global pod image pull secrets |
| global.imageRegistry | string | `""` | Global container image registry override |
| image.pullPolicy | string | `"IfNotPresent"` | Main container image pull policy |
| image.registry | string | `"docker.io"` | Main container image registry |
| image.repository | string | `"dradoaica/clamav-openshift"` | Main container image repository |
| image.tag | string | `"1.5.1"` | Main container image tag |
| labels | object | `{}` | Additional labels to add to all resources |
| lifecycleHooks | object | `{}` | Lifecycle hooks configuration |
| limits.connectionQueueLength | int | `100` | Maximum length the queue of pending connections may grow to |
| limits.fileSize | int | `25` | Maximum file size to scan (in MB) |
| limits.maxThreads | int | `4` | Maximum number of threads running at the same time |
| limits.scanSize | int | `100` | Maximum scan size permitted (in MB) |
| limits.sendBufTimeout | int | `500` | Time to wait (in milliseconds) if send buffer is full (keep low to avoid clamd hanging) |
| livenessProbe | object | `{"enabled":true,"exec":{"command":["/usr/local/bin/clamdcheck.sh"]},"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}` | Liveness probe configuration |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| nameOverride | string | `""` | String to partially override the fullname template with a string (will prepend the release name) |
| networkPolicy.create | bool | `false` | Create a NetworkPolicy |
| networkPolicy.egress | list | `[]` | NetworkPolicy egress rules |
| networkPolicy.ingress | list | `[]` | NetworkPolicy ingress rules |
| networkPolicy.name | string | `""` | NetworkPolicy name override (defaults to fullname when empty) |
| nodeSelector | object | `{}` | Node selector |
| persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"labels":{},"persistentVolumeClaimRetentionPolicy":{"enabled":false,"whenDeleted":"Retain","whenScaled":"Retain"},"size":"2Gi","storageClass":""}` | Persistence is always enabled |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Persistent volume access modes |
| persistence.annotations | object | `{}` | Annotations to add to the PersistentVolumeClaim (PVC) |
| persistence.labels | object | `{}` | Labels to add to the PersistentVolumeClaim (PVC) |
| persistence.persistentVolumeClaimRetentionPolicy.enabled | bool | `false` | Enable persistent volume retention policy |
| persistence.persistentVolumeClaimRetentionPolicy.whenDeleted | string | `"Retain"` | Volume retention behavior that applies when the StatefulSet is deleted |
| persistence.persistentVolumeClaimRetentionPolicy.whenScaled | string | `"Retain"` | Volume retention behavior when the replica count of the StatefulSet is reduced |
| persistence.size | string | `"2Gi"` | Persistent volume size for virus signature databases |
| persistence.storageClass | string | `""` | Persistent volume storage class (empty string uses cluster default) |
| podAnnotations | object | `{}` | Additional annotations to add to pods |
| podDisruptionBudget.create | bool | `false` | Create PodDisruptionBudget for high availability |
| podDisruptionBudget.maxUnavailable | string | `""` | Maximum number of pods that can be unavailable during disruptions (mutually exclusive with minAvailable) |
| podDisruptionBudget.minAvailable | int | `1` | Minimum number of pods that must be available during disruptions (mutually exclusive with maxUnavailable) |
| podLabels | object | `{}` | Additional labels to add to pods |
| podManagementPolicy | string | `"OrderedReady"` | StatefulSet pod management policy |
| podSecurityContext | object | `{"enabled":true,"fsGroup":1001,"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Pod security context configuration |
| podSecurityContext.enabled | bool | `true` | Enable pod security context |
| priorityClassName | string | `""` | Pod priority class name |
| readinessProbe | object | `{"enabled":true,"exec":{"command":["/usr/local/bin/clamdcheck.sh"]},"failureThreshold":3,"initialDelaySeconds":5,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}` | Readiness probe configuration |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| replicaCount | int | `1` | Number of pods |
| resources | object | `{"limits":{"cpu":"2","memory":"4Gi"},"requests":{"cpu":"300m","memory":"2Gi"}}` | Main container requests/limits |
| revisionHistoryLimit | int | `10` | Number of old ReplicaSets to retain |
| service.nodePorts.clamav | string | `""` | NodePort value for ClamAV when service.type is NodePort |
| service.nodePorts.milter | string | `""` | NodePort value for Milter when service.type is NodePort |
| service.ports.clamav | int | `3310` | Service port for ClamAV |
| service.ports.milter | int | `7357` | Service port for Milter |
| service.type | string | `"ClusterIP"` | Service type (ClusterIP, NodePort, LoadBalancer) |
| serviceAccount.annotations | object | `{}` | Additional annotations to add to ServiceAccount |
| serviceAccount.create | bool | `true` | Create a dedicated ServiceAccount |
| serviceAccount.name | string | `""` | Name for the ServiceAccount (autogenerated when empty) |
| startupProbe | object | `{"enabled":true,"exec":{"command":["/usr/local/bin/clamdcheck.sh"]},"failureThreshold":30,"initialDelaySeconds":5,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":5}` | Startup probe configuration |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| terminationGracePeriodSeconds | int | `60` | Pod termination grace period |
| tolerations | list | `[]` | Node tolerations |
| topologySpreadConstraints | list | `[]` | Topology spread constraints |
| updateStrategy | object | `{"rollingUpdate":{"partition":0},"type":"RollingUpdate"}` | StatefulSet update strategy |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
