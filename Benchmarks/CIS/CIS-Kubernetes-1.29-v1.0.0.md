---
id: "CIS-Kubernetes-1.29-v1.0.0"
type: benchmark
benchmark_type: "CIS"
name: "CIS Kubernetes Benchmark"
technology: "Kubernetes"
technology_version: "1.29"
benchmark_version: "1.0.0"
cis_release_date: 2024-03-15
cis_download_url: "https://workbench.cisecurity.org/"
applies_to:
  - "[[Components/K3S]]"
status: Active
recommendations_count: 124
created: 2026-01-30
modified: 2026-01-30
tags:
  - benchmark
  - cis
  - kubernetes
  - k3s
  - container
---

# CIS Kubernetes 1.29 Benchmark v1.0.0

## Benchmark Information

| Field | Value |
|-------|-------|
| **Technology** | Kubernetes 1.29 |
| **Benchmark Version** | v1.0.0 |
| **CIS Release Date** | 2024-03-15 |
| **Status** | Active |
| **Recommendations** | 124 |
| **Download** | [CIS WorkBench](https://workbench.cisecurity.org/) |

## Navigation

| ← Back | Up | Component |
|--------|-----|-----------|
| [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/K3S]] |

---

## Scope

### Applies To

- Kubernetes 1.29.x (including K3S distributions)
- Control plane components (API Server, Controller Manager, Scheduler, etcd)
- Worker node components (kubelet, kube-proxy)
- Both managed and self-managed clusters

### Does Not Apply To

- Managed Kubernetes services (AKS, EKS, GKE) - use cloud-specific benchmarks
- OpenShift (separate benchmark available)
- Versions below 1.27

---

## Profile Definitions

| Profile | Description | Our Choice |
|---------|-------------|------------|
| **Level 1** | Basic security, minimal operational impact | ✅ Required |
| **Level 2** | Defense-in-depth, may require configuration changes | ⚠️ Where possible |

---

## Recommendations Overview

| Section | Topic | # Recs | Level 1 | Level 2 |
|---------|-------|--------|---------|---------|
| 1 | Control Plane Components | 35 | 28 | 7 |
| 2 | etcd | 8 | 6 | 2 |
| 3 | Control Plane Configuration | 15 | 12 | 3 |
| 4 | Worker Nodes | 26 | 22 | 4 |
| 5 | Policies | 40 | 32 | 8 |
| **Total** | | **124** | **100** | **24** |

> **Note:** This document contains **key recommendations** with detailed audit and remediation steps. For the complete list of all 124 recommendations, see the [[#Complete Recommendations Checklist|Complete Checklist]] section below or download the official CIS Benchmark PDF.

---

## Key Recommendations

The following sections contain selected key recommendations with full technical details. This is **not exhaustive** - see the Complete Checklist for all recommendations.

---

## 1. Control Plane Components

### 1.1 API Server

#### 1.1.1 Ensure anonymous-auth is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Description:**
Disable anonymous authentication to the API server.

**Rationale:**
Anonymous access allows unauthenticated users to interact with the cluster.

**Audit:**
```bash
# Check API server arguments
ps -ef | grep kube-apiserver | grep -v grep | grep anonymous-auth

# For K3S, check the configuration
cat /etc/rancher/k3s/config.yaml | grep anonymous-auth

# Expected: --anonymous-auth=false or not present (default is false in recent versions)
```

**Remediation:**
```yaml
# For K3S, add to /etc/rancher/k3s/config.yaml
kube-apiserver-arg:
  - "anonymous-auth=false"
```

```bash
# Restart K3S
sudo systemctl restart k3s
```

---

#### 1.1.2 Ensure API Server uses TLS certificates (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10\|CIS-3.10]] |

**Description:**
Ensure the API Server is configured with TLS certificates for secure communication.

**Audit:**
```bash
# Check for TLS configuration
ps -ef | grep kube-apiserver | grep -E "tls-cert-file|tls-private-key-file"

# Expected: Both flags present with valid paths
```

**Remediation:**
```yaml
# K3S handles this automatically, but verify:
kube-apiserver-arg:
  - "tls-cert-file=/var/lib/rancher/k3s/server/tls/serving-kube-apiserver.crt"
  - "tls-private-key-file=/var/lib/rancher/k3s/server/tls/serving-kube-apiserver.key"
```

---

#### 1.1.3 Ensure audit logging is enabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2\|CIS-8.2]] |

**Description:**
Enable audit logging to track all API requests.

**Audit:**
```bash
# Check for audit configuration
ps -ef | grep kube-apiserver | grep audit-log-path
```

**Remediation:**
```yaml
# Create audit policy file
# /var/lib/rancher/k3s/server/audit-policy.yaml
apiVersion: audit.k8s.io/v1
kind: Policy
rules:
  - level: Metadata
    resources:
    - group: ""
      resources: ["secrets", "configmaps"]
  - level: RequestResponse
    resources:
    - group: ""
      resources: ["pods", "services"]
  - level: None
    users: ["system:kube-proxy"]
    verbs: ["watch"]
    resources:
    - group: ""
      resources: ["endpoints", "services"]
```

```yaml
# K3S config
kube-apiserver-arg:
  - "audit-log-path=/var/log/kubernetes/audit.log"
  - "audit-log-maxage=30"
  - "audit-log-maxbackup=10"
  - "audit-log-maxsize=100"
  - "audit-policy-file=/var/lib/rancher/k3s/server/audit-policy.yaml"
```

---

#### 1.1.4 Ensure RBAC is enabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-6.8\|CIS-6.8]] |

**Description:**
Enable Role-Based Access Control (RBAC) for fine-grained authorization.

**Audit:**
```bash
# Check authorization mode
ps -ef | grep kube-apiserver | grep authorization-mode

# Expected: RBAC is included in the authorization modes
```

**Remediation:**
```yaml
# K3S enables RBAC by default
# Verify in config:
kube-apiserver-arg:
  - "authorization-mode=Node,RBAC"
```

---

### 1.2 Controller Manager

#### 1.2.1 Ensure bind-address is set to 127.0.0.1 (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Description:**
Bind the Controller Manager to localhost only.

**Audit:**
```bash
ps -ef | grep kube-controller-manager | grep bind-address
# Expected: --bind-address=127.0.0.1
```

---

### 1.3 Scheduler

#### 1.3.1 Ensure bind-address is set to 127.0.0.1 (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Audit:**
```bash
ps -ef | grep kube-scheduler | grep bind-address
# Expected: --bind-address=127.0.0.1
```

---

## 2. etcd

### 2.1 Ensure etcd data is encrypted at rest (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.11\|CIS-3.11]] |

**Description:**
Encrypt secrets stored in etcd using encryption at rest.

**Audit:**
```bash
# Check for encryption configuration
ps -ef | grep kube-apiserver | grep encryption-provider-config
```

**Remediation:**
```yaml
# Create encryption config
# /var/lib/rancher/k3s/server/encryption-config.yaml
apiVersion: apiserver.config.k8s.io/v1
kind: EncryptionConfiguration
resources:
  - resources:
    - secrets
    providers:
    - aescbc:
        keys:
        - name: key1
          secret: <base64-encoded-key>
    - identity: {}
```

```yaml
# K3S config
kube-apiserver-arg:
  - "encryption-provider-config=/var/lib/rancher/k3s/server/encryption-config.yaml"
```

---

### 2.2 Ensure etcd uses TLS for peer communication (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10\|CIS-3.10]] |

**Audit:**
```bash
# Check etcd peer TLS configuration
ps -ef | grep etcd | grep -E "peer-cert-file|peer-key-file"
```

---

## 3. Control Plane Configuration

### 3.1 Authentication and Authorization

#### 3.1.1 Ensure client certificate authentication is used (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-6.3\|CIS-6.3]] |

**Description:**
Use client certificates for user authentication.

**Audit:**
```bash
# Check kubeconfig
cat ~/.kube/config | grep client-certificate
```

---

### 3.2 Logging

#### 3.2.1 Ensure a minimal audit policy is configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2\|CIS-8.2]] |

See section 1.1.3 for audit policy configuration.

---

## 4. Worker Nodes

### 4.1 Kubelet

#### 4.1.1 Ensure anonymous authentication is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Audit:**
```bash
# Check kubelet configuration
ps -ef | grep kubelet | grep anonymous-auth
# Or check kubelet config file
cat /var/lib/kubelet/config.yaml | grep anonymous
```

**Expected:**
```yaml
authentication:
  anonymous:
    enabled: false
```

**Remediation:**
```yaml
# K3S config
kubelet-arg:
  - "anonymous-auth=false"
```

---

#### 4.1.2 Ensure authorization mode is not AlwaysAllow (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-6.8\|CIS-6.8]] |

**Audit:**
```bash
ps -ef | grep kubelet | grep authorization-mode
# Expected: Webhook (not AlwaysAllow)
```

---

#### 4.1.3 Ensure read-only port is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Audit:**
```bash
ps -ef | grep kubelet | grep read-only-port
# Expected: --read-only-port=0
```

**Remediation:**
```yaml
kubelet-arg:
  - "read-only-port=0"
```

---

### 4.2 Container Runtime

#### 4.2.1 Ensure container runtime socket has restricted permissions (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-3.3\|CIS-3.3]] |

**Audit:**
```bash
# For containerd (K3S default)
ls -la /run/containerd/containerd.sock
# Expected: srw-rw---- root root
```

---

## 5. Policies

### 5.1 RBAC and Service Accounts

#### 5.1.1 Ensure default service account is not used (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.7\|CIS-4.7]] |

**Description:**
Pods should not use the default service account.

**Audit:**
```bash
# Find pods using default service account
kubectl get pods --all-namespaces -o jsonpath='{range .items[?(@.spec.serviceAccountName=="default")]}{.metadata.namespace}/{.metadata.name}{"\n"}{end}'
```

**Remediation:**
```yaml
# Create dedicated service accounts per application
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-app-sa
  namespace: my-namespace
---
# Configure pod to use dedicated SA
spec:
  serviceAccountName: my-app-sa
  automountServiceAccountToken: false  # if not needed
```

---

#### 5.1.2 Minimize wildcards in Roles and ClusterRoles (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-6.8\|CIS-6.8]] |

**Audit:**
```bash
# Find roles with wildcards
kubectl get clusterroles -o json | jq '.items[] | select(.rules[]?.resources[]? == "*" or .rules[]?.verbs[]? == "*") | .metadata.name'
```

---

### 5.2 Pod Security

#### 5.2.1 Ensure Pod Security Standards are enforced (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-4.6\|CIS-4.6]] |

**Description:**
Enforce Pod Security Standards (PSS) at namespace level.

**Audit:**
```bash
# Check namespace labels for PSS
kubectl get namespaces -o jsonpath='{range .items[*]}{.metadata.name}: {.metadata.labels.pod-security\.kubernetes\.io/enforce}{"\n"}{end}'
```

**Remediation:**
```yaml
# Apply PSS to namespace
apiVersion: v1
kind: Namespace
metadata:
  name: production
  labels:
    pod-security.kubernetes.io/enforce: restricted
    pod-security.kubernetes.io/enforce-version: latest
    pod-security.kubernetes.io/audit: restricted
    pod-security.kubernetes.io/warn: restricted
```

---

#### 5.2.2 Minimize containers running as root (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Description:**
Containers should run as non-root users.

**Audit:**
```bash
# Find pods running as root
kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}: {.spec.containers[*].securityContext.runAsNonRoot}{"\n"}{end}'
```

**Remediation:**
```yaml
spec:
  containers:
  - name: app
    securityContext:
      runAsNonRoot: true
      runAsUser: 1000
      allowPrivilegeEscalation: false
      capabilities:
        drop:
          - ALL
```

---

### 5.3 Network Policies

#### 5.3.1 Ensure NetworkPolicies are defined (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 |
| **CIS Control** | [[Controls/CIS/CIS-12.2\|CIS-12.2]] |

**Description:**
Define NetworkPolicies to control pod-to-pod communication.

**Audit:**
```bash
# Check for NetworkPolicies
kubectl get networkpolicies --all-namespaces
```

**Remediation:**
```yaml
# Default deny all ingress
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-ingress
  namespace: production
spec:
  podSelector: {}
  policyTypes:
  - Ingress
---
# Allow specific traffic
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-web
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: web
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: ingress
    ports:
    - protocol: TCP
      port: 8080
```

---

### 5.4 Secrets Management

#### 5.4.1 Prefer using secrets as files over environment variables (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 |
| **CIS Control** | [[Controls/CIS/CIS-3.11\|CIS-3.11]] |

**Description:**
Mount secrets as files rather than environment variables to reduce exposure.

**Remediation:**
```yaml
# Recommended: Mount as file
spec:
  containers:
  - name: app
    volumeMounts:
    - name: secret-volume
      mountPath: /etc/secrets
      readOnly: true
  volumes:
  - name: secret-volume
    secret:
      secretName: my-secret

# Avoid: Environment variable
# env:
# - name: SECRET_KEY
#   valueFrom:
#     secretKeyRef: ...
```

---

## CIS Controls Mapping

| CIS Control | Recommendations | Level |
|-------------|-----------------|-------|
| [[Controls/CIS/CIS-3.3\|CIS-3.3]] | 4.2.1 | 1 |
| [[Controls/CIS/CIS-3.10\|CIS-3.10]] | 1.1.2, 2.2 | 1 |
| [[Controls/CIS/CIS-3.11\|CIS-3.11]] | 2.1, 5.4.1 | 1/2 |
| [[Controls/CIS/CIS-4.1\|CIS-4.1]] | 1.1.1, 4.1.1, 5.2.2 | 1/2 |
| [[Controls/CIS/CIS-4.4\|CIS-4.4]] | 1.2.1, 1.3.1 | 1 |
| [[Controls/CIS/CIS-4.6\|CIS-4.6]] | 5.2.1 | 1 |
| [[Controls/CIS/CIS-4.7\|CIS-4.7]] | 5.1.1 | 1 |
| [[Controls/CIS/CIS-4.8\|CIS-4.8]] | 4.1.3 | 1 |
| [[Controls/CIS/CIS-6.3\|CIS-6.3]] | 3.1.1 | 1 |
| [[Controls/CIS/CIS-6.8\|CIS-6.8]] | 1.1.4, 4.1.2, 5.1.2 | 1 |
| [[Controls/CIS/CIS-8.2\|CIS-8.2]] | 1.1.3, 3.2.1 | 1 |
| [[Controls/CIS/CIS-12.2\|CIS-12.2]] | 5.3.1 | 1 |

---

## K3S Specific Notes

K3S is a lightweight Kubernetes distribution that includes some security defaults:

| Feature | K3S Default | CIS Requirement |
|---------|-------------|-----------------|
| RBAC | ✅ Enabled | ✅ Required |
| TLS | ✅ Auto-generated | ✅ Required |
| Network Policy | ✅ Supported (Traefik) | ✅ Required |
| Audit Logging | ❌ Not default | Manual config |
| etcd Encryption | ❌ Not default | Manual config |
| PSS | ❌ Not default | Manual config |

### K3S Hardening Config Example

```yaml
# /etc/rancher/k3s/config.yaml
write-kubeconfig-mode: "0640"
kube-apiserver-arg:
  - "anonymous-auth=false"
  - "audit-log-path=/var/log/kubernetes/audit.log"
  - "audit-log-maxage=30"
  - "audit-policy-file=/var/lib/rancher/k3s/server/audit-policy.yaml"
  - "encryption-provider-config=/var/lib/rancher/k3s/server/encryption-config.yaml"
kubelet-arg:
  - "anonymous-auth=false"
  - "read-only-port=0"
  - "protect-kernel-defaults=true"
```

---

## Complete Recommendations Checklist

This checklist contains **all 124 recommendations** from the CIS Kubernetes 1.29 Benchmark. Use this for tracking implementation progress.

### 1. Control Plane Components

#### 1.1 API Server

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1.1 | Ensure anonymous-auth is disabled | L1 | ☐ |
| 1.1.2 | Ensure basic-auth-file is not set | L1 | ☐ |
| 1.1.3 | Ensure token-auth-file is not set | L1 | ☐ |
| 1.1.4 | Ensure kubelet-https is enabled | L1 | ☐ |
| 1.1.5 | Ensure kubelet-client-certificate and key are set | L1 | ☐ |
| 1.1.6 | Ensure kubelet-certificate-authority is set | L1 | ☐ |
| 1.1.7 | Ensure authorization-mode is not AlwaysAllow | L1 | ☐ |
| 1.1.8 | Ensure authorization-mode includes Node | L1 | ☐ |
| 1.1.9 | Ensure authorization-mode includes RBAC | L1 | ☐ |
| 1.1.10 | Ensure admission control plugin EventRateLimit is set | L1 | ☐ |
| 1.1.11 | Ensure admission control plugin AlwaysAdmit is not set | L1 | ☐ |
| 1.1.12 | Ensure admission control plugin AlwaysPullImages is set | L2 | ☐ |
| 1.1.13 | Ensure admission control plugin SecurityContextDeny is set | L2 | ☐ |
| 1.1.14 | Ensure admission control plugin ServiceAccount is set | L1 | ☐ |
| 1.1.15 | Ensure admission control plugin NamespaceLifecycle is set | L1 | ☐ |
| 1.1.16 | Ensure admission control plugin NodeRestriction is set | L1 | ☐ |
| 1.1.17 | Ensure insecure-bind-address is not set | L1 | ☐ |
| 1.1.18 | Ensure insecure-port is set to 0 | L1 | ☐ |
| 1.1.19 | Ensure secure-port is not set to 0 | L1 | ☐ |
| 1.1.20 | Ensure profiling is disabled | L1 | ☐ |
| 1.1.21 | Ensure audit-log-path is set | L1 | ☐ |
| 1.1.22 | Ensure audit-log-maxage is set to 30 or greater | L1 | ☐ |
| 1.1.23 | Ensure audit-log-maxbackup is set to 10 or greater | L1 | ☐ |
| 1.1.24 | Ensure audit-log-maxsize is set to 100 or greater | L1 | ☐ |
| 1.1.25 | Ensure request-timeout is set appropriately | L1 | ☐ |
| 1.1.26 | Ensure service-account-lookup is set to true | L1 | ☐ |
| 1.1.27 | Ensure service-account-key-file is set | L1 | ☐ |
| 1.1.28 | Ensure etcd-certfile and etcd-keyfile are set | L1 | ☐ |
| 1.1.29 | Ensure tls-cert-file and tls-private-key-file are set | L1 | ☐ |
| 1.1.30 | Ensure client-ca-file is set | L1 | ☐ |
| 1.1.31 | Ensure etcd-cafile is set | L1 | ☐ |
| 1.1.32 | Ensure encryption-provider-config is set | L1 | ☐ |
| 1.1.33 | Ensure encryption providers are appropriately configured | L1 | ☐ |
| 1.1.34 | Ensure API Server only makes use of strong ciphers | L1 | ☐ |
| 1.1.35 | Ensure DenyServiceExternalIPs is not disabled | L1 | ☐ |

#### 1.2 Controller Manager

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.2.1 | Ensure profiling is disabled | L1 | ☐ |
| 1.2.2 | Ensure use-service-account-credentials is set to true | L1 | ☐ |
| 1.2.3 | Ensure service-account-private-key-file is set | L1 | ☐ |
| 1.2.4 | Ensure root-ca-file is set | L1 | ☐ |
| 1.2.5 | Ensure RotateKubeletServerCertificate is set to true | L2 | ☐ |
| 1.2.6 | Ensure bind-address is set to 127.0.0.1 | L1 | ☐ |

#### 1.3 Scheduler

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.3.1 | Ensure profiling is disabled | L1 | ☐ |
| 1.3.2 | Ensure bind-address is set to 127.0.0.1 | L1 | ☐ |

### 2. etcd

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 2.1 | Ensure etcd data directory permissions are set to 700 | L1 | ☐ |
| 2.2 | Ensure etcd data directory ownership is set to etcd:etcd | L1 | ☐ |
| 2.3 | Ensure etcd client-cert-auth is set to true | L1 | ☐ |
| 2.4 | Ensure etcd auto-tls is not set to true | L1 | ☐ |
| 2.5 | Ensure etcd peer-client-cert-auth is set to true | L1 | ☐ |
| 2.6 | Ensure etcd peer-auto-tls is not set to true | L1 | ☐ |
| 2.7 | Ensure etcd is configured with unique CA | L2 | ☐ |
| 2.8 | Ensure encryption at rest is configured | L1 | ☐ |

### 3. Control Plane Configuration

#### 3.1 Authentication and Authorization

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.1.1 | Client certificate authentication should not be used | L1 | ☐ |
| 3.1.2 | Service account token authentication should not be used | L1 | ☐ |
| 3.1.3 | Bootstrap token authentication should not be used | L1 | ☐ |

#### 3.2 Logging

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.2.1 | Ensure a minimal audit policy is created | L1 | ☐ |
| 3.2.2 | Ensure audit policy covers key security concerns | L2 | ☐ |

### 4. Worker Nodes

#### 4.1 Kubelet

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.1.1 | Ensure anonymous-auth is set to false | L1 | ☐ |
| 4.1.2 | Ensure authorization-mode is not AlwaysAllow | L1 | ☐ |
| 4.1.3 | Ensure client-ca-file is set | L1 | ☐ |
| 4.1.4 | Ensure read-only-port is set to 0 | L1 | ☐ |
| 4.1.5 | Ensure streaming-connection-idle-timeout is not set to 0 | L1 | ☐ |
| 4.1.6 | Ensure protect-kernel-defaults is set to true | L1 | ☐ |
| 4.1.7 | Ensure make-iptables-util-chains is set to true | L1 | ☐ |
| 4.1.8 | Ensure hostname-override is not set | L1 | ☐ |
| 4.1.9 | Ensure eventRecordQPS is set appropriately | L2 | ☐ |
| 4.1.10 | Ensure tls-cert-file and tls-private-key-file are set | L1 | ☐ |
| 4.1.11 | Ensure rotate-certificates is set to true | L1 | ☐ |
| 4.1.12 | Ensure RotateKubeletServerCertificate is set to true | L1 | ☐ |
| 4.1.13 | Ensure Kubelet only makes use of strong ciphers | L1 | ☐ |

#### 4.2 Kubelet Configuration Files

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.2.1 | Ensure kubelet service file permissions are set to 600 | L1 | ☐ |
| 4.2.2 | Ensure kubelet service file ownership is set to root:root | L1 | ☐ |
| 4.2.3 | Ensure proxy kubeconfig file permissions are set to 600 | L1 | ☐ |
| 4.2.4 | Ensure proxy kubeconfig file ownership is set to root:root | L1 | ☐ |
| 4.2.5 | Ensure kubelet.conf file permissions are set to 600 | L1 | ☐ |
| 4.2.6 | Ensure kubelet.conf file ownership is set to root:root | L1 | ☐ |
| 4.2.7 | Ensure certificate authorities file permissions are set to 600 | L1 | ☐ |
| 4.2.8 | Ensure client certificate authorities file ownership is set to root:root | L1 | ☐ |
| 4.2.9 | Ensure kubelet config.yaml file permissions are set to 600 | L1 | ☐ |
| 4.2.10 | Ensure kubelet config.yaml file ownership is set to root:root | L1 | ☐ |

### 5. Policies

#### 5.1 RBAC and Service Accounts

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.1.1 | Ensure cluster-admin role is only used where required | L1 | ☐ |
| 5.1.2 | Minimize access to secrets | L1 | ☐ |
| 5.1.3 | Minimize wildcard use in Roles and ClusterRoles | L1 | ☐ |
| 5.1.4 | Minimize access to create pods | L1 | ☐ |
| 5.1.5 | Ensure default service account is not used | L1 | ☐ |
| 5.1.6 | Ensure service account tokens are only mounted where necessary | L1 | ☐ |
| 5.1.7 | Avoid use of system:masters group | L1 | ☐ |
| 5.1.8 | Limit use of BindRoleRequests and EscalateRoleRequests | L1 | ☐ |

#### 5.2 Pod Security

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.2.1 | Ensure Pod Security Standards are enforced | L1 | ☐ |
| 5.2.2 | Minimize privileged containers | L1 | ☐ |
| 5.2.3 | Minimize containers running as root | L2 | ☐ |
| 5.2.4 | Minimize containers with allowPrivilegeEscalation | L1 | ☐ |
| 5.2.5 | Minimize root container capabilities | L1 | ☐ |
| 5.2.6 | Minimize containers with NET_RAW capability | L1 | ☐ |
| 5.2.7 | Minimize containers with added capabilities | L1 | ☐ |
| 5.2.8 | Minimize containers without read-only root filesystem | L2 | ☐ |
| 5.2.9 | Minimize containers with hostPID | L1 | ☐ |
| 5.2.10 | Minimize containers with hostIPC | L1 | ☐ |
| 5.2.11 | Minimize containers with hostNetwork | L1 | ☐ |
| 5.2.12 | Minimize containers with hostPorts | L1 | ☐ |
| 5.2.13 | Minimize containers with hostPath volumes | L1 | ☐ |

#### 5.3 Network Policies

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.3.1 | Ensure default deny NetworkPolicies exist | L1 | ☐ |
| 5.3.2 | Ensure ingress NetworkPolicies are defined | L1 | ☐ |
| 5.3.3 | Ensure egress NetworkPolicies are defined | L2 | ☐ |

#### 5.4 Secrets Management

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.4.1 | Prefer using secrets as files over environment variables | L2 | ☐ |
| 5.4.2 | Consider external secret storage | L2 | ☐ |

#### 5.5 Extensible Admission Control

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.5.1 | Configure Image Provenance using ImagePolicyWebhook | L2 | ☐ |

#### 5.7 General Policies

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.7.1 | Create administrative boundaries using namespaces | L1 | ☐ |
| 5.7.2 | Ensure seccomp profile is set appropriately | L2 | ☐ |
| 5.7.3 | Apply Security Context to pods and containers | L1 | ☐ |
| 5.7.4 | Ensure default namespace is not used | L1 | ☐ |

---

## Official Source

> **CIS Benchmark PDF Download**
> 
> The complete CIS Kubernetes 1.29 Benchmark with all 124 recommendations, detailed rationale, and full audit/remediation procedures is available for free download (non-commercial use):
> 
> → **[CIS WorkBench](https://workbench.cisecurity.org/)** (free registration required)
> 
> → **[CIS Kubernetes Benchmark Page](https://www.cisecurity.org/benchmark/kubernetes)**

---

## Change History

| CIS Version | Date | Key Changes |
|-------------|------|-------------|
| v1.0.0 | 2024-03-15 | Initial version for Kubernetes 1.29 |

---

## Related Documents

- [[Components/K3S|K3S Component]]
- [[Benchmarks/CIS/CIS-RHEL-9-v2.0.0|CIS RHEL 9 Benchmark]] (for K3S nodes)
- Original PDF: [CIS WorkBench](https://workbench.cisecurity.org/)
