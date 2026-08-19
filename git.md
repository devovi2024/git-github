# Git = Distributed Version Control System (DVCS)

## Centralized (SVN)

```text
          [Server]
             |
    +--------+--------+
    |        |        |
  [Dev 1]  [Dev 2]  [Dev 3]
```

## Distributed (Git)

```text
          [Server]
         /        \
    [Dev 1]      [Dev 2]
       |            |
    [Local]      [Local]
```

| Theory | Centralized (SVN) | Distributed (Git) |
|:-------|:------------------|:------------------|
| **Repo Location** | One central server | Full copy on every dev machine |
| **Network** | Required for commits | Only for push/pull |
| **History** | Single source of truth | Every clone has full history |
| **Offline Work** | Limited | Full functionality |
| **Architecture** | `Server → Devs` | `Server ↔ Devs ↔ Local` |

---

# ⬜ Git Basics & Foundation

- [ ] Creating repositories (`init`, `clone`)
- [ ] Tracking files (`add`, `commit`)
- [ ] Checking status (`status`, `log`, `diff`)
- [ ] Removing/Renaming files (`rm`, `mv`)
- [ ] Undoing changes (`restore`, `reset`)
- [ ] Using `.gitignore`
- [ ] Complete Git Workflow

---

# 1️⃣ Creating a Repository

## `git init` — Create a new repository

```bash
# Create a new folder and initialize git
mkdir my-project
cd my-project
git init

# Output:
# Initialized empty Git repository in /path/to/my-project/.git/
```

## `git clone` — Copy an existing repository

```bash
# Clone from GitHub
git clone https://github.com/username/repo-name.git

# Clone a specific branch
git clone -b branch-name https://github.com/username/repo-name.git

# Clone with a different folder name
git clone https://github.com/username/repo-name.git my-folder
```

---

# 2️⃣ Tracking Files

```text
┌─────────────────────────────────────────────────────┐
│                                                     │
│   Working Directory    Staging Area    Local Repo   │
│   (where you edit)     (git add)     (git commit)  │
│                                                     │
│   [file.txt] ──────> [file.txt] ──> [file.txt]    │
│   (Modified)         (Staged)       (Committed)    │
│                                                     │
└─────────────────────────────────────────────────────┘
```

## `git add` — Stage files

```bash
# Stage a single file
git add file.txt

# Stage all files
git add .

# Stage all .txt files
git add *.txt

# Stage everything (alternative)
git add -A

# Unstage a staged file
git reset file.txt
```

## `git commit` — Save changes

```bash
# Regular commit
git commit -m "Add new feature"

# Commit all staged files (add + commit together)
git commit -a -m "Updated all files"

# Open editor for commit message
git commit

# Amend: Change the last commit message
git commit --amend -m "New message"

# Amend: Add forgotten file to last commit
git add forgotten-file.txt
git commit --amend --no-edit
```

---

# 3️⃣ Checking Status

## `git status` — Current state

```bash
# Detailed status
git status

# Short status
git status -s

# Output meanings:
# ?? = Untracked (new file)
# A  = Added (staged)
# M  = Modified (changed)
# D  = Deleted
# R  = Renamed
```

## `git log` — View history

```bash
# Full history
git log

# Compact view
git log --oneline

# With graph
git log --graph --oneline --all

# Last 3 commits
git log -3

# History of a specific file
git log --oneline -- file.txt

# Who changed what
git log -p
```

## `git diff` — View changes

```bash
# Working Directory vs Staging Area
git diff

# Staging Area vs Last Commit
git diff --staged

# Between two commits
git diff commit1..commit2

# Diff of a specific file
git diff -- file.txt
```

---

# 4️⃣ Removing & Renaming Files

## `git rm` — Remove files

```bash
# Remove and stage
git rm file.txt

# Remove from staging only (keep working directory)
git rm --cached file.txt

# Remove all .log files
git rm *.log
```

## `git mv` — Rename files

```bash
# Rename a file
git mv old-name.txt new-name.txt

# This actually does:
# mv old-name.txt new-name.txt
# git rm old-name.txt
# git add new-name.txt
```

---

# 5️⃣ Undoing Changes

## `git restore`

```bash
# Discard changes in working directory (not staged)
git restore file.txt

# Unstage a staged file
git restore --staged file.txt

# Restore from a specific commit
git restore --source=HEAD~1 file.txt
```

## `git reset` — Undo commits

```bash
# Soft: Undo commit, keep changes staged
git reset --soft HEAD~1

# Mixed: Undo commit, keep changes unstaged (default)
git reset HEAD~1

# Hard: Undo commit AND discard changes (⚠️ careful!)
git reset --hard HEAD~1
```

## `git revert` — Undo with a new commit

```bash
# Revert a specific commit (creates new commit)
git revert commit-hash

# Revert the last commit
git revert HEAD
```

---

# 6️⃣ `.gitignore` — What NOT to Track

## Create `.gitignore` file

```bash
# Create .gitignore
touch .gitignore
```

## `.gitignore` Examples

```gitignore
# Compiled files
*.class
*.exe
*.dll
*.so
*.dylib

# Dependency directories
node_modules/
vendor/
venv/
env/

# IDE files
.vscode/
.idea/
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*

# Environment variables
.env
.env.local

# Build directories
dist/
build/
out/

# Specific files
config.json
secrets.txt
```