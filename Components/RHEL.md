---
id: "RHEL"
type: component
name: "Red Hat Enterprise Linux"
component_type: "Operating System"
vendor: "Red Hat"
version: "9.x"
systems:
  - "XENA"
  - "ZGW"
classification: "BBN2"
benchmark: "[[Benchmarks/CIS/CIS-RHEL-9-v2.0.0]]"
benchmark_version: "v2.0.0"
status: active
created: 2026-01-30
modified: 2026-01-30
tags:
  - component
  - operating-system
  - linux
---

# Red Hat Enterprise Linux (RHEL)

## Component Information

| Field | Value |
|-------|-------|
| **Type** | Operating System |
| **Vendor** | Red Hat |
| **Version** | 9.x |
| **Classification** | BBN2 |
| **Benchmark** | [[Benchmarks/CIS/CIS-RHEL-9-v2.0.0\|CIS RHEL 9 v2.0.0]] |

## Description

Red Hat Enterprise Linux is the base operating system for all XENA infrastructure servers, including K3S Kubernetes nodes.

## Security Considerations

- CIS Benchmark Level 1 Server profile applied to all servers
- OpenSCAP automated compliance scanning
- AIDE file integrity monitoring
- SELinux enforcing mode
- Firewalld for host-based firewall

## Related Documents

- [[Benchmarks/CIS/CIS-RHEL-9-v2.0.0|CIS RHEL 9 Benchmark]]
- [[Benchmarks/CIS/CIS-Kubernetes-1.29-v1.0.0|CIS Kubernetes Benchmark]]
- [[Components/K3S|K3S Component]]
