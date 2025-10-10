# NOTES from DevHUb Spike

Remove Kaniko build, use Buildah ClusterTask

Need to update images in cluster

## áImport Images to build

```bash
oc import-image registry.redhat.io/ubi8/dotnet-90-runtime:9.0.9-1758211314 --from=registry.redhat.io/ubi8/dotnet-90-runtime:9.0.9-1758211314 --confirm

oc import-image ubi8/dotnet-90:9.0-1758501291 --from=registry.redhat.io/ubi8/dotnet-90:9.0-1758501291 --confirm

```

## For Resync task

Once inported update the task-resync.yaml file in the build helm chart pointing to the imported image.

```bash
oc import-image openshift4/ose-cli:latest --from=registry.redhat.io/openshift4/ose-cli:latest --confirm
```
