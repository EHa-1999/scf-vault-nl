---
type: assessment-result
component: RabbitMQ
benchmark: EXT-BM-RabbitMQ-v1.0
assessment_date: "2026-02-11"
export_timestamp: "2026-02-11 14:32:15"
assessor: "J. de Vries"
system: "XENA-ZGW"
environment: "Productie"
approved_by: "F. Bakker (CISO)"

# Scores
total_score: 82.5
baseline_score: 93.3

# Tellingen
total_measures: 20
baseline_measures: 15

compliant: 15
partial: 3
non_compliant: 2
na: 0

baseline_compliant: 14
baseline_partial: 1
baseline_non_compliant: 0
baseline_na: 0
---

# Assessment Result: RabbitMQ

> Geëxporteerd uit Assessment-RabbitMQ.xlsx op 2026-02-11 14:32:15

## Samenvatting

| Metric | Waarde |
|--------|--------|
| Baseline Score | 93.3% |
| Totaal Score | 82.5% |
| Baseline Maatregelen | 15 |
| Totaal Maatregelen | 20 |
| Compliant | 15 |
| Partial | 3 |
| Non-Compliant | 2 |

## Metadata

- **Assessor**: J. de Vries
- **Systeem**: XENA-ZGW
- **Omgeving**: Productie
- **Datum**: 2026-02-11
- **Goedgekeurd door**: F. Bakker (CISO)

## Non-Compliant Items

| ID | Control | Status | Actie |
|----|---------|--------|-------|
| RMQ-1.3 | LDAP authentication backend | Non-Compliant | Gepland Q2 2026 |
| RMQ-3.4 | Inter-node TLS (clustering) | Non-Compliant | Geen clustering in gebruik |

## Partial Items

| ID | Control | Status | Opmerking |
|----|---------|--------|-----------|
| RMQ-4.3 | Rate limiting op API | Partial | Basis rate limiting actief, fine-tuning nodig |
| RMQ-6.3 | Prometheus metrics | Partial | Metrics enabled, nog niet beveiligd |
| RMQ-7.1 | Message TTL | Partial | TTL op 50% van queues |

## Gerelateerd

- [[Components/RabbitMQ|RabbitMQ Component]]
- [[Benchmarks/EXT/EXT-BM-RabbitMQ-v1.0|EXT-BM-RabbitMQ Benchmark]]
- [[Assessments/_index|Assessments Overzicht]]
