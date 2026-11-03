---
id: "EXT-BM-K3S-v2.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - K3S Kubernetes"
technology: "K3S"
version_range: "1.28+"
benchmark_version: "v2.0"
status: Active
last_review: 2026-02-18
next_review: 2027-02-18
owner: "Team Infrastructuur"
sources:
  - "CIS Kubernetes Benchmark v1.8"
  - "K3S Hardening Guide"
  - "NIST SP 800-190 Container Security"
  - "NSA/CISA Kubernetes Hardening Guide v1.2 (August 2022)"
recommendations_count: 36
level_1_count: 26
level_2_count: 10
created: 2026-02-11
modified: 2026-02-18
tags:
  - benchmark
  - extended
  - kubernetes
  - k3s
  - container
  - orchestration
  - nsa-cisa
---

# Extended Benchmark: K3S Kubernetes v2.0

## Benchmark Information

| Field | Value |
|-------|-------|
| **Technology** | K3S (Lightweight Kubernetes) |
| **Version Range** | 1.28+ |
| **Benchmark Version** | v2.0 |
| **Recommendations** | 36 (26 L1, 10 L2) |
| **Source** | [K3S Security](https://docs.k3s.io/security/hardening-guide) |
| **NSA-CISA Source** | [Kubernetes Hardening Guide v1.2](https://media.defense.gov/2022/Aug/29/2003066362/-1/-1/0/CTR_KUBERNETES_HARDENING_GUIDANCE_1.2_20220829.PDF) |

### Changes from v1.0

> **v2.0** adds 14 new recommendations (K3S-8.x through K3S-10.x) based on NSA/CISA Kubernetes Hardening Guide v1.2 gap analysis. These cover three domains not adequately addressed by existing CIS Kubernetes Benchmark or K3S Hardening Guide: **Container Supply Chain Security**, **Threat Model & Runtime Defense**, and **Advanced Admission Control**. Existing recommendations K3S-1.x through K3S-7.x are unchanged.

## Navigation

| ← Back | Up | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/K3S\|K3S]] |

---

## 1. API Server Security

### K3S-1.1: API Server authentication required

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3]] Data Protection |
| **NSA-CISA** | §6: Authentication & Authorization |

**Description:**
The Kubernetes API server must require authentication. Anonymous authentication must be disabled.

**Audit Procedure:**
```bash
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

### K3S-1.2: RBAC authorization enabled

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6.8 - Definieer RBAC\|CIS-6]] Access Control |
| **NSA-CISA** | §6: RBAC Authorization |

**Description:**
Role-Based Access Control (RBAC) must be enabled for all API access.

**Audit Procedure:**
```bash
kubectl api-versions | grep rbac
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
kube-apiserver-arg:
  - "authorization-mode=Node,RBAC"
```

---

### K3S-1.3: Audit logging enabled

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8]] Audit Log Management |
| **NSA-CISA** | §7: Audit Logging & Threat Detection |

**Description:**
Kubernetes audit logging must be enabled to trace API calls.

**Audit Procedure:**
```bash
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

### K3S-1.4: API Server TLS configuration

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3]] Data Protection |
| **NSA-CISA** | §5: Network Hardening (TLS) |

**Description:**
The API server must use strong TLS configuration with at minimum TLS 1.2.

**Audit Procedure:**
```bash
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

### K3S-2.1: Etcd data encryption at rest

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3]] Data Protection |
| **NSA-CISA** | §5: etcd Encryption |

**Description:**
Etcd data (secrets) must be stored encrypted.

**Audit Procedure:**
```bash
cat /etc/rancher/k3s/config.yaml | grep -i encrypt
ls -la /var/lib/rancher/k3s/server/cred/encryption-config.json
```

**Remediation:**
```yaml
# /etc/rancher/k3s/config.yaml
secrets-encryption: true
```

---

### K3S-2.2: Etcd peer communication encrypted

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3]] Data Protection |
| **NSA-CISA** | §5: etcd mTLS |

**Description:**
Communication between etcd nodes must use TLS.

**Audit Procedure:**
```bash
ls -la /var/lib/rancher/k3s/server/tls/etcd/
```

**Remediation:**
K3S configures this automatically when using embedded etcd. Verify certificates are present.

---

### K3S-2.3: Etcd access restricted

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6.6 - Stel Toegangscontrolelijsten Op\|CIS-6]] Access Control |
| **NSA-CISA** | §5: Control Plane Separation |

**Description:**
Only authorized components may access etcd.

**Audit Procedure:**
```bash
ls -la /var/lib/rancher/k3s/server/tls/etcd/
stat /var/lib/rancher/k3s/server/db/
```

**Remediation:**
```bash
chmod 700 /var/lib/rancher/k3s/server/db/
chown root:root /var/lib/rancher/k3s/server/db/
```

---

## 3. Kubelet Security

### K3S-3.1: Kubelet authentication required

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6.5 - Eis MFA voor Beheerderstoegang\|CIS-6]] Access Control |
| **NSA-CISA** | §5: Kubelet Security |

**Description:**
The kubelet must require authentication for API requests.

**Audit Procedure:**
```bash
cat /etc/rancher/k3s/config.yaml | grep -i kubelet
ps aux | grep kubelet | grep anonymous-auth
```

**Remediation:**
```yaml
kubelet-arg:
  - "anonymous-auth=false"
```

---

### K3S-3.2: Kubelet authorization mode

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6.8 - Definieer RBAC\|CIS-6]] Access Control |
| **NSA-CISA** | §5: Kubelet Webhook Authorization |

**Description:**
Kubelet must use Webhook authorization for API requests.

**Audit Procedure:**
```bash
ps aux | grep kubelet | grep authorization-mode
```

**Remediation:**
```yaml
kubelet-arg:
  - "authorization-mode=Webhook"
```

---

### K3S-3.3: Kubelet read-only port disabled

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §5: Minimize Attack Surface |

**Description:**
The kubelet read-only port (10255) must be disabled.

**Audit Procedure:**
```bash
ss -tlnp | grep 10255
```

**Remediation:**
```yaml
kubelet-arg:
  - "read-only-port=0"
```

---

### K3S-3.4: Protect kernel defaults

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Container Runtime Hardening |

**Description:**
Kubelet must protect kernel defaults against modification by containers.

**Audit Procedure:**
```bash
ps aux | grep kubelet | grep protect-kernel-defaults
```

**Remediation:**
```yaml
kubelet-arg:
  - "protect-kernel-defaults=true"
```

---

## 4. Network Security

### K3S-4.1: Network Policies enabled

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13.4 - Filter Verkeer Tussen Segmenten\|CIS-13]] Network Monitoring |
| **NSA-CISA** | §5: Network Separation & Hardening |

**Description:**
Network Policies must be used to restrict pod-to-pod traffic.

**Audit Procedure:**
```bash
kubectl get networkpolicies --all-namespaces
```

**Remediation:**
```yaml
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

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-12.2 - Stel Veilige Netwerkarchitectuur Op\|CIS-12]] Network Infrastructure |
| **NSA-CISA** | §5: Network Hardening |

**Description:**
The CNI plugin (Flannel default) must be securely configured.

**Audit Procedure:**
```bash
cat /etc/cni/net.d/*.conflist
```

**Remediation:**
```yaml
flannel-backend: wireguard-native  # Encrypted overlay
```

---

### K3S-4.3: Service mesh/mTLS for inter-pod communication

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3.10 - Versleutel Gegevens in Transport\|CIS-3]] Data Protection |
| **NSA-CISA** | §5: Encrypt All Traffic |

**Description:**
For sensitive workloads, mTLS must be used between pods.

**Audit Procedure:**
```bash
kubectl get pods -A | grep -i istio
kubectl get pods -A | grep -i linkerd
```

**Remediation:**
Implement a service mesh such as Linkerd or Istio for automatic mTLS.

---

## 5. Pod Security

### K3S-5.1: Pod Security Standards enforced

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Pod Security Enforcement |

**Description:**
Pod Security Standards must be enforced at namespace level.

**Audit Procedure:**
```bash
kubectl get ns --show-labels | grep pod-security
```

**Remediation:**
```bash
kubectl label namespace production \
  pod-security.kubernetes.io/enforce=restricted \
  pod-security.kubernetes.io/warn=restricted
```

---

### K3S-5.2: No privileged containers

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Non-root Containers |

**Description:**
Containers must not run in privileged mode unless strictly necessary.

**Audit Procedure:**
```bash
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}: {.spec.containers[*].securityContext.privileged}{"\n"}{end}' | grep true
```

**Remediation:**
```yaml
securityContext:
  privileged: false
  allowPrivilegeEscalation: false
```

---

### K3S-5.3: Read-only root filesystem

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Immutable Container Filesystems |

**Description:**
Container root filesystems must be read-only where possible.

**Audit Procedure:**
```bash
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.name}: {.spec.containers[*].securityContext.readOnlyRootFilesystem}{"\n"}{end}'
```

**Remediation:**
```yaml
securityContext:
  readOnlyRootFilesystem: true
```

---

### K3S-5.4: Non-root containers

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Non-root Containers, Rootless Engines |

**Description:**
Containers must run as non-root user.

**Audit Procedure:**
```bash
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

### K3S-6.1: Private registry with authentication

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-2.1 - Stel Software-inventaris Op\|CIS-2]] Inventory and Control |
| **NSA-CISA** | §3: Trusted Repositories |

**Description:**
Container images must come from a private registry with authentication.

**Audit Procedure:**
```bash
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

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16.4 - Stel Third-party Inventaris Op\|CIS-16]] Application Software Security |
| **NSA-CISA** | §3: Image Vulnerability Scanning |

**Description:**
Container images must be scanned for vulnerabilities before deployment.

**Audit Procedure:**
```bash
kubectl get validatingwebhookconfigurations
```

**Remediation:**
Implement Trivy, Clair, or similar image scanner in CI/CD pipeline.

---

### K3S-6.3: Image pull policy Always

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-2.2 - Zorg dat Software Ondersteund Wordt\|CIS-2]] Inventory and Control |
| **NSA-CISA** | §3: Container Build Cycle |

**Description:**
Images must always be re-pulled for production workloads.

**Audit Procedure:**
```bash
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

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3]] Data Protection |
| **NSA-CISA** | §5: Encryption at Rest |

**Description:**
Kubernetes Secrets must be stored encrypted in etcd.

**Audit Procedure:**
```bash
cat /var/lib/rancher/k3s/server/cred/encryption-config.json
```

**Remediation:**
```yaml
secrets-encryption: true
```

---

### K3S-7.2: External secrets management

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3.11 - Versleutel Gegevens in Rust\|CIS-3]] Data Protection |
| **NSA-CISA** | §5: Secrets Management |

**Description:**
Use external secrets management (Vault, OpenBAO) for sensitive data.

**Audit Procedure:**
```bash
kubectl get pods -A | grep -i vault
kubectl get pods -A | grep -i external-secrets
```

**Remediation:**
Implement External Secrets Operator with HashiCorp Vault or OpenBAO backend.

---

## 8. Container Supply Chain Security *(NEW — NSA-CISA §3)*

> These recommendations address supply chain risks identified in the NSA-CISA Kubernetes Hardening Guide §3 that are not covered by the CIS Kubernetes Benchmark. The CIS Benchmark focuses on runtime configuration; NSA-CISA additionally addresses the container build pipeline, image provenance, and supply chain integrity.

### K3S-8.1: Container image signing and verification

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-2.5 - Beheer Whitelist van Software\|CIS-2]] Software Inventory |
| **NSA-CISA** | §3: Verify Image Integrity |
| **Source Gap** | CIS Kubernetes: not addressed; NSA-CISA §3: explicitly required |

**Description:**
Container images must be cryptographically signed and verified before deployment. This prevents supply chain attacks where images are tampered with between build and deployment. NSA-CISA identifies this as a key mitigation against supply chain threats (Fig. 3).

**Audit Procedure:**
```bash
# Check for admission webhook validating signatures
kubectl get validatingwebhookconfigurations | grep -i cosign
# Check for policy engine
kubectl get clusterpolicy -A 2>/dev/null || echo "No Kyverno"
kubectl get constrainttemplate -A 2>/dev/null || echo "No Gatekeeper"
```

**Remediation:**
```bash
# Install cosign and configure signing in CI/CD
cosign generate-key-pair
cosign sign --key cosign.key registry.internal.local/app:v1.0

# Deploy admission controller to verify signatures
# Example with Kyverno:
kubectl apply -f - <<EOF
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: verify-image-signature
spec:
  validationFailureAction: Enforce
  rules:
  - name: verify-signature
    match:
      resources:
        kinds:
        - Pod
    verifyImages:
    - imageReferences:
      - "registry.internal.local/*"
      attestors:
      - entries:
        - keys:
            publicKeys: |-
              -----BEGIN PUBLIC KEY-----
              ...
              -----END PUBLIC KEY-----
EOF
```

---

### K3S-8.2: SBOM generation and tracking

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-16.4 - Stel Third-party Inventaris Op\|CIS-16]] Software Inventory |
| **NSA-CISA** | §3: Supply Chain Dependency Tracking (Fig. 3) |
| **Source Gap** | CIS Kubernetes: not addressed; NSA-CISA §3: supply chain dependencies |

**Description:**
A Software Bill of Materials (SBOM) must be generated for each container image and stored alongside the image in the registry. This enables tracking of known vulnerabilities across all deployed components.

**Audit Procedure:**
```bash
# Check if SBOMs are attached to images
cosign tree registry.internal.local/app:v1.0
# Verify SBOM exists
cosign verify-attestation --type spdxjson registry.internal.local/app:v1.0
```

**Remediation:**
```bash
# Generate SBOM in CI/CD pipeline
syft registry.internal.local/app:v1.0 -o spdx-json > sbom.json
# Attach SBOM as attestation
cosign attest --predicate sbom.json --type spdxjson registry.internal.local/app:v1.0
```

---

### K3S-8.3: Minimal base images

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.8 - Verwijder Onnodige Services\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §3: Container Build Cycle Security (Fig. 5) |
| **Source Gap** | CIS Kubernetes: runtime only; NSA-CISA §3: build pipeline hardening |

**Description:**
Container images must use minimal base images (distroless, Alpine, or scratch) to reduce attack surface. Images must not contain package managers, shells, or other unnecessary tools in production.

**Audit Procedure:**
```bash
# Check image sizes (smaller = likely more minimal)
kubectl get pods -A -o jsonpath='{range .items[*]}{.spec.containers[*].image}{"\n"}{end}' | sort -u
# Inspect base images
docker inspect --format='{{.Config.Cmd}}' <image>
```

**Remediation:**
```dockerfile
# Use multi-stage builds
FROM maven:3.9 AS build
COPY . .
RUN mvn package

FROM gcr.io/distroless/java17-debian12:nonroot
COPY --from=build /target/app.jar /app.jar
USER 1000
ENTRYPOINT ["java", "-jar", "/app.jar"]
```

---

### K3S-8.4: Build pipeline hardening

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-16.1 - Stel Veilig Ontwikkelproces Op\|CIS-16]] Application Security |
| **NSA-CISA** | §3: Container Build Cycle Security |
| **Source Gap** | CIS Kubernetes: not addressed; NSA-CISA §3: build infrastructure security |

**Description:**
The CI/CD pipeline that builds container images must itself be hardened. Build runners must be ephemeral, secrets must not be embedded in image layers, and build provenance must be recorded.

**Audit Procedure:**
```bash
# Check for secrets in image layers
docker history --no-trunc <image> | grep -i -E "secret|password|key|token"
# Check for SLSA provenance
cosign verify-attestation --type slsaprovenance registry.internal.local/app:v1.0
```

**Remediation:**
- Use ephemeral CI/CD runners (GitLab Runner with Docker executor)
- Use Docker multi-stage builds to prevent secrets leaking into final image
- Enable SLSA provenance generation in build pipeline
- Store build artifacts in authenticated, access-controlled registry

---

## 9. Kubernetes Threat Model & Runtime Defense *(NEW — NSA-CISA §2, §7)*

> These recommendations address the threat model and runtime defense gaps identified in NSA-CISA §2 (Threat Model) and §7 (Logging, Threat Detection). The CIS Kubernetes Benchmark verifies that logging is _enabled_ but does not prescribe a logging strategy, runtime monitoring, or threat model documentation. NSA-CISA provides explicit guidance on these topics.

### K3S-9.1: Documented Kubernetes threat model

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16.14 - Voer Threat Modeling Uit\|CIS-16]] Application Security |
| **NSA-CISA** | §2: Three Threat Sources (supply chain, malicious actors, insider threats) |
| **Source Gap** | CIS Kubernetes: no threat model; NSA-CISA §2: explicit three-source model |

**Description:**
A documented Kubernetes-specific threat model must exist, covering the three threat sources identified by NSA-CISA: supply chain risks, external malicious actors, and insider threats. The threat model must be reviewed annually and mapped to MITRE ATT&CK for Containers.

**Audit Procedure:**
```bash
# Verify threat model document exists and is current
# Check document management system for:
# - Kubernetes Threat Model document
# - Last review date < 12 months ago
# - Coverage of all three NSA-CISA threat vectors
```

**Remediation:**
Create a Kubernetes threat model document covering:
1. **Supply chain threats**: Compromised images, malicious dependencies, tampered registries
2. **External actors**: Exploits targeting exposed services, API server attacks, container escapes
3. **Insider threats**: Privileged administrator misuse, compromised service accounts, lateral movement
4. Map each threat to MITRE ATT&CK for Containers techniques
5. Document mitigating controls for each threat

---

### K3S-9.2: Multi-level logging strategy

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8.2 - Verzamel Auditlogs\|CIS-8]] Audit Log Management |
| **NSA-CISA** | §7: Multi-Level Logging (host, application, cloud) |
| **Source Gap** | CIS Kubernetes: checks if logging is enabled; NSA-CISA §7: holistic logging strategy |

**Description:**
A comprehensive logging strategy must cover all three levels described by NSA-CISA: host-level logs (OS, kubelet), application-level logs (container stdout/stderr, application-specific), and cloud/infrastructure-level logs (API server, network). Logs must be aggregated to an external SIEM.

**Audit Procedure:**
```bash
# Check host-level logging
journalctl -u k3s --no-pager | tail -5
# Check API server audit logging
ls -la /var/log/k3s/audit/
# Check log aggregation
kubectl get pods -A | grep -E "fluentd|fluent-bit|filebeat|vector"
# Check SIEM forwarding
kubectl get configmap -n logging fluentd-config -o yaml 2>/dev/null
```

**Remediation:**
```yaml
# Deploy Fluent Bit as DaemonSet for log collection
apiVersion: v1
kind: ConfigMap
metadata:
  name: fluent-bit-config
data:
  fluent-bit.conf: |
    [INPUT]
        Name              tail
        Path              /var/log/k3s/audit/audit.log
        Tag               k8s.audit
    [INPUT]
        Name              tail
        Path              /var/log/containers/*.log
        Tag               k8s.container
    [OUTPUT]
        Name              forward
        Match             *
        Host              siem.internal.local
        Port              24224
```

---

### K3S-9.3: Runtime threat detection

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-13.2 - Implementeer Host-based IDS\|CIS-13]] Network Monitoring |
| **NSA-CISA** | §7: Runtime Monitoring & Anomaly Detection |
| **Source Gap** | CIS Kubernetes: limited to network IDS; NSA-CISA §7: container runtime security |

**Description:**
Runtime threat detection must be deployed to detect anomalous container behavior including unexpected process execution, file system modifications, network connections, and privilege escalation attempts. NSA-CISA recommends deploying scanners as admission controllers and runtime monitors.

**Audit Procedure:**
```bash
# Check for runtime security tools
kubectl get pods -A | grep -E "falco|kubescape|tetragon|tracee"
# Check for runtime policies
kubectl get runtimeclasses
```

**Remediation:**
```bash
# Option 1: Kubescape operator with runtime detection
helm repo add kubescape https://kubescape.github.io/helm-charts/
helm install kubescape kubescape/kubescape-operator -n kubescape --create-namespace

# Option 2: Falco for syscall-based detection
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm install falco falcosecurity/falco -n falco --create-namespace
```

---

### K3S-9.4: Service account token protection

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5.4 - Beperk Beheerdersrechten\|CIS-5]] Account Management |
| **NSA-CISA** | §4: Protecting Pod Service Account Tokens |
| **Source Gap** | CIS Kubernetes: mentions SA in policies section; NSA-CISA §4: dedicated guidance |

**Description:**
Service account tokens must not be automatically mounted into pods unless explicitly required. Tokens that are mounted must use bound tokens with audience restriction and short expiry. This prevents lateral movement from compromised pods.

**Audit Procedure:**
```bash
# Find pods with automounted service account tokens
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}: automount={.spec.automountServiceAccountToken}{"\n"}{end}'
# Check for legacy (non-bound) tokens
kubectl get secrets -A -o jsonpath='{range .items[?(@.type=="kubernetes.io/service-account-token")]}{.metadata.namespace}/{.metadata.name}{"\n"}{end}'
```

**Remediation:**
```yaml
# Disable automount on service account
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app-sa
automountServiceAccountToken: false

# When token IS needed, use projected volume with short expiry
spec:
  volumes:
  - name: sa-token
    projected:
      sources:
      - serviceAccountToken:
          path: token
          expirationSeconds: 3600
          audience: api
```

---

### K3S-9.5: Kubernetes security benchmarking automation

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4-7: Continuous Compliance Validation |
| **Source Gap** | CIS Kubernetes: manual checks; NSA-CISA: recommends automated tooling |

**Description:**
Automated security benchmark scans must run on a scheduled basis against both the CIS Kubernetes Benchmark and the NSA-CISA Kubernetes Hardening Guide frameworks. Results must be tracked and deviations must trigger alerts.

**Audit Procedure:**
```bash
# Check for Kubescape operator
kubectl get pods -n kubescape
# Check for scheduled scans
kubectl get cronjobs -A | grep -E "kubescape|kube-bench"
# Review latest scan results
kubescape scan framework nsa --format json 2>/dev/null | jq '.summaryDetails.complianceScore'
```

**Remediation:**
```bash
# Install Kubescape with scheduled scanning
kubescape scan framework nsa,cis-v1.23 --submit --account <cluster-id>
# Or deploy as CronJob
kubectl apply -f - <<EOF
apiVersion: batch/v1
kind: CronJob
metadata:
  name: kubescape-scan
  namespace: kubescape
spec:
  schedule: "0 2 * * 0"  # Weekly Sunday 02:00
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: kubescape
            image: quay.io/kubescape/kubescape-cli:latest
            command: ["kubescape", "scan", "framework", "nsa,cis-v1.23", "--format", "json", "--output", "/results/scan.json"]
          restartPolicy: OnFailure
EOF
```

---

### K3S-9.6: Insider threat mitigation through RBAC review

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6.7 - Review Gebruikersrechten\|CIS-6]] Access Control |
| **NSA-CISA** | §2: Insider Threats; §6: Least Privilege RBAC |
| **Source Gap** | CIS Kubernetes: checks RBAC config; NSA-CISA §2: insider threat as explicit domain |

**Description:**
Kubernetes RBAC configurations must be reviewed quarterly to enforce least privilege. No user accounts may hold cluster-admin role. Administrative actions must be separated between infrastructure administrators and application administrators. All kubectl admin sessions must be logged.

**Audit Procedure:**
```bash
# Find cluster-admin bindings
kubectl get clusterrolebindings -o jsonpath='{range .items[?(@.roleRef.name=="cluster-admin")]}{.metadata.name}: {.subjects[*].name}{"\n"}{end}'
# Review role permissions
kubectl auth can-i --list --as=<user>
# Check for overprivileged service accounts
kubectl get rolebindings,clusterrolebindings -A -o wide
```

**Remediation:**
- Remove cluster-admin from all user accounts; use scoped roles instead
- Create separate roles: `infra-admin` (node/namespace management) and `app-admin` (deployment/service management)
- Enable kubectl audit proxy or CyberArk session recording for admin sessions
- Schedule quarterly RBAC review in compliance calendar

---

## 10. Advanced Admission Control *(NEW — NSA-CISA §4)*

> NSA-CISA §4 recommends admission controllers as a key enforcement mechanism. The CIS Kubernetes Benchmark checks basic pod security but does not prescribe policy-as-code enforcement. These recommendations fill that gap.

### K3S-10.1: Policy-as-code admission controller

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Admission Controller Enforcement |
| **Source Gap** | CIS Kubernetes: checks PSA only; NSA-CISA §4: recommends admission controllers broadly |

**Description:**
A policy-as-code admission controller (Kyverno, OPA/Gatekeeper, or equivalent) must be deployed to enforce security policies beyond Pod Security Standards. Policies must cover image sources, resource limits, labels, and security contexts.

**Audit Procedure:**
```bash
# Check for policy engines
kubectl get pods -A | grep -E "kyverno|gatekeeper|opa"
# List active policies
kubectl get clusterpolicy -A 2>/dev/null
kubectl get constrainttemplate -A 2>/dev/null
```

**Remediation:**
```bash
# Install Kyverno
helm repo add kyverno https://kyverno.github.io/kyverno/
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
# Apply baseline policies
kubectl apply -f https://raw.githubusercontent.com/kyverno/policies/main/best-practices/
```

---

### K3S-10.2: Resource limits enforcement

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4.1 - Stel Veilig Configuratieproces Op\|CIS-4]] Secure Configuration |
| **NSA-CISA** | §4: Hardening Container Environments |
| **Source Gap** | CIS Kubernetes: not checked; NSA-CISA §4: resource limits recommended |

**Description:**
All pods must define CPU and memory resource requests and limits. LimitRange and ResourceQuota must be configured on all namespaces to prevent resource exhaustion attacks (denial-of-service through resource starvation).

**Audit Procedure:**
```bash
# Find pods without resource limits
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}: limits={.spec.containers[*].resources.limits}{"\n"}{end}' | grep 'limits=$'
# Check namespace quotas
kubectl get resourcequota -A
kubectl get limitrange -A
```

**Remediation:**
```yaml
# LimitRange per namespace
apiVersion: v1
kind: LimitRange
metadata:
  name: default-limits
spec:
  limits:
  - default:
      cpu: "500m"
      memory: "512Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"
    type: Container
---
# ResourceQuota per namespace
apiVersion: v1
kind: ResourceQuota
metadata:
  name: namespace-quota
spec:
  hard:
    requests.cpu: "4"
    requests.memory: "8Gi"
    limits.cpu: "8"
    limits.memory: "16Gi"
    pods: "20"
```

---

### K3S-10.3: Default deny egress network policy

| Property | Value |
|----------|-------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13.4 - Filter Verkeer Tussen Segmenten\|CIS-13]] Network Monitoring |
| **NSA-CISA** | §5: Network Separation, Default Deny |
| **Source Gap** | K3S-4.1 covers ingress deny only; NSA-CISA §5: both directions |

**Description:**
Default deny network policies must be applied for both ingress AND egress traffic in all namespaces. Explicit allow rules must be defined per workload. This limits the blast radius of a compromised container by preventing lateral movement and data exfiltration.

**Audit Procedure:**
```bash
# Check for egress policies
kubectl get networkpolicies -A -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}: policyTypes={.spec.policyTypes[*]}{"\n"}{end}'
# Verify both Ingress and Egress are covered
```

**Remediation:**
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
---
# Then allow specific traffic per workload
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-app-to-db
spec:
  podSelector:
    matchLabels:
      app: backend
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: postgresql
    ports:
    - port: 5432
```

---

### K3S-10.4: Blast radius limitation through namespace isolation

| Property | Value |
|----------|-------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-12.2 - Stel Veilige Netwerkarchitectuur Op\|CIS-12]] Network Architecture |
| **NSA-CISA** | §4: Blast Radius Limitation; §5: Control Plane Isolation |
| **Source Gap** | CIS Kubernetes: basic namespace checks; NSA-CISA: architectural isolation |

**Description:**
Workloads must be isolated in dedicated namespaces with enforced boundaries. Critical infrastructure (ingress controllers, monitoring, security tooling) must run in separate namespaces from application workloads. Namespace-level RBAC, network policies, and resource quotas must be enforced.

**Audit Procedure:**
```bash
# Review namespace structure
kubectl get ns --show-labels
# Check for workloads in default namespace
kubectl get pods -n default
# Verify namespace RBAC isolation
kubectl get rolebindings -A -o wide | grep -v system
```

**Remediation:**
```bash
# Create isolated namespaces per concern
kubectl create namespace xena-production
kubectl create namespace xena-staging
kubectl create namespace monitoring
kubectl create namespace ingress
kubectl create namespace security-tooling

# Apply labels for PSA and network policy targeting
kubectl label namespace xena-production \
  pod-security.kubernetes.io/enforce=restricted \
  environment=production \
  team=xena

# Ensure no application pods in default namespace
kubectl get pods -n default  # Should be empty
```

---

## Summary per Domain

| Domain | L1 | L2 | Total | Source |
|--------|----|----|-------|--------|
| 1. API Server | 4 | 0 | 4 | CIS + NSA-CISA §5,6 |
| 2. Etcd | 2 | 1 | 3 | CIS + NSA-CISA §5 |
| 3. Kubelet | 3 | 1 | 4 | CIS + NSA-CISA §5 |
| 4. Network | 2 | 1 | 3 | CIS + NSA-CISA §5 |
| 5. Pod Security | 3 | 1 | 4 | CIS + NSA-CISA §4 |
| 6. Image Security | 2 | 1 | 3 | CIS + NSA-CISA §3 |
| 7. Secrets | 1 | 1 | 2 | CIS + NSA-CISA §5 |
| **8. Supply Chain** *(NEW)* | **2** | **2** | **4** | **NSA-CISA §3** |
| **9. Threat Model & Runtime** *(NEW)* | **4** | **2** | **6** | **NSA-CISA §2, §7** |
| **10. Admission Control** *(NEW)* | **3** | **1** | **4** | **NSA-CISA §4, §5** |
| **Total** | **26** | **10** | **36** | |

---

## NSA-CISA Coverage Matrix

| NSA-CISA Section | Recommendations | Coverage |
|------------------|-----------------|----------|
| §2: Threat Model | K3S-9.1, K3S-9.6 | ✅ Full |
| §3: Supply Chain | K3S-6.1, K3S-6.2, K3S-8.1, K3S-8.2, K3S-8.3, K3S-8.4 | ✅ Full |
| §4: Pod Security | K3S-5.1–5.4, K3S-9.4, K3S-10.1, K3S-10.2, K3S-10.4 | ✅ Full |
| §5: Network Hardening | K3S-1.4, K3S-2.1–2.3, K3S-3.1–3.3, K3S-4.1–4.3, K3S-10.3 | ✅ Full |
| §6: Auth & Authorization | K3S-1.1, K3S-1.2, K3S-9.6 | ✅ Full |
| §7: Logging & Threat Detection | K3S-1.3, K3S-9.2, K3S-9.3, K3S-9.5 | ✅ Full |

---

## References

- [K3S Hardening Guide](https://docs.k3s.io/security/hardening-guide)
- [CIS Kubernetes Benchmark](https://www.cisecurity.org/benchmark/kubernetes)
- [NSA/CISA Kubernetes Hardening Guide v1.2 (August 2022)](https://media.defense.gov/2022/Aug/29/2003066362/-1/-1/0/CTR_KUBERNETES_HARDENING_GUIDANCE_1.2_20220829.PDF)
- [NIST SP 800-190](https://csrc.nist.gov/publications/detail/sp/800-190/final)
- [MITRE ATT&CK for Containers](https://attack.mitre.org/matrices/enterprise/containers/)
- [Kubescape Frameworks (regolibrary)](https://github.com/kubescape/regolibrary)
