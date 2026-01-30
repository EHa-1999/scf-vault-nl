# SCF-Vault Changelog

All notable changes to the SCF-Vault Security Control Framework are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.6] - 2026-01-30

### Added
- **CIS RHEL 9 Benchmark v2.0.0** - 255 recommendations for Linux server hardening
- **K3S Component** - Container orchestration component with dual benchmark links
- **RHEL Component** - Base operating system component

### Changed
- Total CIS Benchmarks: 4 (PostgreSQL, NGINX, Kubernetes, RHEL)
- Components count: 10

---

## [3.5] - 2026-01-30

### Added
- **Benchmarks as first-class entity** - New `/Benchmarks/` folder at root level
- **5 CIS Benchmarks**: PostgreSQL 16, NGINX, Kubernetes 1.29
- **2 EXT Benchmarks**: MinIO, KeyCloak
- **Benchmark Templates**: CIS and EXT templates for creating new benchmarks
- **Component ↔ Benchmark linking**: Direct YAML frontmatter references
- **CHANGELOG.md**: This release notes file

### Changed
- Version numbers synchronized between NL and EN vaults
- Updated README with Benchmarks section in navigation
- Components now reference their applicable benchmark

---

## [3.4] - 2026-01-30 (NL only)

### Added
- Initial Benchmarks folder structure (NL vault)

---

## [3.3] - 2026-01-30

### Added
- **Dual Scoring Model documentation** - Explains Implementation vs. Compliance scoring
- **ArchiMate-style SVG diagrams** - Implementation-Workflow.svg, Compliance-Assessment-Workflow.svg

### Changed
- Dutch documentation fully translated (NL vault)
- Removed duplicate System Onboarding Guide (kept comprehensive version)
- Updated all internal links to use Dutch filenames

---

## [3.2] - 2026-01-29

### Added
- Extended Controls categories (EXT-O, EXT-HR, EXT-PHY, EXT-SUP, EXT-BC, EXT-COM, EXT-T)
- 78 new Extended Controls bringing total to 231

### Changed
- Split vaults into NL and EN versions
- Root folders renamed to `SCF-Vault-NL` and `SCF-Vault-EN`

---

## [3.1] - 2026-01-29

### Added
- **Dual Scoring Model** - Separate Implementation and Compliance tracking
- `impl_status` field: planned → in_progress → completed → validated
- `compliance_status` field: not_assessed → non_compliant → partial → compliant
- **Implementation Dashboard** with workflow SVG
- **Compliance Dashboard** with assessment workflow SVG

### Changed
- All control documents updated with dual scoring fields
- Dashboard queries updated for new scoring model

---

## [3.0] - 2026-01-28

### Added
- **Index pages (_index.md)** for every major folder
- **Vault-Navigation.svg** interactive navigation diagram
- **Vault-Navigation.canvas** clickable Obsidian canvas
- Website-like navigation through the hierarchy
- Breadcrumb navigation in each index
- Per-role navigation guides in Dashboards index

### Changed
- README updated with navigation table
- All major sections now have consistent _index.md entry points

---

## [2.9] - 2026-01-28

### Added
- **Baseline parameter** on all 180 controls
- **Baseline Dashboard** for comply-or-explain monitoring
- **Exception Management** workflow with template
- 93 CIS Controls marked as baseline (IG1/IG2)
- 27 Privacy Controls marked as baseline (AVG requirement)

### Changed
- Implementation Tracker prioritizes baseline controls
- Self-Assessment template includes baseline section
- Main Dashboard links to Baseline Dashboard

---

## [2.8] - 2026-01-28

### Added
- **CIS Benchmark Mapping Guide** documentation
- **System Component Breakdown (SCB)** template and XENA example
- **Extended Benchmark: EXT-MinIO** for MinIO hardening

---

## [2.7] - 2026-01-27

### Added
- **Executive Summary Dashboard** - Management one-pager
- **Enhanced Compliance Dashboard** - Per-framework status
- **Jira/Redmine Export Script** - Python CSV export tool
- **Implementatieplan 2026** - Phased rollout plan
- **Compliance Kalender 2026** - Monthly audit calendar

---

## [2.6] - 2026-01-27

### Added
- **Risk Dashboard** with risk register integration
- **Audit Dashboard** for findings management

---

## [2.5] - 2026-01-26

### Added
- **Templater Scripts** for Obsidian automation
  - New Audit script
  - Self-Assessment script
  - Finding script

---

## [2.4] - 2026-01-26

### Added
- **ArchiMate-style SVG diagrams** for LISA documentation
  - LISA-Architecture.svg
  - LISA-Governance-Hierarchy.svg
  - LISA-Security-Requirements.svg
  - LISA-Implementation-Model.svg
  - LISA-Implementation-Lifecycle.svg
  - LISA-Risk-Control-Mapping.svg
  - LISA-Six-Layers.svg
  - LISA-Audit-Cycle.svg
  - LISA-Audit-Entities.svg

### Changed
- Replaced all ASCII diagrams with professional SVG versions
- LISA documentation updated with embedded SVG images

---

## [2.3] - 2026-01-25

### Added
- **System Onboarding Guide** - Process for adding new systems
- **Component Template** improvements

---

## [2.2] - 2026-01-24

### Added
- **XENA System** documentation with all 8 components
- **ZGW System** documentation
- **E-mail Archief System** documentation

---

## [2.1] - 2026-01-23

### Added
- **Extended Privacy Controls (EXT-P)** - 27 AVG-specific controls
- Full Dutch translations for privacy controls

---

## [2.0] - 2026-01-22

### Added
- **153 CIS Controls v8** complete implementation
- **Implementation tracking** per control
- **Risk integration** per control
- **Main Dashboard** with Dataview queries

### Changed
- Major restructuring of Controls folder
- Standardized YAML frontmatter across all documents

---

## [1.x] - 2025-11-2025-12

### Initial Development
- LISA framework design and documentation
- Framework mappings (ISO 27001, NIS2, BIO2, AVG, NIST CSF)
- 13 Security Requirements (SR-1 through SR-13)
- Basic vault structure

---

## Version Naming Convention

| Version | Meaning |
|---------|---------|
| Major (X.0) | Significant structural changes, new major features |
| Minor (X.Y) | New features, additional content |
| Patch (X.Y.Z) | Bug fixes, corrections (not used in this changelog) |

---

## Upgrade Notes

### From 3.x to 3.5
1. Move any custom benchmarks from `/Documentatie/Benchmarks/` to `/Benchmarks/EXT/`
2. Update Component documents to include `benchmark:` field
3. Review new CIS Kubernetes benchmark for K3S deployments

### From 2.x to 3.x
1. Add `impl_status` and `compliance_status` fields to all Implementation documents
2. Update dashboard queries to use new dual scoring fields
3. Add `baseline: true/false` to all Control documents

---

## Contributors

- Security Team
- CISO Office

---

## Related Documents

- [[README|SCF-Vault README]]
- [[Documentatie/Handleiding|Handleiding]]
- [[Dashboards/Main Dashboard|Main Dashboard]]
