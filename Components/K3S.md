---
id: "K3S"
type: component
name: "K3S Kubernetes"
component_type: "Container Orchestration"
vendor: "Rancher Labs / SUSE"
version: "1.29.x"
systems:
  - "XENA"
  - "ZGW"
classification: "BBN2"
benchmark: "[[Benchmarks/CIS/CIS-Kubernetes-1.29-v1.0.0]]"
benchmark_version: "v1.0.0"
related_benchmarks:
  - "[[Benchmarks/CIS/CIS-RHEL-9-v2.0.0]]"
status: active
created: 2026-01-30
modified: 2026-01-30
tags:
  - component
  - kubernetes
  - container
  - orchestration
---

# K3S Kubernetes

## Component Information

| Field | Value |
|-------|-------|
| **Type** | Container Orchestration |
| **Vendor** | Rancher Labs / SUSE |
| **Version** | 1.29.x |
| **Classification** | BBN2 |
| **Primary Benchmark** | [[Benchmarks/CIS/CIS-Kubernetes-1.29-v1.0.0\|CIS Kubernetes 1.29]] |
| **OS Benchmark** | [[Benchmarks/CIS/CIS-RHEL-9-v2.0.0\|CIS RHEL 9]] |

## Description

K3S is a lightweight, certified Kubernetes distribution designed for production workloads. It is used as the container orchestration platform for XENA and ZGW applications.

## Architecture

```
K3S Cluster
├── Control Plane (3 nodes)
│   ├── API Server
│   ├── Controller Manager
│   ├── Scheduler
│   └── etcd (embedded)
└── Worker Nodes (n nodes)
    ├── kubelet
    ├── containerd
    └── kube-proxy
```

## Security Considerations

### Kubernetes Layer
- CIS Kubernetes Benchmark Level 1 applied
- RBAC enabled for authorization
- Pod Security Standards enforced
- NetworkPolicies for pod isolation
- Secrets encrypted at rest

### Operating System Layer
- CIS RHEL 9 Benchmark Level 1 applied
- SELinux enforcing mode
- Firewalld with minimal open ports
- SSH hardened per CIS recommendations

## K3S-Specific Hardening

```yaml
# /etc/rancher/k3s/config.yaml
write-kubeconfig-mode: "0640"
kube-apiserver-arg:
  - "anonymous-auth=false"
  - "audit-log-path=/var/log/kubernetes/audit.log"
kubelet-arg:
  - "anonymous-auth=false"
  - "read-only-port=0"
```

## Related Documents

- [[Benchmarks/CIS/CIS-Kubernetes-1.29-v1.0.0|CIS Kubernetes Benchmark]]
- [[Benchmarks/CIS/CIS-RHEL-9-v2.0.0|CIS RHEL 9 Benchmark]]
- [[Components/RHEL|RHEL Component]]
- [[Systems/XENA|XENA System]]
