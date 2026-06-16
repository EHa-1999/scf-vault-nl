---
id: "EXT-BM-K3S-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - K3S Kubernetes"
technology: "K3S"
version_range: "1.28+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-11
next_review: 2027-02-11
owner: "Team Infrastructuur"
sources:
  - "CIS Kubernetes Benchmark v1.8"
  - "K3S Hardening Guide"
  - "NIST SP 800-190 Container Security"
  - "NSA/CISA Kubernetes Hardening Guide"
recommendations_count: 22
level_1_count: 17
level_2_count: 5
created: 2026-02-11
modified: 2026-02-11
tags:
  - benchmark
  - extended
  - kubernetes
  - k3s
  - container
  - orchestration
---

# Extended Benchmark: K3S Kubernetes v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | K3S (Lightweight Kubernetes) |
| **Versie Range** | 1.28+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 22 (17 L1, 5 L2) |
| **Bron** | [K3S Security](https://docs.k3s.io/security/hardening-guide) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/K3S\|K3S]] |

---

## 1. API Server Security

### K3S-1.1: API Server authenticatie verplicht

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
De Kubernetes API server moet authenticatie vereisen. Anonymous authentication moet uitgeschakeld zijn.

**Audit Procedure:**
```bash
# Check API server configuratie
cat /etc/rancher/k3s/config.yaml | grep -i anonymous
ps aux | grep k3s | grep anonymous-auth
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kube-apiserver-arg:
  - "anonymous-auth=false"
```

---

### K3S-1.2: RBAC authorization ingeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Role-Based Access Control (RBAC) moet ingeschakeld zijn voor alle API toegang.

**Audit Procedure:**
```bash
# Verify RBAC is enabled (default in K3S)
kubectl api-versions | grep rbac
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kube-apiserver-arg:
  - "authorization-mode=Node,RBAC"
```

---

### K3S-1.3: Audit logging ingeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Kubernetes audit logging moet ingeschakeld zijn om API calls te traceren.

**Audit Procedure:**
```bash
# Check audit log configuratie
cat /etc/rancher/k3s/config.yaml | grep -i audit
ls -la /var/log/k3s/audit/
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kube-apiserver-arg:
  - "audit-log-path=/var/log/k3s/audit/audit.log"
  - "audit-log-maxage=30"
  - "audit-log-maxbackup=10"
  - "audit-log-maxsize=100"
```

---

### K3S-1.4: API Server TLS configuratie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
De API server moet sterke TLS configuratie gebruiken met minimaal TLS 1.2.

**Audit Procedure:**
```bash
# Check TLS versie
openssl s_client -connect localhost:6443 -tls1_2 < /dev/null
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kube-apiserver-arg:
  - "tls-min-version=VersionTLS12"
  - "tls-cipher-suites=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"
```

---

## 2. Etcd Security

### K3S-2.1: Etcd data encryptie at rest

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Etcd data (secrets) moet versleuteld worden opgeslagen.

**Audit Procedure:**
```bash
# Check encryption configuratie
cat /etc/rancher/k3s/config.yaml | grep -i encrypt
ls -la /var/lib/rancher/k3s/server/cred/encryption-config.json
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
secrets-encryption: true
```

---

### K3S-2.2: Etcd peer communicatie encrypted

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Communicatie tussen etcd nodes moet via TLS verlopen.

**Audit Procedure:**
```bash
# K3S embedded etcd uses TLS by default
# Verify certificates exist
ls -la /var/lib/rancher/k3s/server/tls/etcd/
```

**Remediation:**
K3S configureert dit automatisch bij gebruik van embedded etcd. Verify certificates zijn aanwezig.

---

### K3S-2.3: Etcd toegang beperkt

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Alleen geautoriseerde componenten mogen toegang hebben tot etcd.

**Audit Procedure:**
```bash
# Check etcd client certificates
ls -la /var/lib/rancher/k3s/server/tls/etcd/
# Verify file permissions
stat /var/lib/rancher/k3s/server/db/
```

**Remediation:**
```bash
# Restrict etcd directory permissions
chmod 700 /var/lib/rancher/k3s/server/db/
chown root:root /var/lib/rancher/k3s/server/db/
```

---

## 3. Kubelet Security

### K3S-3.1: Kubelet authentication vereist

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
De kubelet moet authenticatie vereisen voor API requests.

**Audit Procedure:**
```bash
# Check kubelet configuratie
cat /etc/rancher/k3s/config.yaml | grep -i kubelet
ps aux | grep kubelet | grep anonymous-auth
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kubelet-arg:
  - "anonymous-auth=false"
```

---

### K3S-3.2: Kubelet authorization mode

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Kubelet moet Webhook authorization gebruiken voor API requests.

**Audit Procedure:**
```bash
ps aux | grep kubelet | grep authorization-mode
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kubelet-arg:
  - "authorization-mode=Webhook"
```

---

### K3S-3.3: Kubelet read-only port disabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
De kubelet read-only port (10255) moet uitgeschakeld zijn.

**Audit Procedure:**
```bash
# Check of port 10255 luistert
ss -tlnp | grep 10255
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kubelet-arg:
  - "read-only-port=0"
```

---

### K3S-3.4: Protect kernel defaults

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Kubelet moet kernel defaults beschermen tegen wijzigingen door containers.

**Audit Procedure:**
```bash
ps aux | grep kubelet | grep protect-kernel-defaults
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kubelet-arg:
  - "protect-kernel-defaults=true"
```

---

## 4. Network Security

### K3S-4.1: Network Policies ingeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Network Policies moeten gebruikt worden om pod-to-pod verkeer te beperken.

**Audit Procedure:**
```bash
# Check for network policies
kubectl get networkpolicies --all-namespaces
```

**Remediation:**
```yaml
# Default deny ingress policy
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-ingress
spec:
  podSelector: {}
  policyTypes:
  - Ingress
```

---

### K3S-4.2: CNI plugin secured

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-12\|CIS-12]] Network Infrastructure |

**Beschrijving:**
De CNI plugin (Flannel default) moet secure geconfigureerd zijn.

**Audit Procedure:**
```bash
# Check CNI configuratie
cat /etc/cni/net.d/*.conflist
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
flannel-backend: wireguard-native  # Encrypted overlay
```

---

### K3S-4.3: Service mesh/mTLS voor inter-pod communicatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Voor gevoelige workloads moet mTLS gebruikt worden tussen pods.

**Audit Procedure:**
```bash
# Check for service mesh
kubectl get pods -A | grep -i istio
kubectl get pods -A | grep -i linkerd
```

**Remediation:**
Implementeer een service mesh zoals Linkerd of Istio voor automatische mTLS.

---

## 5. Pod Security

### K3S-5.1: Pod Security Standards enforced

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Pod Security Standards moeten afgedwongen worden op namespace niveau.

**Audit Procedure:**
```bash
# Check namespace labels
kubectl get ns --show-labels | grep pod-security
```

**Remediation:**
```bash
# Label namespaces voor restricted mode
kubectl label namespace production \
  pod-security.kubernetes.io/enforce=restricted \
  pod-security.kubernetes.io/warn=restricted
```

---

### K3S-5.2: Geen privileged containers

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Containers mogen niet in privileged mode draaien tenzij strikt noodzakelijk.

**Audit Procedure:**
```bash
# Find privileged containers
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}: {.spec.containers[*].securityContext.privileged}{"\n"}{end}' | grep true
```

**Remediation:**
```yaml
# In pod spec
securityContext:
  privileged: false
  allowPrivilegeEscalation: false
```

---

### K3S-5.3: Read-only root filesystem

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Container root filesystems moeten read-only zijn waar mogelijk.

**Audit Procedure:**
```bash
# Check containers for readOnlyRootFilesystem
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.name}: {.spec.containers[*].securityContext.readOnlyRootFilesystem}{"\n"}{end}'
```

**Remediation:**
```yaml
securityContext:
  readOnlyRootFilesystem: true
```

---

### K3S-5.4: Non-root containers

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Containers moeten als non-root user draaien.

**Audit Procedure:**
```bash
# Check for root containers
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.name}: {.spec.securityContext.runAsNonRoot}{"\n"}{end}'
```

**Remediation:**
```yaml
securityContext:
  runAsNonRoot: true
  runAsUser: 1000
```

---

## 6. Image Security

### K3S-6.1: Private registry met authenticatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-2\|CIS-2]] Inventory and Control |

**Beschrijving:**
Container images moeten van een private registry komen met authenticatie.

**Audit Procedure:**
```bash
# Check registry configuratie
cat /etc/rancher/k3s/registries.yaml
```

**Remediation:**
```yaml
# /etc/rancher/k3s/registries.yaml
mirrors:
  docker.io:
    endpoint:
      - "https://registry.internal.local"
configs:
  "registry.internal.local":
    auth:
      username: admin
      password: secret
```

---

### K3S-6.2: Image scanning enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16\|CIS-16]] Application Software Security |

**Beschrijving:**
Container images moeten gescand worden op vulnerabilities voor deployment.

**Audit Procedure:**
```bash
# Check for admission controller
kubectl get validatingwebhookconfigurations
```

**Remediation:**
Implementeer Trivy, Clair of vergelijkbare image scanner in CI/CD pipeline.

---

### K3S-6.3: Image pull policy Always

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-2\|CIS-2]] Inventory and Control |

**Beschrijving:**
Images moeten altijd opnieuw gepulled worden voor productie workloads.

**Audit Procedure:**
```bash
# Check image pull policies
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.name}: {.spec.containers[*].imagePullPolicy}{"\n"}{end}'
```

**Remediation:**
```yaml
spec:
  containers:
  - name: app
    imagePullPolicy: Always
```

---

## 7. Secrets Management

### K3S-7.1: Secrets encrypted at rest

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Kubernetes Secrets moeten versleuteld opgeslagen worden in etcd.

**Audit Procedure:**
```bash
# Check encryption status
cat /var/lib/rancher/k3s/server/cred/encryption-config.json
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
secrets-encryption: true
```

---

### K3S-7.2: External secrets management

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Gebruik external secrets management (Vault, OpenBAO) voor gevoelige data.

**Audit Procedure:**
```bash
# Check for external secrets operator
kubectl get pods -A | grep -i vault
kubectl get pods -A | grep -i external-secrets
```

**Remediation:**
Implementeer External Secrets Operator met HashiCorp Vault of OpenBAO backend.

---

## Samenvatting per Domein

| Domein | L1 | L2 | Totaal |
|--------|----|----|--------|
| 1. API Server | 4 | 0 | 4 |
| 2. Etcd | 2 | 1 | 3 |
| 3. Kubelet | 3 | 1 | 4 |
| 4. Network | 2 | 1 | 3 |
| 5. Pod Security | 3 | 1 | 4 |
| 6. Image Security | 2 | 1 | 3 |
| 7. Secrets | 1 | 1 | 2 |
| **Totaal** | **17** | **5** | **22** |

---

## Referenties

- [K3S Hardening Guide](https://docs.k3s.io/security/hardening-guide)
- [CIS Kubernetes Benchmark](https://www.cisecurity.org/benchmark/kubernetes)
- [NSA/CISA Kubernetes Hardening Guide](https://media.defense.gov/2022/Aug/29/2003066362/-1/-1/0/CTR_KUBERNETES_HARDENING_GUIDANCE_1.2_20220829.PDF)
- [NIST SP 800-190](https://csrc.nist.gov/publications/detail/sp/800-190/final)
