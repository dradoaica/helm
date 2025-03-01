# Apache Ignite

This is a helm chart for [Apache Ignite](https://ignite.apache.org/)

Apache Ignite is an open-source memory-centric distributed database, caching,
and processing platform for transactional, analytical, and streaming workloads
delivering in-memory speeds at petabyte scale

## Install

```console
helm install --name my-release stable/ignite
```

## Configuration

| Parameter                       | Description                                                                                                                       | Default                                                                                                                           |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `replicaCount`                  | Number of pods for ignite applications                                                                                            | `2`                                                                                                                               |
| `image.repository`              | Image repository                                                                                                                  | `apacheignite/ignite`                                                                                                             |
| `image.tag`                     | Image tag                                                                                                                         | `2.17.0`                                                                                                                          |
| `image.pullPolicy`              | Image pull policy                                                                                                                 | `IfNotPresent`                                                                                                                    |
| `nameOverride`                  | String to partially override ignite.fullname template with a string (will prepend the release name)                               | `nil`                                                                                                                             |
| `fullnameOverride`              | String to fully override ignite.fullname template with a string                                                                   | `nil`                                                                                                                             |
| `rbac.create`                   | Whether or not to create RBAC items (e.g. role, role-binding)                                                                     | `true`                                                                                                                            |
| `serviceAccount.create`         | Whether or not to create dedicated serviceAccount for ignite                                                                      | `true`                                                                                                                            |
| `serviceAccount.name`           | If `serviceAccount.create` is enabled, what should the `serviceAccount` name be - otherwise randomly generated                    | `nil`                                                                                                                             |
| `peerClassLoadingEnabled`       | (Boolean) Enable the Ignite's [Zero Deployment](https://apacheignite.readme.io/docs/zero-deployment)                              | `false`                                                                                                                           |
| `persistence.enabled`           | (Boolean) Enable any persistent settings for ignite - both application and WAL                                                    | `true`                                                                                                                            |
| `persistence.persistenceVolume` | Persistent volume definition for ignite application                                                                               | `{ "size": "8Gi", "storageClassName": "microk8s-hostpath" }`                                                                      |
| `persistence.walVolume`         | Persistent volume definition for WAL storage                                                                                      | `{ "size": "8Gi", "storageClassName": "microk8s-hostpath" }`                                                                      |
| `dataStorage.config`            | Additional config for `org.apache.ignite.configuration.DataStorageConfiguration` class                                            | `nil`                                                                                                                             |
| `ssl.enabled`                   | (Boolean) Enable SSL                                                                                                              | `false`                                                                                                                           |
| `ssl.keyStoreFilePath`          | The path to the key store file. This is a mandatory parameter since the SSL context can not be initialized without a key manager. | `nil`                                                                                                                             |
| `ssl.keyStorePassword`          | The key store password.                                                                                                           | `nil`                                                                                                                             |
| `ssl.trustStoreFilePath`        | The path to the trust store file.                                                                                                 | `nil`                                                                                                                             |
| `ssl.trustStorePassword`        | The trust store password.                                                                                                         | `nil`                                                                                                                             |
| `metrics.enabled`               | (Boolean) Enable metrics                                                                                                          | `false`                                                                                                                           |
| `env`                           | Dictionary (key/value) for additional environment for pod templates (if you need refs use envVars)                                | `{ "OPTION_LIBS": "ignite-kubernetes,ignite-rest-http", "IGNITE_QUIET": "false", "JVM_OPTS": "-Djava.net.preferIPv4Stack=true" }` |
| `envVars`                       | Array of Dictionaries (key/value) for additional environment for pod templates                                                    | `nil`                                                                                                                             |
| `envFrom`                       | Array of Dictionaries (key/value) for additional environment from secrets/config-maps for pod templates                           | `nil`                                                                                                                             |
| `extraInitContainers`           | additional Init Containers to run in the pods                                                                                     | `[]`                                                                                                                              |
| `extraContainers`               | additional containers to run in the pods                                                                                          | `[]`                                                                                                                              |
| `extraVolumes`                  | Extra volumes                                                                                                                     | `nil`                                                                                                                             |
| `extraVolumeMounts`             | Mount extra volume(s)                                                                                                             | `nil`                                                                                                                             |
| `resources`                     | Pod request/limits                                                                                                                | `{}`                                                                                                                              |
| `nodeSelector`                  | Node selector for ignite application                                                                                              | `{}`                                                                                                                              |
| `tolerations`                   | Node tolerations for ignite application                                                                                           | `[]`                                                                                                                              |
| `affinity`                      | Node affinity for ignite application                                                                                              | `{}`                                                                                                                              |
| `priorityClassName`             | Pod Priority Class Name for ignite application                                                                                    | `""`                                                                                                                              |

## DataStorage

Ignite can be served as both database and caching service. By editing "memory and disk usage modes",

## Persistence

Data persistence and WAL persistence can be enabled by specifying appropriate
variables. Please note that default persistence configuration is for MicroK8s.

```console
helm install --name my-release \
    --set persistence.enabled=true \
    --set persistence.persistenceVolume.size=100Gi \
    --set persistence.walVolume.size=100Gi \
    stable/ignite
```

To configure persistence for other volume plugins you should edit
`persistence.(persistenceVolume|walVolume).storageClassName` variables.
