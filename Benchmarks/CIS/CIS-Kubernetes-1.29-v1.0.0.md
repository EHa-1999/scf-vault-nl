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

## Implementation Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1.1 | Disable anonymous auth (API Server) | 1 | ☐ |
| 1.1.2 | Enable TLS certificates | 1 | ☐ |
| 1.1.3 | Enable audit logging | 1 | ☐ |
| 1.1.4 | Enable RBAC | 1 | ☐ |
| 2.1 | Encrypt etcd at rest | 1 | ☐ |
| 4.1.1 | Disable kubelet anonymous auth | 1 | ☐ |
| 4.1.3 | Disable read-only port | 1 | ☐ |
| 5.1.1 | Don't use default service account | 1 | ☐ |
| 5.2.1 | Enforce Pod Security Standards | 1 | ☐ |
| 5.3.1 | Define NetworkPolicies | 1 | ☐ |

---

## Change History

| CIS Version | Date | Key Changes |
|-------------|------|-------------|
| v1.0.0 | 2024-03-15 | Initial version for Kubernetes 1.29 |

---

## Related Documents

- [[Components/K3S|K3S Component]]
- [[Benchmarks/CIS/CIS-Docker-v1.6.0|CIS Docker Benchmark]] (if applicable)
- Original PDF: [CIS WorkBench](https://workbench.cisecurity.org/)
