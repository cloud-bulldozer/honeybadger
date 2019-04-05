# Benchmark Operator

The intent of this Operator is to deploy common workloads to establish
a performance baseline of Kubernetes cluster on your provider.

## Workloads status

| Workload                       | Use                  | Status in Operator |
| ------------------------------ | -------------------- | ------------------ |
| UPerf                          | Network Performance  | Working            |
| FIO-lite                       | Storage IO           | Working            |
| Sysbench                       | System Performance   | Working            |
| [Couchbase](docs/couchbase.md) | Infrastructure       | Working            |
| [YCSB](docs/ycsb.md)           | Database Performance | Working            |

## Installation
[Installation](docs/installation.md)

## Contributing
[Contributing](CONTRIBUTE.md)

## Community
Key Members(slack_usernames): aakarsh, dblack or rook
* [**#sig-scalability on Kubernetes Slack**](https://kubernetes.slack.com)
* [**#forum-kni-perfscale on CoreOS Slack**](https://coreos.slack.com)
