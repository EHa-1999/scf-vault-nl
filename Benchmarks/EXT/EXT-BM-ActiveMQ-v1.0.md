---
id: "EXT-BM-ActiveMQ-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - ActiveMQ"
technology: "Apache ActiveMQ"
version_range: "5.17+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-10
next_review: 2027-02-10
owner: "Team Infrastructuur"
sources:
  - "Apache ActiveMQ Security Documentation"
  - "ActiveMQ JAAS Configuration"
  - "OWASP JMS Security"
recommendations_count: 22
level_1_count: 16
level_2_count: 6
created: 2026-02-10
modified: 2026-02-10
tags:
  - benchmark
  - extended
  - activemq
  - messaging
  - jms
---

# Extended Benchmark: Apache ActiveMQ v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | Apache ActiveMQ Classic |
| **Versie Range** | 5.17+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 22 (16 L1, 6 L2) |
| **Bron** | [ActiveMQ Security](https://activemq.apache.org/security) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/ActiveMQ\|ActiveMQ]] |

---

## 1. Authentication

### AMQ-1.1: JAAS authentication enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
JAAS (Java Authentication and Authorization Service) is ingeschakeld voor broker authenticatie.

**Audit Procedure:**
```bash
# Check activemq.xml for JAAS plugin
grep -i "jaasAuthenticationPlugin" conf/activemq.xml

# Check login.config
cat conf/login.config
```

**Remediation (activemq.xml):**
```xml
<plugins>
  <jaasAuthenticationPlugin configuration="activemq" />
</plugins>
```

**Bron:** [ActiveMQ JAAS](https://activemq.apache.org/jaas)

---

### AMQ-1.2: Default credentials gewijzigd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Default credentials (admin/admin, user/user) zijn gewijzigd in sterke wachtwoorden.

**Audit Procedure:**
```bash
# Check users.properties
cat conf/users.properties

# Verify no default passwords
grep -E "^admin=admin|^user=user" conf/users.properties
```

**Remediation (users.properties):**
```
admin=<strong_password_hash>
```

---

### AMQ-1.3: LDAP authentication backend

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]], [[Controls/CIS/CIS-6\|CIS-6]] |

**Beschrijving:**
Voor enterprise omgevingen: gebruik LDAP als authenticatie backend.

**Audit Procedure:**
```bash
# Check login.config for LDAP
grep -i "ldap" conf/login.config
```

**Remediation (login.config):**
```
activemq {
  org.apache.activemq.jaas.LDAPLoginModule required
    initialContextFactory="com.sun.jndi.ldap.LdapCtxFactory"
    connectionURL="ldaps://ldap.example.com:636"
    userBase="ou=users,dc=example,dc=com"
    ...
};
```

---

## 2. Authorization

### AMQ-2.1: Authorization plugin enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Authorization plugin is geconfigureerd om toegang tot destinations te controleren.

**Audit Procedure:**
```bash
# Check activemq.xml for authorization
grep -A 20 "authorizationPlugin" conf/activemq.xml
```

**Remediation (activemq.xml):**
```xml
<plugins>
  <authorizationPlugin>
    <map>
      <authorizationMap>
        <authorizationEntries>
          <authorizationEntry queue=">" read="admins" write="admins" admin="admins"/>
          <authorizationEntry topic=">" read="admins" write="admins" admin="admins"/>
          <authorizationEntry queue="XENA.>" read="xena-users" write="xena-users" admin="admins"/>
        </authorizationEntries>
      </authorizationMap>
    </map>
  </authorizationPlugin>
</plugins>
```

---

### AMQ-2.2: Least privilege per destination

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Gebruikers/groepen hebben alleen de minimaal benodigde rechten (read/write/admin) per queue/topic.

**Audit Procedure:**
```bash
# Review authorization entries
grep -B 2 -A 2 "authorizationEntry" conf/activemq.xml
```

---

### AMQ-2.3: Advisory topics beveiligd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Advisory topics (ActiveMQ.Advisory.*) zijn alleen toegankelijk voor administrators.

**Remediation (activemq.xml):**
```xml
<authorizationEntry topic="ActiveMQ.Advisory.>" read="admins" write="admins" admin="admins"/>
```

---

## 3. Transport Security (TLS)

### AMQ-3.1: SSL/TLS voor OpenWire

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
OpenWire transport connector gebruikt SSL/TLS (ssl:// of nio+ssl://).

**Audit Procedure:**
```bash
# Check transport connectors
grep -i "transportConnector" conf/activemq.xml
```

**Remediation (activemq.xml):**
```xml
<transportConnectors>
  <transportConnector name="ssl" uri="ssl://0.0.0.0:61617?needClientAuth=true"/>
</transportConnectors>

<sslContext>
  <sslContext keyStore="file:${activemq.conf}/broker.ks"
              keyStorePassword="${keystore.password}"
              trustStore="file:${activemq.conf}/broker.ts"
              trustStorePassword="${truststore.password}"/>
</sslContext>
```

**Bron:** [ActiveMQ SSL](https://activemq.apache.org/how-do-i-use-ssl)

---

### AMQ-3.2: Disable non-SSL connectors

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Onversleutelde transport connectors (tcp://, nio://) zijn uitgeschakeld in productie.

**Audit Procedure:**
```bash
# Check for non-SSL connectors
grep -E "tcp://|nio://" conf/activemq.xml | grep -v "#"
```

---

### AMQ-3.3: Client certificate authentication

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Mutual TLS (mTLS) is geconfigureerd: clients authenticeren met certificaten.

**Audit Procedure:**
```bash
# Check needClientAuth setting
grep -i "needClientAuth" conf/activemq.xml
```

**Remediation:**
```xml
<transportConnector name="ssl" uri="ssl://0.0.0.0:61617?needClientAuth=true"/>
```

---

## 4. Web Console Security

### AMQ-4.1: Web console via HTTPS

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
De web console (poort 8161) is alleen toegankelijk via HTTPS.

**Audit Procedure:**
```bash
# Check jetty.xml for SSL
grep -i "ssl" conf/jetty.xml

# Check jetty-realm.properties
cat conf/jetty-realm.properties
```

**Remediation (jetty.xml):**
```xml
<bean id="securityConstraint" class="org.eclipse.jetty.util.security.Constraint">
  <property name="name" value="BASIC"/>
  <property name="roles" value="admin"/>
  <property name="authenticate" value="true"/>
</bean>
```

---

### AMQ-4.2: Web console credentials gewijzigd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Default web console credentials zijn gewijzigd.

**Audit Procedure:**
```bash
# Check for default admin password
grep "admin" conf/jetty-realm.properties
```

**Remediation (jetty-realm.properties):**
```
admin: <strong_password>, admin
```

---

### AMQ-4.3: Web console disabled in productie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Overweeg de web console volledig uit te schakelen in productie als deze niet nodig is.

**Remediation (activemq.xml):**
```xml
<!-- Comment out or remove -->
<!-- <import resource="jetty.xml"/> -->
```

---

## 5. JMX Security

### AMQ-5.1: JMX authentication enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
JMX remote access vereist authenticatie.

**Audit Procedure:**
```bash
# Check JMX settings in env
grep -i "jmx" bin/env

# Check jmx.access and jmx.password
ls -la conf/jmx.*
```

**Remediation (bin/env):**
```bash
ACTIVEMQ_SUNJMX_START="-Dcom.sun.management.jmxremote.port=1099 \
  -Dcom.sun.management.jmxremote.authenticate=true \
  -Dcom.sun.management.jmxremote.ssl=true \
  -Dcom.sun.management.jmxremote.password.file=${ACTIVEMQ_CONF}/jmx.password \
  -Dcom.sun.management.jmxremote.access.file=${ACTIVEMQ_CONF}/jmx.access"
```

---

### AMQ-5.2: JMX SSL enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
JMX remote access gebruikt SSL/TLS.

**Audit Procedure:**
```bash
grep "jmxremote.ssl" bin/env
```

---

## 6. Network Security

### AMQ-6.1: Bind to specific interface

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
ActiveMQ bindt alleen aan specifieke interfaces, niet aan 0.0.0.0.

**Audit Procedure:**
```bash
# Check transport connector bindings
grep -i "transportConnector" conf/activemq.xml
```

**Remediation:**
```xml
<transportConnector name="ssl" uri="ssl://10.0.0.5:61617"/>
```

---

### AMQ-6.2: Firewall rules

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-13\|CIS-13]] Network Monitoring |

**Beschrijving:**
Firewall regels beperken toegang tot ActiveMQ poorten.

**Standaard Poorten:**
| Poort | Protocol | Toegang |
|-------|----------|---------|
| 61617 | OpenWire SSL | Applicatie servers |
| 8161 | Web Console | Admin netwerk |
| 1099 | JMX | Monitoring servers |

---

## 7. Logging & Audit

### AMQ-7.1: Audit logging enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Audit logging is ingeschakeld voor connections en security events.

**Audit Procedure:**
```bash
# Check log4j2.properties
grep -i "audit" conf/log4j2.properties

# Check activemq.xml for audit plugin
grep -i "loggingBrokerPlugin" conf/activemq.xml
```

**Remediation (activemq.xml):**
```xml
<plugins>
  <loggingBrokerPlugin logAll="true"/>
</plugins>
```

---

### AMQ-7.2: Log forwarding

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logs worden doorgestuurd naar centraal logging systeem.

---

## 8. Message Security

### AMQ-8.1: Message size limits

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Maximum message size is geconfigureerd om DoS te voorkomen.

**Audit Procedure:**
```bash
grep -i "maxFrameSize" conf/activemq.xml
```

**Remediation:**
```xml
<transportConnector name="ssl" uri="ssl://0.0.0.0:61617?wireFormat.maxFrameSize=104857600"/>
```

---

### AMQ-8.2: Store limits configured

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-4\|CIS-4]] Secure Configuration |

**Beschrijving:**
Memory en store limits zijn geconfigureerd om resource exhaustion te voorkomen.

**Audit Procedure:**
```bash
grep -A 5 "systemUsage" conf/activemq.xml
```

---

## Complete Checklist

| # | Recommendation | Level | Status |
|---|----------------|-------|--------|
| AMQ-1.1 | JAAS authentication enabled | L1 | ☐ |
| AMQ-1.2 | Default credentials gewijzigd | L1 | ☐ |
| AMQ-1.3 | LDAP authentication backend | L2 | ☐ |
| AMQ-2.1 | Authorization plugin enabled | L1 | ☐ |
| AMQ-2.2 | Least privilege per destination | L1 | ☐ |
| AMQ-2.3 | Advisory topics beveiligd | L1 | ☐ |
| AMQ-3.1 | SSL/TLS voor OpenWire | L1 | ☐ |
| AMQ-3.2 | Disable non-SSL connectors | L1 | ☐ |
| AMQ-3.3 | Client certificate authentication | L2 | ☐ |
| AMQ-4.1 | Web console via HTTPS | L1 | ☐ |
| AMQ-4.2 | Web console credentials gewijzigd | L1 | ☐ |
| AMQ-4.3 | Web console disabled in productie | L2 | ☐ |
| AMQ-5.1 | JMX authentication enabled | L1 | ☐ |
| AMQ-5.2 | JMX SSL enabled | L1 | ☐ |
| AMQ-6.1 | Bind to specific interface | L1 | ☐ |
| AMQ-6.2 | Firewall rules | L1 | ☐ |
| AMQ-7.1 | Audit logging enabled | L1 | ☐ |
| AMQ-7.2 | Log forwarding | L1 | ☐ |
| AMQ-8.1 | Message size limits | L1 | ☐ |
| AMQ-8.2 | Store limits configured | L1 | ☐ |

---

## Bronnen

- [ActiveMQ Security](https://activemq.apache.org/security)
- [ActiveMQ JAAS](https://activemq.apache.org/jaas)
- [ActiveMQ SSL](https://activemq.apache.org/how-do-i-use-ssl)
- [ActiveMQ Web Console](https://activemq.apache.org/web-console)

---

## Wijzigingshistorie

| Versie | Datum | Reviewer | Wijzigingen |
|--------|-------|----------|-------------|
| v1.0 | 2026-02-10 | CISO | Initiële versie |
