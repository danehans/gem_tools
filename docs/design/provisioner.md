# The Gemini Provisioner

The Gemini provisioner runs as a process that interacts with other system
components such as the API server. Its interface to the API server is to watch
for Clusters with an empty ClusterSpec.TargetName, and for each Cluster, it posts a Binding
indicating what Target the Cluster should be provisioned.

## The provisioning process

The provisioner tries to find a Target for each Cluster, one at a time, by polling the Target's
associated API endpoint. If a registered target does not exist, the provisioner creates one. The
scheduler polls the provisioner API until complete, failed or a scheduled timeout.

TODO: Add more content.
