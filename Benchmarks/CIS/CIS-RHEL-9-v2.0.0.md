---
id: "CIS-RHEL-9-v2.0.0"
type: benchmark
benchmark_type: "CIS"
name: "CIS Red Hat Enterprise Linux 9 Benchmark"
technology: "RHEL"
technology_version: "9"
benchmark_version: "2.0.0"
cis_release_date: 2024-06-24
cis_download_url: "https://workbench.cisecurity.org/"
applies_to:
  - "[[Components/RHEL]]"
status: Active
recommendations_count: 255
created: 2026-01-30
modified: 2026-01-30
tags:
  - benchmark
  - cis
  - rhel
  - linux
  - operating-system
---

# CIS Red Hat Enterprise Linux 9 Benchmark v2.0.0

## Benchmark Information

| Field | Value |
|-------|-------|
| **Technology** | Red Hat Enterprise Linux 9 |
| **Benchmark Version** | v2.0.0 |
| **CIS Release Date** | 2024-06-24 |
| **Status** | Active |
| **Recommendations** | 255 |
| **Download** | [CIS WorkBench](https://workbench.cisecurity.org/) |

## Navigation

| ← Back | Up | Component |
|--------|-----|-----------|
| [[Benchmarks/CIS/_index\|📘 CIS Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/RHEL]] |

---

## Scope

### Applies To

- Red Hat Enterprise Linux 9.x
- Both server and workstation deployments
- Physical and virtual machines
- Cloud instances (self-managed)

### Also Applies To (Derivatives)

- AlmaLinux 9
- Rocky Linux 9
- Oracle Linux 9
- CentOS Stream 9

### Does Not Apply To

- RHEL 8 or earlier (separate benchmark)
- Managed cloud instances with vendor hardening
- Container images (use container-specific benchmarks)

---

## Profile Definitions

| Profile | Description | Use Case |
|---------|-------------|----------|
| **Level 1 - Server** | Basic security, minimal impact | Production servers |
| **Level 2 - Server** | Defense-in-depth, may impact functionality | High-security servers |
| **Level 1 - Workstation** | Basic security for desktops | Standard workstations |
| **Level 2 - Workstation** | Enhanced security for desktops | Sensitive workstations |

### Our Choice

| Environment | Profile |
|-------------|---------|
| XENA Servers | ✅ Level 1 Server + selected Level 2 |
| K3S Nodes | ✅ Level 1 Server |
| Admin Workstations | ⚠️ Level 1 Workstation |

---

## Recommendations Overview

| Section | Topic | # Recs | L1 Server | L2 Server |
|---------|-------|--------|-----------|-----------|
| 1 | Initial Setup | 45 | 38 | 7 |
| 2 | Services | 22 | 20 | 2 |
| 3 | Network Configuration | 35 | 30 | 5 |
| 4 | Access, Authentication, Authorization | 55 | 45 | 10 |
| 5 | Logging and Auditing | 50 | 42 | 8 |
| 6 | System Maintenance | 25 | 22 | 3 |
| 7 | System File Permissions | 23 | 20 | 3 |
| **Total** | | **255** | **217** | **38** |

> **Note:** This document contains **key recommendations** with detailed audit and remediation steps. For the complete list of all 255 recommendations, see the [[#Complete Recommendations Checklist|Complete Checklist]] section below or download the official CIS Benchmark PDF.

---

## Key Recommendations

The following sections contain selected key recommendations with full technical details. This is **not exhaustive** - see the Complete Checklist for all recommendations.

---

## 1. Initial Setup

### 1.1 Filesystem Configuration

#### 1.1.1.1 Ensure mounting of cramfs is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Description:**
The cramfs filesystem type is a compressed read-only Linux filesystem. Disabling unused filesystems reduces the attack surface.

**Audit:**
```bash
# Check if module is loadable
modprobe -n -v cramfs | grep -E '(cramfs|install)'

# Check if module is loaded
lsmod | grep cramfs

# Check if module is deny listed
grep -E "^blacklist\s+cramfs" /etc/modprobe.d/*.conf
```

**Expected:**
```
install /bin/false
(no output from lsmod)
blacklist cramfs
```

**Remediation:**
```bash
# Create config file
cat << 'EOF' > /etc/modprobe.d/cramfs.conf
install cramfs /bin/false
blacklist cramfs
EOF

# Unload module if loaded
modprobe -r cramfs 2>/dev/null || true
```

---

#### 1.1.1.2 Ensure mounting of squashfs is disabled (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Note:** squashfs is used by snap packages. Only disable if snap is not required.

**Audit:**
```bash
modprobe -n -v squashfs | grep -E '(squashfs|install)'
lsmod | grep squashfs
```

**Remediation:**
```bash
cat << 'EOF' > /etc/modprobe.d/squashfs.conf
install squashfs /bin/false
blacklist squashfs
EOF
```

---

#### 1.1.2.1 Ensure /tmp is a separate partition (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Description:**
The /tmp directory is a world-writable directory. Making it a separate partition limits the impact of resource exhaustion attacks.

**Audit:**
```bash
findmnt --kernel /tmp

# Expected output showing /tmp as separate mount
```

**Remediation:**
```bash
# Option 1: systemd tmp.mount
systemctl unmask tmp.mount
systemctl enable --now tmp.mount

# Option 2: /etc/fstab entry
# Add line to /etc/fstab:
# tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime,size=2G 0 0
```

---

#### 1.1.2.2 Ensure nodev option set on /tmp partition (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Audit:**
```bash
findmnt --kernel /tmp | grep nodev
```

**Remediation:**
```bash
# Edit /etc/fstab to add nodev option
# Or for systemd:
cat << 'EOF' > /etc/systemd/system/tmp.mount.d/options.conf
[Mount]
Options=mode=1777,strictatime,noexec,nodev,nosuid
EOF
systemctl daemon-reload
systemctl restart tmp.mount
```

---

### 1.2 Configure Software Updates

#### 1.2.1 Ensure GPG keys are configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-7.4\|CIS-7.4]] |

**Description:**
GPG keys ensure packages are from trusted sources.

**Audit:**
```bash
rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n'
```

**Remediation:**
```bash
# Import Red Hat GPG key
rpm --import https://www.redhat.com/security/data/fd431d51.txt
```

---

#### 1.2.2 Ensure gpgcheck is globally activated (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-7.4\|CIS-7.4]] |

**Audit:**
```bash
grep ^gpgcheck /etc/dnf/dnf.conf
grep -r ^gpgcheck /etc/yum.repos.d/
```

**Expected:** `gpgcheck=1` in all files

**Remediation:**
```bash
sed -i 's/^gpgcheck\s*=.*/gpgcheck=1/' /etc/dnf/dnf.conf
```

---

### 1.3 Filesystem Integrity Checking

#### 1.3.1 Ensure AIDE is installed (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-3.14\|CIS-3.14]] |

**Description:**
AIDE (Advanced Intrusion Detection Environment) takes a snapshot of filesystem state and can detect unauthorized changes.

**Audit:**
```bash
rpm -q aide
```

**Remediation:**
```bash
dnf install aide

# Initialize AIDE database
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
```

---

#### 1.3.2 Ensure filesystem integrity is regularly checked (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-3.14\|CIS-3.14]] |

**Audit:**
```bash
systemctl is-enabled aidecheck.timer
# Or check crontab
grep -r aide /etc/cron.* /var/spool/cron/
```

**Remediation:**
```bash
# Create systemd timer
cat << 'EOF' > /etc/systemd/system/aidecheck.service
[Unit]
Description=AIDE Check

[Service]
Type=simple
ExecStart=/usr/sbin/aide --check
EOF

cat << 'EOF' > /etc/systemd/system/aidecheck.timer
[Unit]
Description=Daily AIDE check

[Timer]
OnCalendar=daily
AccuracySec=1h

[Install]
WantedBy=timers.target
EOF

systemctl daemon-reload
systemctl enable --now aidecheck.timer
```

---

### 1.4 Secure Boot Settings

#### 1.4.1 Ensure bootloader password is set (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Description:**
Setting a bootloader password prevents unauthorized users from changing boot parameters.

**Audit:**
```bash
grep "^GRUB2_PASSWORD" /boot/grub2/user.cfg
```

**Remediation:**
```bash
# Generate password hash
grub2-setpassword

# Verify
cat /boot/grub2/user.cfg
```

---

## 2. Services

### 2.1 Time Synchronization

#### 2.1.1 Ensure time synchronization is in use (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.4\|CIS-8.4]] |

**Description:**
Accurate time is critical for log correlation and security analysis.

**Audit:**
```bash
systemctl is-enabled chronyd
```

**Remediation:**
```bash
dnf install chrony
systemctl enable --now chronyd
```

---

#### 2.1.2 Ensure chrony is configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.4\|CIS-8.4]] |

**Audit:**
```bash
grep -E "^(server|pool)" /etc/chrony.conf
```

**Remediation:**
```bash
# Edit /etc/chrony.conf
cat << 'EOF' > /etc/chrony.conf
pool nl.pool.ntp.org iburst
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
EOF

systemctl restart chronyd
```

---

### 2.2 Special Purpose Services

#### 2.2.1 Ensure X Window System is not installed (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Audit:**
```bash
rpm -qa xorg-x11-server*
```

**Remediation:**
```bash
dnf remove xorg-x11-server*
```

---

#### 2.2.2 Ensure Avahi Server is not installed (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Audit:**
```bash
rpm -q avahi
systemctl is-enabled avahi-daemon
```

**Remediation:**
```bash
systemctl stop avahi-daemon
dnf remove avahi
```

---

#### 2.2.3 Ensure CUPS is not installed (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Note:** Only remove if printing is not required.

**Remediation:**
```bash
dnf remove cups
```

---

## 3. Network Configuration

### 3.1 Disable Unused Network Protocols

#### 3.1.1 Ensure IPv6 is disabled if not needed (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.8\|CIS-4.8]] |

**Audit:**
```bash
sysctl net.ipv6.conf.all.disable_ipv6
sysctl net.ipv6.conf.default.disable_ipv6
```

**Remediation:**
```bash
cat << 'EOF' >> /etc/sysctl.d/60-disable-ipv6.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
EOF

sysctl --system
```

---

### 3.2 Network Parameters (Host Only)

#### 3.2.1 Ensure IP forwarding is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Note:** Do not disable on routers or K8s nodes that need forwarding.

**Audit:**
```bash
sysctl net.ipv4.ip_forward
sysctl net.ipv6.conf.all.forwarding
```

**Expected:** Both should be 0 (unless routing is required)

---

#### 3.2.2 Ensure packet redirect sending is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Audit:**
```bash
sysctl net.ipv4.conf.all.send_redirects
sysctl net.ipv4.conf.default.send_redirects
```

**Remediation:**
```bash
cat << 'EOF' >> /etc/sysctl.d/60-network-hardening.conf
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
EOF

sysctl --system
```

---

### 3.3 Firewall Configuration

#### 3.3.1 Ensure firewalld is installed (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Audit:**
```bash
rpm -q firewalld
```

**Remediation:**
```bash
dnf install firewalld
systemctl enable --now firewalld
```

---

#### 3.3.2 Ensure firewalld service is enabled and running (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Audit:**
```bash
systemctl is-enabled firewalld
systemctl is-active firewalld
```

---

#### 3.3.3 Ensure firewalld default zone is set (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.4\|CIS-4.4]] |

**Audit:**
```bash
firewall-cmd --get-default-zone
```

**Remediation:**
```bash
firewall-cmd --set-default-zone=drop
```

---

## 4. Access, Authentication and Authorization

### 4.1 Configure PAM

#### 4.1.1 Ensure password creation requirements are configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-5.2\|CIS-5.2]] |

**Description:**
Strong passwords should be enforced via PAM.

**Audit:**
```bash
grep pam_pwquality /etc/pam.d/system-auth
grep -E "^(minlen|minclass|dcredit|ucredit|ocredit|lcredit)" /etc/security/pwquality.conf
```

**Remediation:**
```bash
cat << 'EOF' > /etc/security/pwquality.conf
minlen = 14
minclass = 4
dcredit = -1
ucredit = -1
ocredit = -1
lcredit = -1
EOF
```

---

#### 4.1.2 Ensure lockout for failed password attempts is configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.10\|CIS-4.10]] |

**Audit:**
```bash
grep pam_faillock /etc/pam.d/system-auth
grep -E "^(deny|unlock_time)" /etc/security/faillock.conf
```

**Remediation:**
```bash
cat << 'EOF' > /etc/security/faillock.conf
deny = 5
unlock_time = 900
fail_interval = 900
EOF
```

---

### 4.2 Configure SSH Server

#### 4.2.1 Ensure SSH root login is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-5.4\|CIS-5.4]] |

**Audit:**
```bash
sshd -T | grep permitrootlogin
```

**Expected:** `permitrootlogin no`

**Remediation:**
```bash
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl reload sshd
```

---

#### 4.2.2 Ensure SSH Protocol is set to 2 (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Note:** SSH Protocol 2 is the default in RHEL 9.

**Audit:**
```bash
sshd -T | grep protocol
```

---

#### 4.2.3 Ensure SSH PermitEmptyPasswords is disabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.1\|CIS-4.1]] |

**Audit:**
```bash
sshd -T | grep permitemptypasswords
```

**Expected:** `permitemptypasswords no`

---

#### 4.2.4 Ensure SSH Idle Timeout Interval is configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.3\|CIS-4.3]] |

**Audit:**
```bash
sshd -T | grep -E "clientaliveinterval|clientalivecountmax"
```

**Remediation:**
```bash
cat << 'EOF' >> /etc/ssh/sshd_config.d/50-hardening.conf
ClientAliveInterval 300
ClientAliveCountMax 3
EOF
systemctl reload sshd
```

---

#### 4.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-4.10\|CIS-4.10]] |

**Audit:**
```bash
sshd -T | grep maxauthtries
```

**Remediation:**
```bash
echo "MaxAuthTries 4" >> /etc/ssh/sshd_config.d/50-hardening.conf
systemctl reload sshd
```

---

## 5. Logging and Auditing

### 5.1 Configure rsyslog

#### 5.1.1 Ensure rsyslog is installed (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.2\|CIS-8.2]] |

**Audit:**
```bash
rpm -q rsyslog
```

**Remediation:**
```bash
dnf install rsyslog
systemctl enable --now rsyslog
```

---

#### 5.1.2 Ensure rsyslog service is enabled (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.2\|CIS-8.2]] |

**Audit:**
```bash
systemctl is-enabled rsyslog
```

---

### 5.2 Configure System Accounting (auditd)

#### 5.2.1 Ensure auditing is enabled (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.2\|CIS-8.2]] |

**Audit:**
```bash
systemctl is-enabled auditd
```

**Remediation:**
```bash
systemctl enable --now auditd
```

---

#### 5.2.2 Ensure audit log storage size is configured (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.3\|CIS-8.3]] |

**Audit:**
```bash
grep max_log_file /etc/audit/auditd.conf
```

**Remediation:**
```bash
sed -i 's/^max_log_file\s*=.*/max_log_file = 256/' /etc/audit/auditd.conf
```

---

#### 5.2.3 Ensure audit logs are not automatically deleted (Level 2)

| Property | Value |
|----------|-------|
| **Level** | 2 - Server |
| **CIS Control** | [[Controls/CIS/CIS-8.3\|CIS-8.3]] |

**Audit:**
```bash
grep max_log_file_action /etc/audit/auditd.conf
```

**Expected:** `max_log_file_action = keep_logs`

---

## 6. System Maintenance

### 6.1 System File Permissions

#### 6.1.1 Ensure permissions on /etc/passwd are configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-3.3\|CIS-3.3]] |

**Audit:**
```bash
stat /etc/passwd
# Expected: Access: (0644/-rw-r--r--) Uid: (0/root) Gid: (0/root)
```

**Remediation:**
```bash
chown root:root /etc/passwd
chmod 644 /etc/passwd
```

---

#### 6.1.2 Ensure permissions on /etc/shadow are configured (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-3.3\|CIS-3.3]] |

**Audit:**
```bash
stat /etc/shadow
# Expected: Access: (0000/----------) Uid: (0/root) Gid: (0/root)
```

**Remediation:**
```bash
chown root:root /etc/shadow
chmod 0000 /etc/shadow
```

---

### 6.2 User and Group Settings

#### 6.2.1 Ensure root is the only UID 0 account (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-5.4\|CIS-5.4]] |

**Audit:**
```bash
awk -F: '($3 == 0) { print $1 }' /etc/passwd
# Expected: only root
```

---

#### 6.2.2 Ensure no duplicate UIDs exist (Level 1)

| Property | Value |
|----------|-------|
| **Level** | 1 - Server |
| **CIS Control** | [[Controls/CIS/CIS-5.1\|CIS-5.1]] |

**Audit:**
```bash
cut -f3 -d":" /etc/passwd | sort | uniq -d
# Expected: no output
```

---

## CIS Controls Mapping

| CIS Control | Recommendations | Level |
|-------------|-----------------|-------|
| [[Controls/CIS/CIS-3.3\|CIS-3.3]] | 6.1.1, 6.1.2, 7.x | 1 |
| [[Controls/CIS/CIS-3.14\|CIS-3.14]] | 1.3.1, 1.3.2 | 1 |
| [[Controls/CIS/CIS-4.1\|CIS-4.1]] | 1.1.2.x, 1.4.1, 4.2.x | 1 |
| [[Controls/CIS/CIS-4.3\|CIS-4.3]] | 4.2.4 | 1 |
| [[Controls/CIS/CIS-4.4\|CIS-4.4]] | 3.2.x, 3.3.x | 1 |
| [[Controls/CIS/CIS-4.8\|CIS-4.8]] | 1.1.1.x, 2.2.x, 3.1.1 | 1/2 |
| [[Controls/CIS/CIS-4.10\|CIS-4.10]] | 4.1.2, 4.2.5 | 1 |
| [[Controls/CIS/CIS-5.1\|CIS-5.1]] | 6.2.2 | 1 |
| [[Controls/CIS/CIS-5.2\|CIS-5.2]] | 4.1.1 | 1 |
| [[Controls/CIS/CIS-5.4\|CIS-5.4]] | 4.2.1, 6.2.1 | 1 |
| [[Controls/CIS/CIS-7.4\|CIS-7.4]] | 1.2.1, 1.2.2 | 1 |
| [[Controls/CIS/CIS-8.2\|CIS-8.2]] | 5.1.x, 5.2.1 | 1/2 |
| [[Controls/CIS/CIS-8.3\|CIS-8.3]] | 5.2.2, 5.2.3 | 2 |
| [[Controls/CIS/CIS-8.4\|CIS-8.4]] | 2.1.1, 2.1.2 | 1 |

---

## Automation Tools

### OpenSCAP Integration

```bash
# Install OpenSCAP
dnf install scap-security-guide openscap-scanner

# Scan for CIS Level 1 Server
oscap xccdf eval \
  --profile xccdf_org.ssgproject.content_profile_cis_server_l1 \
  --results results.xml \
  --report report.html \
  /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml
```

### Ansible Automation

```bash
# Use ansible-lockdown/RHEL9-CIS role
ansible-galaxy install ansible-lockdown.RHEL9-CIS

# Run playbook
ansible-playbook -i inventory site.yml --tags "level1-server"
```

---

## Implementation Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1.1.1 | Disable cramfs | 1 | ☐ |
| 1.1.2.1 | Separate /tmp partition | 1 | ☐ |
| 1.2.1 | Configure GPG keys | 1 | ☐ |
| 1.2.2 | Enable gpgcheck | 1 | ☐ |
| 1.3.1 | Install AIDE | 1 | ☐ |
| 1.4.1 | Bootloader password | 1 | ☐ |
| 2.1.1 | Configure chrony | 1 | ☐ |
| 3.3.1 | Install firewalld | 1 | ☐ |
| 4.1.1 | Password requirements | 1 | ☐ |
| 4.2.1 | Disable SSH root login | 1 | ☐ |
| 5.1.1 | Install rsyslog | 1 | ☐ |
| 5.2.1 | Enable auditd | 2 | ☐ |
| 6.1.1 | /etc/passwd permissions | 1 | ☐ |

---

## Change History

| CIS Version | Date | Key Changes |
|-------------|------|-------------|
| v2.0.0 | 2024-06-24 | Major update, 255 recommendations |
| v1.0.0 | 2022-11-28 | Initial release for RHEL 9 |

---

## Complete Recommendations Checklist

This checklist contains **all 255 recommendations** from the CIS RHEL 9 Benchmark v2.0.0. Use this for tracking implementation progress. For detailed audit and remediation steps, refer to the Key Recommendations sections above or the official CIS Benchmark PDF.

### 1. Initial Setup

#### 1.1 Filesystem

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1.1.1 | Ensure cramfs kernel module is not available | L1 | ☐ |
| 1.1.1.2 | Ensure freevxfs kernel module is not available | L1 | ☐ |
| 1.1.1.3 | Ensure hfs kernel module is not available | L1 | ☐ |
| 1.1.1.4 | Ensure hfsplus kernel module is not available | L1 | ☐ |
| 1.1.1.5 | Ensure jffs2 kernel module is not available | L1 | ☐ |
| 1.1.1.6 | Ensure squashfs kernel module is not available | L2 | ☐ |
| 1.1.1.7 | Ensure udf kernel module is not available | L2 | ☐ |
| 1.1.1.8 | Ensure usb-storage kernel module is not available | L1 | ☐ |
| 1.1.1.9 | Ensure unused filesystems kernel modules are not available | L1 | ☐ |

#### 1.1.2 Filesystem Partitions

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.1.2.1.1 | Ensure /tmp is a separate partition | L1 | ☐ |
| 1.1.2.1.2 | Ensure nodev option set on /tmp partition | L1 | ☐ |
| 1.1.2.1.3 | Ensure nosuid option set on /tmp partition | L1 | ☐ |
| 1.1.2.1.4 | Ensure noexec option set on /tmp partition | L1 | ☐ |
| 1.1.2.2.1 | Ensure /dev/shm is a separate partition | L1 | ☐ |
| 1.1.2.2.2 | Ensure nodev option set on /dev/shm partition | L1 | ☐ |
| 1.1.2.2.3 | Ensure nosuid option set on /dev/shm partition | L1 | ☐ |
| 1.1.2.2.4 | Ensure noexec option set on /dev/shm partition | L1 | ☐ |
| 1.1.2.3.1 | Ensure /home is a separate partition | L2 | ☐ |
| 1.1.2.3.2 | Ensure nodev option set on /home partition | L1 | ☐ |
| 1.1.2.3.3 | Ensure nosuid option set on /home partition | L1 | ☐ |
| 1.1.2.4.1 | Ensure /var is a separate partition | L2 | ☐ |
| 1.1.2.4.2 | Ensure nodev option set on /var partition | L1 | ☐ |
| 1.1.2.4.3 | Ensure nosuid option set on /var partition | L1 | ☐ |
| 1.1.2.5.1 | Ensure /var/tmp is a separate partition | L2 | ☐ |
| 1.1.2.5.2 | Ensure nodev option set on /var/tmp partition | L1 | ☐ |
| 1.1.2.5.3 | Ensure nosuid option set on /var/tmp partition | L1 | ☐ |
| 1.1.2.5.4 | Ensure noexec option set on /var/tmp partition | L1 | ☐ |
| 1.1.2.6.1 | Ensure /var/log is a separate partition | L2 | ☐ |
| 1.1.2.6.2 | Ensure nodev option set on /var/log partition | L1 | ☐ |
| 1.1.2.6.3 | Ensure nosuid option set on /var/log partition | L1 | ☐ |
| 1.1.2.6.4 | Ensure noexec option set on /var/log partition | L1 | ☐ |
| 1.1.2.7.1 | Ensure /var/log/audit is a separate partition | L2 | ☐ |
| 1.1.2.7.2 | Ensure nodev option set on /var/log/audit partition | L1 | ☐ |
| 1.1.2.7.3 | Ensure nosuid option set on /var/log/audit partition | L1 | ☐ |
| 1.1.2.7.4 | Ensure noexec option set on /var/log/audit partition | L1 | ☐ |

#### 1.2 Software Updates

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.2.1.1 | Ensure GPG keys are configured | L1 | ☐ |
| 1.2.1.2 | Ensure gpgcheck is globally activated | L1 | ☐ |
| 1.2.1.3 | Ensure repo_gpgcheck is globally activated | L2 | ☐ |
| 1.2.1.4 | Ensure package manager repositories are configured | L1 | ☐ |
| 1.2.2.1 | Ensure updates, patches, and additional security software are installed | L1 | ☐ |

#### 1.3 Mandatory Access Control

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.3.1.1 | Ensure SELinux is installed | L1 | ☐ |
| 1.3.1.2 | Ensure SELinux is not disabled in bootloader configuration | L1 | ☐ |
| 1.3.1.3 | Ensure SELinux policy is configured | L1 | ☐ |
| 1.3.1.4 | Ensure the SELinux mode is not disabled | L1 | ☐ |
| 1.3.1.5 | Ensure the SELinux mode is enforcing | L2 | ☐ |
| 1.3.1.6 | Ensure no unconfined services exist | L2 | ☐ |
| 1.3.1.7 | Ensure the MCS Translation Service (mcstrans) is not installed | L1 | ☐ |
| 1.3.1.8 | Ensure SETroubleshoot is not installed | L1 | ☐ |

#### 1.4 Boot Settings

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.4.1 | Ensure bootloader password is set | L1 | ☐ |
| 1.4.2 | Ensure access to bootloader config is configured | L1 | ☐ |

#### 1.5 Process Hardening

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.5.1 | Ensure address space layout randomization is enabled | L1 | ☐ |
| 1.5.2 | Ensure ptrace_scope is restricted | L1 | ☐ |
| 1.5.3 | Ensure core dump backtraces are disabled | L1 | ☐ |
| 1.5.4 | Ensure core dump storage is disabled | L1 | ☐ |

#### 1.6 Crypto Policy

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 1.6.1 | Ensure system wide crypto policy is not set to legacy | L1 | ☐ |
| 1.6.2 | Ensure system wide crypto policy is not set in sshd configuration | L1 | ☐ |
| 1.6.3 | Ensure system wide crypto policy disables sha1 hash and signature support | L1 | ☐ |
| 1.6.4 | Ensure system wide crypto policy disables macs less than 128 bits | L1 | ☐ |
| 1.6.5 | Ensure system wide crypto policy disables cbc for ssh | L1 | ☐ |
| 1.6.6 | Ensure system wide crypto policy disables chacha20-poly1305 for ssh | L1 | ☐ |
| 1.6.7 | Ensure system wide crypto policy disables EtM for ssh | L1 | ☐ |

### 2. Services

#### 2.1 Time Synchronization

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 2.1.1 | Ensure time synchronization is in use | L1 | ☐ |
| 2.1.2 | Ensure chrony is configured | L1 | ☐ |
| 2.1.3 | Ensure chrony is not run as root user | L1 | ☐ |

#### 2.2 Special Purpose Services

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 2.2.1 | Ensure autofs services are not in use | L1 | ☐ |
| 2.2.2 | Ensure avahi daemon services are not in use | L1 | ☐ |
| 2.2.3 | Ensure dhcp server services are not in use | L1 | ☐ |
| 2.2.4 | Ensure dns server services are not in use | L1 | ☐ |
| 2.2.5 | Ensure dnsmasq services are not in use | L1 | ☐ |
| 2.2.6 | Ensure samba file server services are not in use | L1 | ☐ |
| 2.2.7 | Ensure ftp server services are not in use | L1 | ☐ |
| 2.2.8 | Ensure message access server services are not in use | L1 | ☐ |
| 2.2.9 | Ensure network file system services are not in use | L1 | ☐ |
| 2.2.10 | Ensure nis server services are not in use | L1 | ☐ |
| 2.2.11 | Ensure print server services are not in use | L1 | ☐ |
| 2.2.12 | Ensure rpcbind services are not in use | L1 | ☐ |
| 2.2.13 | Ensure rsync services are not in use | L1 | ☐ |
| 2.2.14 | Ensure snmp services are not in use | L1 | ☐ |
| 2.2.15 | Ensure telnet server services are not in use | L1 | ☐ |
| 2.2.16 | Ensure tftp server services are not in use | L1 | ☐ |
| 2.2.17 | Ensure web proxy server services are not in use | L1 | ☐ |
| 2.2.18 | Ensure web server services are not in use | L1 | ☐ |
| 2.2.19 | Ensure xinetd services are not in use | L1 | ☐ |
| 2.2.20 | Ensure X window server services are not in use | L1 | ☐ |

#### 2.3 Service Clients

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 2.3.1 | Ensure ftp client is not installed | L1 | ☐ |
| 2.3.2 | Ensure ldap client is not installed | L1 | ☐ |
| 2.3.3 | Ensure nis client is not installed | L1 | ☐ |
| 2.3.4 | Ensure telnet client is not installed | L1 | ☐ |
| 2.3.5 | Ensure tftp client is not installed | L1 | ☐ |

### 3. Network Configuration

#### 3.1 Network Devices

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.1.1 | Ensure IPv6 status is identified | L1 | ☐ |
| 3.1.2 | Ensure wireless interfaces are disabled | L1 | ☐ |
| 3.1.3 | Ensure bluetooth services are not in use | L1 | ☐ |

#### 3.2 Network Kernel Modules

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.2.1 | Ensure dccp kernel module is not available | L2 | ☐ |
| 3.2.2 | Ensure tipc kernel module is not available | L2 | ☐ |
| 3.2.3 | Ensure rds kernel module is not available | L2 | ☐ |
| 3.2.4 | Ensure sctp kernel module is not available | L2 | ☐ |

#### 3.3 Network Parameters (Host Only)

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.3.1 | Ensure ip forwarding is disabled | L1 | ☐ |
| 3.3.2 | Ensure packet redirect sending is disabled | L1 | ☐ |
| 3.3.3 | Ensure bogus icmp responses are ignored | L1 | ☐ |
| 3.3.4 | Ensure broadcast icmp requests are ignored | L1 | ☐ |
| 3.3.5 | Ensure icmp redirects are not accepted | L1 | ☐ |
| 3.3.6 | Ensure secure icmp redirects are not accepted | L1 | ☐ |
| 3.3.7 | Ensure reverse path filtering is enabled | L1 | ☐ |
| 3.3.8 | Ensure source routed packets are not accepted | L1 | ☐ |
| 3.3.9 | Ensure suspicious packets are logged | L1 | ☐ |
| 3.3.10 | Ensure tcp syn cookies is enabled | L1 | ☐ |
| 3.3.11 | Ensure ipv6 router advertisements are not accepted | L1 | ☐ |

#### 3.4 Firewall Configuration

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 3.4.1.1 | Ensure nftables is installed | L1 | ☐ |
| 3.4.1.2 | Ensure a single firewall configuration utility is in use | L1 | ☐ |
| 3.4.2.1 | Ensure firewalld default zone is set | L1 | ☐ |
| 3.4.2.2 | Ensure at least one nftables table exists | L1 | ☐ |
| 3.4.2.3 | Ensure nftables base chains exist | L1 | ☐ |
| 3.4.2.4 | Ensure host based firewall loopback traffic is configured | L1 | ☐ |
| 3.4.2.5 | Ensure firewalld drops unnecessary services and ports | L1 | ☐ |
| 3.4.2.6 | Ensure nftables established connections are configured | L1 | ☐ |
| 3.4.2.7 | Ensure nftables default deny firewall policy | L1 | ☐ |

### 4. Access, Authentication and Authorization

#### 4.1 Configure Job Schedulers

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.1.1.1 | Ensure cron daemon is enabled and active | L1 | ☐ |
| 4.1.1.2 | Ensure crontab is restricted to authorized users | L1 | ☐ |
| 4.1.1.3 | Ensure cron and at are restricted to authorized users | L1 | ☐ |
| 4.1.2.1 | Ensure at is restricted to authorized users | L1 | ☐ |

#### 4.2 SSH Configuration

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.2.1 | Ensure sshd is installed | L1 | ☐ |
| 4.2.2 | Ensure sshd access is configured | L1 | ☐ |
| 4.2.3 | Ensure sshd Banner is configured | L1 | ☐ |
| 4.2.4 | Ensure sshd Ciphers are configured | L1 | ☐ |
| 4.2.5 | Ensure sshd ClientAliveCountMax is configured | L1 | ☐ |
| 4.2.6 | Ensure sshd ClientAliveInterval is configured | L1 | ☐ |
| 4.2.7 | Ensure sshd DisableForwarding is enabled | L2 | ☐ |
| 4.2.8 | Ensure sshd GSSAPIAuthentication is disabled | L1 | ☐ |
| 4.2.9 | Ensure sshd HostbasedAuthentication is disabled | L1 | ☐ |
| 4.2.10 | Ensure sshd IgnoreRhosts is enabled | L1 | ☐ |
| 4.2.11 | Ensure sshd KexAlgorithms is configured | L1 | ☐ |
| 4.2.12 | Ensure sshd LoginGraceTime is configured | L1 | ☐ |
| 4.2.13 | Ensure sshd LogLevel is configured | L1 | ☐ |
| 4.2.14 | Ensure sshd MACs are configured | L1 | ☐ |
| 4.2.15 | Ensure sshd MaxAuthTries is configured | L1 | ☐ |
| 4.2.16 | Ensure sshd MaxSessions is configured | L1 | ☐ |
| 4.2.17 | Ensure sshd MaxStartups is configured | L1 | ☐ |
| 4.2.18 | Ensure sshd PermitEmptyPasswords is disabled | L1 | ☐ |
| 4.2.19 | Ensure sshd PermitRootLogin is disabled | L1 | ☐ |
| 4.2.20 | Ensure sshd PermitUserEnvironment is disabled | L1 | ☐ |
| 4.2.21 | Ensure sshd UsePAM is enabled | L1 | ☐ |

#### 4.3 Privilege Escalation

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.3.1 | Ensure sudo is installed | L1 | ☐ |
| 4.3.2 | Ensure sudo commands use pty | L1 | ☐ |
| 4.3.3 | Ensure sudo log file exists | L1 | ☐ |
| 4.3.4 | Ensure users must provide password for privilege escalation | L2 | ☐ |
| 4.3.5 | Ensure re-authentication for privilege escalation is not disabled | L1 | ☐ |
| 4.3.6 | Ensure sudo authentication timeout is configured correctly | L1 | ☐ |
| 4.3.7 | Ensure access to su command is restricted | L1 | ☐ |

#### 4.4 PAM Configuration

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.4.1 | Ensure latest version of pam is installed | L1 | ☐ |
| 4.4.2.1 | Ensure pam_faillock module is enabled | L1 | ☐ |
| 4.4.2.2 | Ensure pam_faillock deny is configured | L1 | ☐ |
| 4.4.2.3 | Ensure pam_faillock unlock_time is configured | L1 | ☐ |
| 4.4.2.4 | Ensure pam_faillock fail_interval is configured | L1 | ☐ |
| 4.4.3.1.1 | Ensure password hash algorithm is configured | L1 | ☐ |
| 4.4.3.1.2 | Ensure password length is configured | L1 | ☐ |
| 4.4.3.1.3 | Ensure password complexity is configured | L1 | ☐ |
| 4.4.3.2 | Ensure pam_pwhistory module is enabled | L1 | ☐ |
| 4.4.3.3 | Ensure pam_unix does not include nullok | L1 | ☐ |
| 4.4.3.4 | Ensure pam_unix does not include remember | L1 | ☐ |

#### 4.5 User Accounts and Environment

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 4.5.1.1 | Ensure password expiration is configured | L1 | ☐ |
| 4.5.1.2 | Ensure minimum days between password changes is configured | L1 | ☐ |
| 4.5.1.3 | Ensure password expiration warning days is configured | L1 | ☐ |
| 4.5.1.4 | Ensure strong password hashing algorithm is configured | L1 | ☐ |
| 4.5.1.5 | Ensure inactive password lock is configured | L1 | ☐ |
| 4.5.2.1 | Ensure default group for root account is GID 0 | L1 | ☐ |
| 4.5.2.2 | Ensure root user umask is configured | L1 | ☐ |
| 4.5.2.3 | Ensure system accounts are secured | L1 | ☐ |
| 4.5.2.4 | Ensure root password is set | L1 | ☐ |
| 4.5.3.1 | Ensure nologin is not listed in /etc/shells | L1 | ☐ |
| 4.5.3.2 | Ensure default user shell timeout is configured | L1 | ☐ |
| 4.5.3.3 | Ensure default user umask is configured | L1 | ☐ |

### 5. Logging and Auditing

#### 5.1 Configure Logging

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.1.1.1 | Ensure rsyslog is installed | L1 | ☐ |
| 5.1.1.2 | Ensure rsyslog service is enabled and active | L1 | ☐ |
| 5.1.1.3 | Ensure journald ForwardToSyslog is disabled | L1 | ☐ |
| 5.1.1.4 | Ensure rsyslog default file permissions are configured | L1 | ☐ |
| 5.1.1.5 | Ensure rsyslog logging is configured | L1 | ☐ |
| 5.1.1.6 | Ensure rsyslog is configured to send logs to a remote server | L1 | ☐ |
| 5.1.1.7 | Ensure rsyslog is not configured to receive logs from a remote client | L1 | ☐ |
| 5.1.2.1 | Ensure journald service is enabled and active | L1 | ☐ |
| 5.1.2.2 | Ensure journald Compress is configured | L1 | ☐ |
| 5.1.2.3 | Ensure journald Storage is configured | L1 | ☐ |
| 5.1.3 | Ensure all logfiles have appropriate access configured | L1 | ☐ |

#### 5.2 Configure System Accounting (auditd)

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 5.2.1.1 | Ensure audit is installed | L2 | ☐ |
| 5.2.1.2 | Ensure auditing for processes that start prior to auditd is enabled | L2 | ☐ |
| 5.2.1.3 | Ensure audit_backlog_limit is sufficient | L2 | ☐ |
| 5.2.1.4 | Ensure auditd service is enabled and active | L2 | ☐ |
| 5.2.2.1 | Ensure audit log storage size is configured | L2 | ☐ |
| 5.2.2.2 | Ensure audit logs are not automatically deleted | L2 | ☐ |
| 5.2.2.3 | Ensure system is disabled when audit logs are full | L2 | ☐ |
| 5.2.3.1 | Ensure changes to system administration scope (sudoers) is collected | L2 | ☐ |
| 5.2.3.2 | Ensure actions as another user are always logged | L2 | ☐ |
| 5.2.3.3 | Ensure events that modify date and time information are collected | L2 | ☐ |
| 5.2.3.4 | Ensure events that modify the system's network environment are collected | L2 | ☐ |
| 5.2.3.5 | Ensure events that modify the system's Mandatory Access Controls are collected | L2 | ☐ |
| 5.2.3.6 | Ensure use of privileged commands are collected | L2 | ☐ |
| 5.2.3.7 | Ensure unsuccessful file access attempts are collected | L2 | ☐ |
| 5.2.3.8 | Ensure events that modify user/group information are collected | L2 | ☐ |
| 5.2.3.9 | Ensure discretionary access control permission modification events are collected | L2 | ☐ |
| 5.2.3.10 | Ensure successful file system mounts are collected | L2 | ☐ |
| 5.2.3.11 | Ensure session initiation information is collected | L2 | ☐ |
| 5.2.3.12 | Ensure login and logout events are collected | L2 | ☐ |
| 5.2.3.13 | Ensure file deletion events by users are collected | L2 | ☐ |
| 5.2.3.14 | Ensure events that modify the system's Mandatory Access Controls are collected | L2 | ☐ |
| 5.2.3.15 | Ensure successful and unsuccessful attempts to use the chcon command are recorded | L2 | ☐ |
| 5.2.3.16 | Ensure successful and unsuccessful attempts to use the setfacl command are recorded | L2 | ☐ |
| 5.2.3.17 | Ensure successful and unsuccessful attempts to use the chacl command are recorded | L2 | ☐ |
| 5.2.3.18 | Ensure successful and unsuccessful attempts to use the usermod command are recorded | L2 | ☐ |
| 5.2.3.19 | Ensure kernel module loading unloading and modification is collected | L2 | ☐ |
| 5.2.3.20 | Ensure the audit configuration is immutable | L2 | ☐ |
| 5.2.3.21 | Ensure the running and on disk configuration is the same | L2 | ☐ |
| 5.2.4.1 | Ensure audit log files mode is configured | L2 | ☐ |
| 5.2.4.2 | Ensure audit log files owner is configured | L2 | ☐ |
| 5.2.4.3 | Ensure audit log files group owner is configured | L2 | ☐ |
| 5.2.4.4 | Ensure audit log directory mode is configured | L2 | ☐ |
| 5.2.4.5 | Ensure audit configuration files mode is configured | L2 | ☐ |
| 5.2.4.6 | Ensure audit configuration files owner is configured | L2 | ☐ |
| 5.2.4.7 | Ensure audit configuration files group owner is configured | L2 | ☐ |
| 5.2.4.8 | Ensure audit tools mode is configured | L2 | ☐ |
| 5.2.4.9 | Ensure audit tools owner is configured | L2 | ☐ |
| 5.2.4.10 | Ensure audit tools group owner is configured | L2 | ☐ |

### 6. System Maintenance

#### 6.1 File Permissions

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 6.1.1 | Ensure permissions on /etc/passwd are configured | L1 | ☐ |
| 6.1.2 | Ensure permissions on /etc/passwd- are configured | L1 | ☐ |
| 6.1.3 | Ensure permissions on /etc/group are configured | L1 | ☐ |
| 6.1.4 | Ensure permissions on /etc/group- are configured | L1 | ☐ |
| 6.1.5 | Ensure permissions on /etc/shadow are configured | L1 | ☐ |
| 6.1.6 | Ensure permissions on /etc/shadow- are configured | L1 | ☐ |
| 6.1.7 | Ensure permissions on /etc/gshadow are configured | L1 | ☐ |
| 6.1.8 | Ensure permissions on /etc/gshadow- are configured | L1 | ☐ |
| 6.1.9 | Ensure permissions on /etc/shells are configured | L1 | ☐ |
| 6.1.10 | Ensure permissions on /etc/security/opasswd are configured | L1 | ☐ |
| 6.1.11 | Ensure world writable files and directories are secured | L1 | ☐ |
| 6.1.12 | Ensure no unowned or ungrouped files or directories exist | L1 | ☐ |
| 6.1.13 | Ensure SUID and SGID files are reviewed | L1 | ☐ |

#### 6.2 User and Group Settings

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| 6.2.1 | Ensure accounts in /etc/passwd use shadowed passwords | L1 | ☐ |
| 6.2.2 | Ensure /etc/shadow password fields are not empty | L1 | ☐ |
| 6.2.3 | Ensure all groups in /etc/passwd exist in /etc/group | L1 | ☐ |
| 6.2.4 | Ensure no duplicate UIDs exist | L1 | ☐ |
| 6.2.5 | Ensure no duplicate GIDs exist | L1 | ☐ |
| 6.2.6 | Ensure no duplicate user names exist | L1 | ☐ |
| 6.2.7 | Ensure no duplicate group names exist | L1 | ☐ |
| 6.2.8 | Ensure root PATH integrity | L1 | ☐ |
| 6.2.9 | Ensure root is the only UID 0 account | L1 | ☐ |
| 6.2.10 | Ensure local interactive user home directories are configured | L1 | ☐ |
| 6.2.11 | Ensure local interactive user dot files access is configured | L1 | ☐ |

---

## Official Source

> **CIS Benchmark PDF Download**
> 
> The complete CIS Red Hat Enterprise Linux 9 Benchmark v2.0.0 with all 255 recommendations, detailed rationale, and full audit/remediation procedures is available for free download (non-commercial use):
> 
> → **[CIS WorkBench](https://workbench.cisecurity.org/)** (free registration required)
> 
> → **[CIS RHEL Benchmark Page](https://www.cisecurity.org/benchmark/red_hat_linux)**

---

## Related Documents

- [[Components/RHEL|RHEL Component]]
- [[Benchmarks/CIS/CIS-Kubernetes-1.29-v1.0.0|CIS Kubernetes Benchmark]] (for K3S nodes)
- [RHEL 9 Security Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/security_hardening/index)
- [OpenSCAP RHEL 9 Guide](https://static.open-scap.org/ssg-guides/ssg-rhel9-guide-cis.html)
- Original PDF: [CIS WorkBench](https://workbench.cisecurity.org/)
