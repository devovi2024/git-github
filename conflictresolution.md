Here is a complete, single Markdown file for **Section 9: Conflict Resolution Mastery**. Save it as `conflict-resolution.md` (or `conflictresoulation.md` if  prefer).

# Conflict Resolution Mastery - Complete Guide
This guide covers everything you need to know about resolving conflicts in Git – including merge, rebase, and cherry-pick conflicts with practical examples.

## Table of Contents
1. [What is a Conflict?](#1-what-is-a-conflict)
2. [Conflict Markers](#2-conflict-markers)
3. [Merge Conflict](#3-merge-conflict)
4. [Rebase Conflict](#4-rebase-conflict)
5. [Cherry-Pick Conflict](#5-cherry-pick-conflict)
6. [Conflict Resolution Commands](#6-conflict-resolution-commands)
7. [Best Practices](#7-best-practices)
8. [Practice Challenges](#8-practice-challenges)
9. [Quick Reference Cheat Sheet](#9-quick-reference-cheat-sheet)







## 1. What is a Conflict?
A **conflict** occurs when two different branches have made changes to the **same line** of the **same file**, and Git cannot automatically decide which change to keep. Git then asks the user to manually resolve the conflict.
**Example:**
- **Master branch** – `file.txt` line 5 says: `"Hello"`
- **Feature branch** – `file.txt` line 5 says: `"Hola"`
- Git says: *"I don't know which one to keep – you decide!"*


## 2. Conflict Markers
When a conflict occurs, Git inserts special markers into the file to show the conflicting sections:

```text
<<<<<<< HEAD
[Changes from your current branch]
=======
[Changes from the branch you are merging/rebasing]
>>>>>>> branch-name
```

**Marker meanings:**
| Marker | Meaning |
|--------|---------|
| `<<<<<<< HEAD` | Start of your current branch's changes |
| `=======` | Separator between the two versions |
| `>>>>>>> branch-name` | End of the incoming branch's changes |

---

## 3. Merge Conflict

### Creating a Merge Conflict

```bash
# 1. On master, create conflict.txt with three lines
git checkout master
echo "Line 1" > conflict.txt
echo "Line 2" >> conflict.txt
echo "Line 3" >> conflict.txt
git add conflict.txt
git commit -m "add: conflict.txt in master"

# 2. Create and switch to a new feature branch
git checkout -b feature-conflict

# 3. Change the middle line in the feature branch
echo "Line 1" > conflict.txt
echo "Feature Branch Line" >> conflict.txt
echo "Line 3" >> conflict.txt
git add conflict.txt
git commit -m "update: changed middle line in feature branch"

# 4. Go back to master
git checkout master

# 5. Change the same line in master
echo "Line 1" > conflict.txt
echo "Master Branch Line" >> conflict.txt
echo "Line 3" >> conflict.txt
git add conflict.txt
git commit -m "update: changed middle line in master"

# 6. Merge the feature branch – CONFLICT occurs!
git merge feature-conflict
```

**Output:**
```text
Auto-merging conflict.txt
CONFLICT (content): Merge conflict in conflict.txt
Automatic merge failed; fix conflicts and then commit the result.
```

### View the Conflict

```bash
cat conflict.txt
```

```text
Line 1
<<<<<<< HEAD
Master Branch Line
=======
Feature Branch Line
>>>>>>> feature-conflict
Line 3
```

### Resolving a Merge Conflict

**Option 1 – Keep the master version:**
```text
Line 1
Master Branch Line
Line 3
```

**Option 2 – Keep the feature version:**
```text
Line 1
Feature Branch Line
Line 3
```

**Option 3 – Keep both:**
```text
Line 1
Master Branch Line
Feature Branch Line
Line 3
```

**After editing, complete the merge:**
```bash
git add conflict.txt
git commit -m "merge: resolved conflict in conflict.txt"
```

---

## 4. Rebase Conflict

### Creating a Rebase Conflict

```bash
git checkout feature-conflict
git rebase master
```

**Output:**
```text
First, rewinding head to replay your work on top of it...
Applying: update: changed middle line in feature branch
Using index info to reconstruct a base tree...
M       conflict.txt
Falling back to patching base and 3-way merge...
Auto-merging conflict.txt
CONFLICT (content): Merge conflict in conflict.txt
error: Failed to merge in the changes.
Patch failed at 0001 update: changed middle line in feature branch
```

### Resolving a Rebase Conflict

```bash
# 1. Edit the file manually (remove markers, keep desired content)
# 2. Stage the resolved file
git add conflict.txt

# 3. Continue the rebase
git rebase --continue

# OR abort the rebase
git rebase --abort
```

---

## 5. Cherry-Pick Conflict

### Creating a Cherry-Pick Conflict

```bash
git checkout master
git cherry-pick <commit-hash>   # Use the hash of the conflicting commit
```

**Output:**
```text
error: could not apply <hash>... update: changed middle line in feature branch
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'
```

### Resolving a Cherry-Pick Conflict

```bash
# 1. Edit the file manually
# 2. Stage the resolved file
git add conflict.txt

# 3. Continue the cherry-pick
git cherry-pick --continue

# OR abort the cherry-pick
git cherry-pick --abort
```

---

## 6. Conflict Resolution Commands

| Command | Purpose |
|---------|---------|
| `git status` | Show which files have conflicts |
| `git diff` | Show the differences between versions |
| `git mergetool` | Launch a GUI tool to help resolve conflicts |
| `git add <file>` | Mark a file as resolved and stage it |
| `git commit` | Finish a merge (after staging all resolved files) |
| `git merge --abort` | Cancel the merge and go back to the previous state |
| `git rebase --abort` | Cancel the rebase |
| `git rebase --continue` | Continue rebase after resolving conflicts |
| `git cherry-pick --abort` | Cancel the cherry-pick |
| `git cherry-pick --continue` | Continue cherry-pick after resolving |
| `git log --merge` | Show commits that caused the conflict |
| `git diff --base <file>` | Compare with the base (common ancestor) version |
| `git diff --ours <file>` | Compare with your current branch version |
| `git diff --theirs <file>` | Compare with the incoming branch version |
| `git checkout --ours <file>` | Accept your current version (discard theirs) |
| `git checkout --theirs <file>` | Accept the incoming version (discard yours) |

---

## 7. Best Practices
| Practice | Why? |
|----------|------|
| **Pull frequently** | Stay up to date with the main branch to reduce big conflicts. |
| **Keep commits small** | Small, focused commits are easier to merge and rebase. |
| **Communicate with your team** | Avoid working on the same files at the same time. |
| **Keep feature branches short-lived** | The longer a branch lives, the more it diverges. |
| **Use rebase locally** | For your own feature branches, rebase keeps history clean. |
| **Never rebase shared branches** | Rebasing public branches rewrites history and breaks others' work. |
| **Use `.gitattributes`** | Define merge strategies for specific file types (e.g., binary files). |
| **Review code before merging** | Code reviews catch issues early. |
| **Test after resolving** | Always run tests to ensure the merged code works correctly. |

---

## 8. Practice Challenges
### Challenge 1 – Merge Conflict
- Create two branches with conflicting changes on the same file.
- Merge them and resolve the conflict using both a text editor and VS Code.
### Challenge 2 – Rebase Conflict
- Create conflicting changes on two branches.
- Perform a rebase and resolve the conflict using `--continue` and `--abort`.
### Challenge 3 – Cherry-Pick Conflict
- Create conflicting commits and cherry-pick one of them.
- Resolve the conflict and finish the cherry-pick.
### Challenge 4 – Advanced Resolution
- Create a conflict involving three branches.
- Resolve it using `git mergetool` and also try `git checkout --ours` and `--theirs`.

---

## 9. Quick Reference Cheat Sheet

```bash
# Find conflicts
git status

# View difference details
git diff

# Resolve manually – edit the file, remove markers

# Stage resolved file
git add <file>

# Finish the operation
# Merge:     git commit -m "message"
# Rebase:    git rebase --continue
# Cherry:    git cherry-pick --continue

# Abort if needed
# Merge:     git merge --abort
# Rebase:    git rebase --abort
# Cherry:    git cherry-pick --abort

# Accept one side completely
git checkout --ours <file>    # keep your version
git checkout --theirs <file>  # keep the other version

# Use a GUI tool
git mergetool

# Show the base (common ancestor) version
git config --global merge.conflictstyle diff3
```

---

##  Key Takeaways
1. **Conflict is normal** – don't panic.
2. **Conflict markers show exactly what changed** in each branch.
3. **Always test** after resolving conflicts.
4. **Communicate** with your team about complex conflict resolutions.
5. **Use GUI tools** if manual editing feels overwhelming.
6. **Keep commits small** – that minimises the chance of conflicts.
7. **Pull frequently** to stay up to date.
8. **Never rebase public/shared branches** – it rewrites history.
9. **Use merge for public branches, rebase for local branches** – best of both worlds.
10. **Practice regularly** to become confident in resolving conflicts.

---

## References
- [Git Official Documentation](https://git-scm.com/doc)
- [Pro Git Book](https://git-scm.com/book/en/v2)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials)
