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

## Related Documents

- [[Components/RHEL|RHEL Component]]
- [[Benchmarks/CIS/CIS-Kubernetes-1.29-v1.0.0|CIS Kubernetes Benchmark]] (for K3S nodes)
- [RHEL 9 Security Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/security_hardening/index)
- [OpenSCAP RHEL 9 Guide](https://static.open-scap.org/ssg-guides/ssg-rhel9-guide-cis.html)
- Original PDF: [CIS WorkBench](https://workbench.cisecurity.org/)
