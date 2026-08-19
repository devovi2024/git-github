# <i class="fas fa-code-merge"></i> Merge vs Rebase: Deep Dive

[![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)

---

> **Merge** and **Rebase** — two of Git's most important but confusing commands. This guide will teach you when, why, and how to use each one.

---

## <i class="fas fa-list"></i> Table of Contents

| Section | Topic |
|---------|-------|
| 4.1 | <i class="fas fa-code-merge"></i> What is Merge? |
| 4.2 | <i class="fas fa-code-branch"></i> What is Rebase? |
| 4.3 | <i class="fas fa-table"></i> Merge vs Rebase - Side by Side |
| 4.4 | <i class="fas fa-check-circle"></i> When to Use Merge |
| 4.5 | <i class="fas fa-check-circle"></i> When to Use Rebase |
| 4.6 | <i class="fas fa-exclamation-triangle"></i> The Golden Rule of Rebase |
| 4.7 | <i class="fas fa-pencil-alt"></i> Interactive Rebase |
| 4.8 | <i class="fas fa-tools"></i> Merge Conflicts |
| 4.9 | <i class="fas fa-laptop-code"></i> Real-World Example |
| 4.10 | <i class="fas fa-book"></i> Summary & Best Practices |

---

## <i class="fas fa-code-merge"></i> 4.1 What is Merge?

**Merge** takes changes from one branch and combines them into another, creating a **merge commit** that preserves complete history.

### Before Merge:
```
          A---B---C  feature/login
         /
    D---E---F---G    main
```

### After Merge:
```
          A---B---C  feature/login
         /         \
    D---E---F---G---H  main (H = merge commit)
```

### Command:
```bash
git checkout main
git merge feature/login
```

### Characteristics:
- <i class="fas fa-check-circle" style="color: #28a745;"></i> Preserves complete history
- <i class="fas fa-check-circle" style="color: #28a745;"></i> Non-destructive (nothing changes)
- <i class="fas fa-check-circle" style="color: #28a745;"></i> Safe for shared branches
- <i class="fas fa-times-circle" style="color: #dc3545;"></i> Creates extra merge commits
- <i class="fas fa-times-circle" style="color: #dc3545;"></i> History can become cluttered

---

## <i class="fas fa-code-branch"></i> 4.2 What is Rebase?

**Rebase** takes commits from one branch and reapplies them on top of another, creating a **linear, clean history**.

### Before Rebase:
```
          A---B---C  feature/login
         /
    D---E---F---G    main
```

### After Rebase:
```
                  A'---B'---C'  feature/login
                 /
    D---E---F---G               main
```

### Command:
```bash
git checkout feature/login
git rebase main
```

### Characteristics:
- <i class="fas fa-check-circle" style="color: #28a745;"></i> Clean, linear history
- <i class="fas fa-check-circle" style="color: #28a745;"></i> No extra merge commits
- <i class="fas fa-check-circle" style="color: #28a745;"></i> Easier to read and understand
- <i class="fas fa-times-circle" style="color: #dc3545;"></i> Rewrites commit history (dangerous)
- <i class="fas fa-times-circle" style="color: #dc3545;"></i> Not safe for shared branches

---

## <i class="fas fa-table"></i> 4.3 Merge vs Rebase - Side by Side

| Feature | Merge | Rebase |
|---------|-------|--------|
| **History** | Preserves full history | Creates linear history |
| **Commit IDs** | Stay the same | Change (new IDs) |
| **Merge Commit** | Creates one | No merge commit |
| **Safety** | Safe for shared branches | Not safe for shared branches |
| **Conflict Resolution** | Once per merge | Once per commit |
| **Visual** | Branching visible | Linear, clean |
| **Team Use** | <i class="fas fa-check-circle" style="color: #28a745;"></i> Recommended | <i class="fas fa-times-circle" style="color: #dc3545;"></i> Not on shared branches |

---

## <i class="fas fa-check-circle" style="color: #28a745;"></i> 4.4 When to Use Merge

| Situation | Reason |
|-----------|--------|
| Working on a shared branch | Doesn't rewrite history |
| Feature branch is shared with others | Safe for collaboration |
| You want to preserve complete history | Shows exactly what happened |
| Team prefers explicit merge commits | Clear branching structure |
| Release or hotfix branches | Safer for production code |

### Command:
```bash
git checkout main
git pull origin main
git merge feature/login
git push origin main
```

---

## <i class="fas fa-check-circle" style="color: #28a745;"></i> 4.5 When to Use Rebase

| Situation | Reason |
|-----------|--------|
| Personal feature branch | Clean history before merging |
| Before creating a Pull Request | Makes PR review easier |
| Local branch only | No one else is using it |
| You want a clean, linear history | Easier to understand later |
| Updating feature branch with main | Keep it up to date cleanly |

### Command:
```bash
git checkout feature/login
git rebase main
git push --force-with-lease
```

---

## <i class="fas fa-exclamation-triangle" style="color: #ffc107;"></i> 4.6 The Golden Rule of Rebase

> <i class="fas fa-exclamation-triangle" style="color: #dc3545;"></i> **NEVER REBASE SHARED BRANCHES!**

### Why?

If you rebase a shared branch, other developers will have conflicting histories.

```
<i class="fas fa-times-circle" style="color: #dc3545;"></i> WRONG:
git checkout main
git rebase feature/login   # NEVER rebase main!

<i class="fas fa-check-circle" style="color: #28a745;"></i> CORRECT:
git checkout feature/login
git rebase main             # Safe for personal branch
```

### The Golden Rule:
```
Rebase local branches ONLY.
NEVER rebase shared branches.
```

---

## <i class="fas fa-pencil-alt"></i> 4.7 Interactive Rebase

Interactive rebase allows you to **edit, squash, reorder, or drop commits**.

### Command:
```bash
git rebase -i HEAD~3   # Rebase last 3 commits
```

### Options:

| Option | Meaning | Use Case |
|--------|---------|----------|
| `pick` | Use commit as is | Default |
| `reword` | Change commit message | Fix typos |
| `edit` | Modify commit content | Add missed changes |
| `squash` | Combine with previous commit | Clean history |
| `fixup` | Combine and discard message | Clean history |
| `drop` | Remove commit | Remove unwanted changes |

### Example:
```bash
# Before:
abc1234 Add login feature
def5678 Fix login bug
ghi9012 Add login tests

# After interactive rebase (squash):
jkl3456 Add login feature with tests

# Command:
git rebase -i HEAD~3
# Change "pick" to "squash" for commits to combine
```

---

## <i class="fas fa-tools"></i> 4.8 Merge Conflicts

| Aspect | Merge | Rebase |
|--------|-------|--------|
| **When** | At the end of merge | During each commit replay |
| **How Many** | Once | Once per commit |
| **Fixing** | Fix all conflicts at once | Fix conflicts sequentially |

### Merge Conflict Example:

```bash
# Merge - Fix all conflicts at once
git merge feature/login
# CONFLICT: file.txt
# Fix file.txt
git add file.txt
git commit -m "Merge branch feature/login"

# Rebase - Fix conflicts per commit
git rebase main
# CONFLICT: file.txt (first commit)
# Fix file.txt
git add file.txt
git rebase --continue
# CONFLICT: file.txt (second commit)
# Fix file.txt again
git add file.txt
git rebase --continue
```

---

## <i class="fas fa-laptop-code"></i> 4.9 Real-World Example

### Scenario: Working on a login feature with a team.

```
Initial State:
    D---E---F main
         \
          A---B---C feature/login
```

### Step 1: Update feature branch with latest main

```bash
# Option A: Merge (Recommended for shared)
git checkout feature/login
git merge main

# Option B: Rebase (Only if personal)
git checkout feature/login
git rebase main
```

### Step 2: Push to remote

```bash
# After Merge:
git push origin feature/login

# After Rebase:
git push origin feature/login --force-with-lease
```

### Step 3: Create Pull Request & Merge

```bash
# After PR approval:
git checkout main
git pull origin main

# Option A: Merge (Preserve history)
git merge --no-ff feature/login

# Option B: Rebase (Clean history - not recommended for main)
git rebase feature/login
git push origin main
```

---

## <i class="fas fa-book"></i> 4.10 Summary - Best Practices

### <i class="fas fa-check-circle" style="color: #28a745;"></i> Merge Best Practices:

| Rule | Why |
|------|-----|
| Use merge on shared branches | Safe for team collaboration |
| Use `--no-ff` for features | Preserves feature history |
| Merge frequently | Avoids big conflicts |

### <i class="fas fa-check-circle" style="color: #28a745;"></i> Rebase Best Practices:

| Rule | Why |
|------|-----|
| Only rebase local branches | Avoids breaking shared history |
| Rebase before creating PR | Clean history for review |
| Use interactive rebase | Clean up commit history |

### <i class="fas fa-times-circle" style="color: #dc3545;"></i> Common Mistakes:

| Mistake | Why It's Bad |
|---------|--------------|
| Rebasing shared branches | Breaks other developers' history |
| Force pushing without caution | Overwrites others' work |
| Rebasing after PR review | Makes reviewing harder |

---

## <i class="fas fa-bolt"></i> Quick Reference Card

```bash
# MERGE
git checkout main
git merge feature/login

# REBASE (Safe - personal branch)
git checkout feature/login
git rebase main
git push --force-with-lease

# INTERACTIVE REBASE
git rebase -i HEAD~3

# MERGE with --no-ff (preserve history)
git checkout main
git merge --no-ff feature/login
```

---

## <i class="fas fa-table"></i> Summary Table

| When to Use | Merge | Rebase |
|-------------|-------|--------|
| Shared feature branch | <i class="fas fa-check-circle" style="color: #28a745;"></i> | <i class="fas fa-times-circle" style="color: #dc3545;"></i> |
| Personal feature branch | <i class="fas fa-check-circle" style="color: #28a745;"></i> | <i class="fas fa-check-circle" style="color: #28a745;"></i> |
| Updating local branch | <i class="fas fa-check-circle" style="color: #28a745;"></i> | <i class="fas fa-check-circle" style="color: #28a745;"></i> |
| Before PR creation | <i class="fas fa-check-circle" style="color: #28a745;"></i> | <i class="fas fa-check-circle" style="color: #28a745;"></i> |
| Production hotfix | <i class="fas fa-check-circle" style="color: #28a745;"></i> | <i class="fas fa-times-circle" style="color: #dc3545;"></i> |
| Cleaning commit history | <i class="fas fa-times-circle" style="color: #dc3545;"></i> | <i class="fas fa-check-circle" style="color: #28a745;"></i> |

---

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> **Golden Rule of Git:**  
> **Rebase local branches, merge shared branches.**  
> This keeps your history clean while maintaining team safety.

---

*<i class="fas fa-calendar-alt"></i> Last Updated: 2026*