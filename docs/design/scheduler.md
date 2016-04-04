# The Gemini Scheduler

The Gemini scheduler runs as a process that interacts with other system
components such as the API server. Its interface to the API server is to watch
for Pods with an empty PodSpec.ClusterName, and for each Pod, it posts a Binding
indicating what cluster the Pod  should be scheduled.

## The scheduling process

The scheduler tries to find a cluster for each Pod, one at a time, as it notices
these Pods via watch. There are three steps. First it applies a set of "predicates" that filter out
inappropriate clusters. For example, if the PodSpec specifies resource requests, then the scheduler
will filter out clusters that don't have at least that much resources available (computed
as the capacity of the cluster minus the sum of the resource requests of the containers that
are already running on the cluster). Second, it applies a set of "priority functions"
that rank the clusters that weren't filtered out by the predicate check. For example,
it tries to spread Pods across clusters while at the same time favoring the least-loaded
clusters (where "load" here is sum of the resource requests of the containers running on the cluster,
divided by the cluster's capacity).
Finally, the cluster with the highest priority is chosen
(or, if there are multiple such clusters, then one of them is chosen at random). The Cluster
for this main scheduling loop is in the function `Schedule()` in
[plugin/pkg/scheduler/generic_scheduler.go](http://releases.k8s.io/release-1.2/plugin/pkg/scheduler/generic_scheduler.go)

## Scheduler extensibility

The scheduler is extensible: the cluster administrator can choose which of the pre-defined
scheduling policies to apply, and can add new ones.
