# git-flow

## Objective
This case study analyzes the **git-flow** branching model. It is a powerful Git branching strategy designed for large enterprise projects that require **multiple version support** and structured **release management**.

## 🏗️Model Structure
![Git-Flow Model](gitflow.png)

### 1. Main Branches (Infinite Lifetime)
| Branch | Name | Role |
|--------|------|------|
| **Production** | `master` (now `main`) | Always reflects production-ready code |
| **Integration** | `develop` | Integration branch for ongoing development |

### 2.Supporting Branches (Temporary)
| Branch Type | Source | Target | Purpose |
|-------------|--------|--------|---------|
| **Feature** (`feature/*`) | `develop` | `develop` | Develop new features |
| **Release** (`release/*`) | `develop` | `master` + `develop` | Prepare release (bug fixes, version bump) |
| **Hotfix** (`hotfix/*`) | `master` | `master` + `develop` | Fix critical production bugs urgently |

---
<!-- image  -->

## Workflow Overview

```text
[master] -------------------------------------------------------
   |                        ↑                        ↑
   |   (hotfix)            | (release merge)       | (tag)
[develop] -----------------------------------------------
   |        |              |        |               |
   |  [feature]            |  [release]            |
   |        |              |        |               |
   |    (merge)            |  (bugfix)             |
   |                      (merge to develop)       |