---
id: "EXT-BM-Camunda-v1.0"
type: benchmark
benchmark_type: "EXT"
name: "Extended Benchmark - Camunda"
technology: "Camunda"
version_range: "7.20+"
benchmark_version: "v1.0"
status: Active
last_review: 2026-02-11
next_review: 2027-02-11
owner: "Team Applicaties"
sources:
  - "Camunda Security Documentation"
  - "Camunda Production Checklist"
  - "OWASP Web Application Security"
recommendations_count: 18
level_1_count: 14
level_2_count: 4
created: 2026-02-11
modified: 2026-02-11
tags:
  - benchmark
  - extended
  - camunda
  - workflow
  - bpm
---

# Extended Benchmark: Camunda v1.0

## Benchmark Informatie

| Veld | Waarde |
|------|--------|
| **Technologie** | Camunda BPM / Camunda Platform 7 |
| **Versie Range** | 7.20+ |
| **Benchmark Versie** | v1.0 |
| **Recommendations** | 18 (14 L1, 4 L2) |
| **Bron** | [Camunda Security](https://docs.camunda.org/manual/latest/user-guide/security/) |

## Navigatie

| ← Terug | Omhoog | Component |
|---------|--------|-----------|
| [[Benchmarks/EXT/_index\|📙 EXT Benchmarks]] | [[Benchmarks/_index\|📏 Benchmarks]] | [[Components/GZAC\|GZAC]] |

---

## 1. Authentication

### CAM-1.1: Authenticatie ingeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Authenticatie moet verplicht zijn voor alle Camunda endpoints.

**Audit Procedure:**
```bash
# Check web.xml of Spring Security configuratie
grep -r "auth" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<!-- web.xml -->
<security-constraint>
  <web-resource-collection>
    <url-pattern>/*</url-pattern>
  </web-resource-collection>
  <auth-constraint>
    <role-name>camunda-admin</role-name>
  </auth-constraint>
</security-constraint>
```

---

### CAM-1.2: Default admin account gewijzigd

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Het standaard admin wachtwoord moet gewijzigd zijn en de demo user verwijderd.

**Audit Procedure:**
```bash
# Check for default users in database
psql -c "SELECT * FROM act_id_user WHERE id_ IN ('demo', 'admin');"
```

**Remediation:**
```java
// Verwijder demo user of wijzig wachtwoord
identityService.deleteUser("demo");
identityService.setPassword("admin", "StrongP@ssw0rd!");
```

---

### CAM-1.3: LDAP/SSO integratie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-5\|CIS-5]] Account Management |

**Beschrijving:**
Productie moet LDAP of SSO (SAML/OIDC) gebruiken voor authenticatie.

**Audit Procedure:**
```bash
# Check LDAP plugin configuratie
grep -r "ldap" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<!-- bpm-platform.xml -->
<plugin>
  <class>org.camunda.bpm.identity.impl.ldap.plugin.LdapIdentityProviderPlugin</class>
  <properties>
    <property name="serverUrl">ldaps://ldap.example.com</property>
    <property name="baseDn">dc=example,dc=com</property>
  </properties>
</plugin>
```

---

### CAM-1.4: Session timeout

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Session timeout moet ingesteld zijn op maximaal 30 minuten.

**Audit Procedure:**
```bash
grep -r "session-timeout\|maxInactiveInterval" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<!-- web.xml -->
<session-config>
  <session-timeout>30</session-timeout>
  <cookie-config>
    <http-only>true</http-only>
    <secure>true</secure>
  </cookie-config>
</session-config>
```

---

## 2. Authorization

### CAM-2.1: Authorization checks enabled

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Authorization moet ingeschakeld zijn in de process engine configuratie.

**Audit Procedure:**
```bash
grep -r "authorizationEnabled" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<!-- bpm-platform.xml of camunda.cfg.xml -->
<property name="authorizationEnabled">true</property>
```

---

### CAM-2.2: Tenant-based isolation

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Multi-tenant deployments moeten tenant isolation afdwingen.

**Audit Procedure:**
```bash
grep -r "tenantId\|tenant-check" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<property name="tenantCheckEnabled">true</property>
```

---

### CAM-2.3: Restrictieve default permissions

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Default permissions moeten restrictief zijn (deny by default).

**Audit Procedure:**
```sql
-- Check authorization table
SELECT * FROM act_ru_authorization WHERE type_ = 0;  -- Global authorizations
```

**Remediation:**
Configureer expliciete permissions per user/group. Vermijd global grants.

---

### CAM-2.4: REST API authorization

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
De REST API moet authorization afdwingen.

**Audit Procedure:**
```bash
# Test API zonder credentials
curl -X GET http://localhost:8080/engine-rest/process-definition
```

**Remediation:**
```xml
<!-- web.xml voor REST API -->
<security-constraint>
  <web-resource-collection>
    <url-pattern>/engine-rest/*</url-pattern>
  </web-resource-collection>
  <auth-constraint>
    <role-name>camunda-rest</role-name>
  </auth-constraint>
</security-constraint>
```

---

## 3. Network Security

### CAM-3.1: TLS voor alle endpoints

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Alle Camunda endpoints moeten via HTTPS bereikbaar zijn.

**Audit Procedure:**
```bash
# Check for HTTP listeners
ss -tlnp | grep java
curl -I http://localhost:8080/
```

**Remediation:**
Configureer TLS in de application server (Tomcat, WildFly) of gebruik reverse proxy.

---

### CAM-3.2: Database connectie encrypted

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Verbinding naar de database moet via SSL/TLS verlopen.

**Audit Procedure:**
```bash
grep -r "jdbc\|sslmode" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<!-- datasource configuratie -->
<property name="jdbcUrl">
  jdbc:postgresql://db:5432/camunda?sslmode=require
</property>
```

---

### CAM-3.3: Admin endpoints IP-restricted

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-12\|CIS-12]] Network Infrastructure |

**Beschrijving:**
Admin endpoints moeten IP-restricted zijn.

**Audit Procedure:**
```bash
# Check reverse proxy configuratie voor /camunda/app/admin
grep -r "admin" /etc/nginx/conf.d/
```

**Remediation:**
```nginx
location /camunda/app/admin {
    allow 10.0.0.0/8;
    deny all;
    proxy_pass http://camunda:8080;
}
```

---

## 4. Logging & Auditing

### CAM-4.1: Audit logging ingeschakeld

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
History level moet minimaal AUDIT zijn voor compliance logging.

**Audit Procedure:**
```bash
grep -r "historyLevel\|history-level" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<property name="historyLevel">AUDIT</property>
```

---

### CAM-4.2: User operation log

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
User operation logging moet ingeschakeld zijn.

**Audit Procedure:**
```sql
-- Check user operation log
SELECT * FROM act_hi_op_log ORDER BY timestamp_ DESC LIMIT 10;
```

**Remediation:**
User operation log is standaard ingeschakeld bij history level AUDIT of hoger.

---

### CAM-4.3: Log output naar SIEM

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-8\|CIS-8]] Audit Log Management |

**Beschrijving:**
Logs moeten doorgestuurd worden naar centraal SIEM systeem.

**Audit Procedure:**
```bash
# Check logback/log4j configuratie voor remote appender
grep -r "syslog\|kafka\|socket" /path/to/camunda/logback.xml
```

**Remediation:**
Configureer een Syslog of Kafka appender in logback.xml.

---

## 5. Process Security

### CAM-5.1: Geen script injection

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-16\|CIS-16]] Application Security |

**Beschrijving:**
Script execution in processes moet beperkt of gecontroleerd zijn.

**Audit Procedure:**
```bash
# Check for script tasks in BPMN files
grep -r "<scriptTask\|<camunda:script" /path/to/processes/
```

**Remediation:**
```xml
<!-- Beperk scripting talen -->
<property name="enableScriptCompilation">true</property>
<property name="scriptEngines">
  <list>
    <value>groovy</value>
    <!-- Geen javascript/python -->
  </list>
</property>
```

---

### CAM-5.2: Deployment authenticatie

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-6\|CIS-6]] Access Control |

**Beschrijving:**
Process deployment moet geauthenticeerd en geautoriseerd zijn.

**Audit Procedure:**
```bash
# Check deployment permissions
curl -u admin:password -X GET http://localhost:8080/engine-rest/deployment
```

**Remediation:**
```java
authorizationService.createNewAuthorization(AUTH_TYPE_GRANT)
  .setResource(DEPLOYMENT)
  .setResourceId("*")
  .setPermissions(new Permission[] { CREATE, READ })
  .setGroupId("deployers");
```

---

### CAM-5.3: Process versioning

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-2\|CIS-2]] Inventory and Control |

**Beschrijving:**
Process definitions moeten versiebeheer hebben voor auditability.

**Audit Procedure:**
```sql
-- Check process versions
SELECT key_, version_, deployment_id_ FROM act_re_procdef ORDER BY key_, version_;
```

**Remediation:**
Gebruik standaard Camunda versioning. Verwijder oude versies niet, maar markeer als deprecated.

---

## 6. Data Protection

### CAM-6.1: Sensitive data in variables

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L1 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
Gevoelige data in process variables moet beschermd worden.

**Audit Procedure:**
```sql
-- Check for potentially sensitive variable names
SELECT DISTINCT name_ FROM act_ru_variable WHERE name_ LIKE '%password%' OR name_ LIKE '%ssn%';
```

**Remediation:**
```java
// Gebruik transient variables voor gevoelige data
execution.setVariableLocal("password", password);  // Niet persistent
// Of gebruik encryption
String encrypted = encrypt(sensitiveData);
execution.setVariable("sensitiveData", encrypted);
```

---

### CAM-6.2: History cleanup

| Eigenschap | Waarde |
|------------|--------|
| **Level** | L2 |
| **CIS Control** | [[Controls/CIS/CIS-3\|CIS-3]] Data Protection |

**Beschrijving:**
History data moet automatisch opgeschoond worden conform retentiebeleid.

**Audit Procedure:**
```bash
grep -r "historyCleanup\|history-cleanup" /path/to/camunda/configuration/
```

**Remediation:**
```xml
<property name="historyCleanupEnabled">true</property>
<property name="historyCleanupBatchSize">500</property>
<property name="historyTimeToLive">P90D</property>  <!-- 90 dagen -->
```

---

## Samenvatting per Domein

| Domein | L1 | L2 | Totaal |
|--------|----|----|--------|
| 1. Authentication | 3 | 1 | 4 |
| 2. Authorization | 3 | 1 | 4 |
| 3. Network Security | 3 | 0 | 3 |
| 4. Logging & Auditing | 2 | 1 | 3 |
| 5. Process Security | 3 | 0 | 3 |
| 6. Data Protection | 1 | 1 | 2 |
| **Totaal** | **14** | **4** | **18** |

---

## Referenties

- [Camunda Security Guide](https://docs.camunda.org/manual/latest/user-guide/security/)
- [Camunda Authorization Service](https://docs.camunda.org/manual/latest/user-guide/process-engine/authorization-service/)
- [Camunda Production Checklist](https://docs.camunda.org/manual/latest/installation/production-checklist/)
