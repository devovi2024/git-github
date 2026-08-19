# <i class="fas fa-code-branch"></i> What Is Feature Branching?

[![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge\&logo=git\&logoColor=white)](https://git-scm.com/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge\&logo=github\&logoColor=white)](https://github.com/)
[![DevOps](https://img.shields.io/badge/DevOps-0A0A0A?style=for-the-badge\&logo=devops\&logoColor=white)](https://www.atlassian.com/devops)

---

> **Feature branching** means creating a separate branch for each new feature, bug fix, experiment, or development task instead of committing directly to `main`.

---

## <i class="fas fa-list"></i> Table of Contents

|  Section | Topic                                                             |
| :------: | ----------------------------------------------------------------- |
|  **3.1** | <i class="fas fa-code-branch"></i> Feature Branch                 |
|  **3.2** | <i class="fas fa-question-circle"></i> Why Use Feature Branching? |
|  **3.3** | <i class="fas fa-shield-alt"></i> Main Branch                     |
|  **3.4** | <i class="fas fa-plus-circle"></i> Feature Branch Creation        |
|  **3.5** | <i class="fas fa-bolt"></i> `git switch -c`                       |
|  **3.6** | <i class="fas fa-tag"></i> Feature Branch Naming                  |
|  **3.7** | <i class="fas fa-tags"></i> Common Branch Naming Convention       |
|  **3.8** | <i class="fas fa-sync-alt"></i> Complete Lifecycle                |
|  **3.9** | <i class="fas fa-terminal"></i> Step-by-Step Example              |
| **3.10** | <i class="fas fa-link"></i> Why Use `-u`?                         |
| **3.11** | <i class="fas fa-cloud"></i> Local Branch vs Remote Branch        |

---

## <i class="fas fa-code-branch"></i> Feature Branching Strategy

**Feature Branching** হলো Git-এর এমন একটি workflow যেখানে প্রতিটি নতুন feature, bug fix, experiment, অথবা development task-এর জন্য আলাদা branch তৈরি করে কাজ করা হয়।

*Feature branching is a Git workflow where each feature, bug fix, experiment, or development task is developed in its own isolated branch.*

### <i class="fas fa-lightbulb"></i> Core Idea

> **Keep `main` stable. Create a separate branch for every piece of work.**

```text
                         Git Repository
                              │
                              ▼
                            main
                              │
             ┌────────────────┼────────────────┐
             │                │                │
             ▼                ▼                ▼
       feature/login   feature/payment   feature/dashboard
             │                │                │
             ▼                ▼                ▼
        Developer 1      Developer 2      Developer 3
             │                │                │
             └────────────────┼────────────────┘
                              ▼
                       Pull Requests
                              │
                              ▼
                           Review
                              │
                              ▼
                            Merge
                              │
                              ▼
                            main
```

---

# <i class="fas fa-code-branch"></i> 3.1 Feature Branch

A **feature branch** is a separate Git branch created to develop a specific feature, fix, or task without modifying `main` directly.

### <i class="fas fa-folder-open"></i> Example Project

| Item                                              | Value           |
| :------------------------------------------------ | :-------------- |
| <i class="fas fa-folder"></i> Project             | `my-project`    |
| <i class="fas fa-code-branch"></i> Main Branch    | `main`          |
| <i class="fas fa-star"></i> Feature               | `User Login`    |
| <i class="fas fa-code-branch"></i> Feature Branch | `feature/login` |

Instead of working directly on `main`:

```text
main
```

Create:

```text
main
│
└── feature/login
```

All login-related development happens inside:

```text
feature/login
```

### <i class="fas fa-arrow-right"></i> After the Feature Is Complete

```text
feature/login
      │
      │ Pull Request
      ▼
     main
```

The feature branch is reviewed, tested, and then merged into `main`.

> <i class="fas fa-lightbulb"></i> **Tip:** Feature branches isolate changes and allow developers to work without destabilizing the stable branch.

---

# <i class="fas fa-question-circle"></i> 3.2 Why Use Feature Branching?

Imagine a team of three developers working on three different features.

| <i class="fas fa-user"></i> Developer | <i class="fas fa-tasks"></i> Task |
| :------------------------------------ | :-------------------------------- |
| Developer 1                           | User Login                        |
| Developer 2                           | Payment                           |
| Developer 3                           | Dashboard                         |

---

## <i class="fas fa-times-circle"></i> Without Feature Branching

Everyone works directly on `main`:

```text
                         main
                       /  |  \
                      /   |   \
                     ▼    ▼    ▼
                  Login Payment Dashboard
                     │    │    │
                     └────┼────┘
                          │
                     Same branch
```

This can cause:

* <i class="fas fa-exclamation-triangle"></i> Merge conflicts
* <i class="fas fa-exclamation-triangle"></i> Broken builds
* <i class="fas fa-exclamation-triangle"></i> Difficult code review
* <i class="fas fa-exclamation-triangle"></i> Unfinished code reaching `main`
* <i class="fas fa-exclamation-triangle"></i> Difficult rollback

---

## <i class="fas fa-check-circle"></i> With Feature Branching

Each developer gets an isolated branch:

```text
                              main
                                │
                ┌───────────────┼───────────────┐
                │               │               │
                ▼               ▼               ▼
         feature/login   feature/payment   feature/dashboard
                │               │               │
                ▼               ▼               ▼
          Developer 1     Developer 2     Developer 3
```

Each developer can work independently.

### <i class="fas fa-check"></i> Major Benefits

| Benefit                                               | Explanation                                     |
| :---------------------------------------------------- | :---------------------------------------------- |
| <i class="fas fa-lock"></i> **Isolation**             | Each task has its own development environment   |
| <i class="fas fa-users"></i> **Parallel Work**        | Multiple developers can work simultaneously     |
| <i class="fas fa-code"></i> **Clean Code Review**     | A Pull Request contains focused changes         |
| <i class="fas fa-shield-alt"></i> **Stable `main`**   | Unfinished work stays outside `main`            |
| <i class="fas fa-bug"></i> **Safer Debugging**        | Problems are easier to isolate                  |
| <i class="fas fa-undo"></i> **Easier Rollback**       | Individual features can be reverted more easily |
| <i class="fas fa-rocket"></i> **Controlled Releases** | Only approved work reaches `main`               |

> <i class="fas fa-lightbulb"></i> **Key Idea:** Feature branching enables parallel development while keeping the stable branch controlled.

---

# <i class="fas fa-shield-alt"></i> 3.3 Main Branch

The `main` branch generally represents the **stable, integrated, and potentially deployable version** of the project.

```text
main
│
├── Stable
├── Reviewed
├── Tested
└── Deployable
```

> <i class="fas fa-info-circle"></i> The exact protection rules depend on the team's workflow. Some teams may allow direct commits, but protected `main` + Pull Requests is a common professional practice.

---

## <i class="fas fa-times-circle"></i> Avoid Direct Feature Development on `main`

```bash
git switch main

# Modify application code

git add .
git commit -m "Add login feature"
git push origin main
```

This bypasses the normal review and isolation process.

---

## <i class="fas fa-check-circle"></i> Recommended Workflow

```text
                    main
                      │
                      ▼
              Create Feature Branch
                      │
                      ▼
               feature/login
                      │
                      ▼
                   Develop
                      │
                      ▼
                    Test
                      │
                      ▼
                   Commit
                      │
                      ▼
                    Push
                      │
                      ▼
              Pull Request
                      │
                      ▼
                Code Review
                      │
                      ▼
                CI / Tests
                      │
                      ▼
                    Merge
                      │
                      ▼
                    main
```

### <i class="fas fa-key"></i> Golden Rule

> **Do new development work on a dedicated branch and integrate it into `main` through the team's review process.**

---

# <i class="fas fa-plus-circle"></i> 3.4 Feature Branch Creation

Creating a feature branch usually follows three main steps.

---

## <i class="fas fa-arrow-right"></i> Step 1 — Switch to `main`

```bash
git switch main
```

---

## <i class="fas fa-download"></i> Step 2 — Get the Latest `main`

```bash
git pull origin main
```

This updates your local `main` with the latest changes from the remote repository.

---

## <i class="fas fa-code-branch"></i> Step 3 — Create the Feature Branch

```bash
git switch -c feature/login
```

Now:

```text
main
│
└── feature/login
          ▲
          │
       You are here
```

---

## <i class="fas fa-terminal"></i> Check Your Current Branch

```bash
git branch
```

Example output:

```text
* feature/login
  main
```

The `*` means:

> **This is the branch you are currently on.**

---

## <i class="fas fa-search"></i> Verify With `git status`

```bash
git status
```

Example:

```text
On branch feature/login
nothing to commit, working tree clean
```

> <i class="fas fa-lightbulb"></i> **Tip:** Always verify your current branch before modifying or committing code.

---

# <i class="fas fa-bolt"></i> 3.5 `git switch -c`

The command:

```bash
git switch -c feature/login
```

performs **two operations**.

### <i class="fas fa-plus"></i> Operation 1 — Create

It creates:

```text
feature/login
```

### <i class="fas fa-exchange-alt"></i> Operation 2 — Switch

It immediately moves you to:

```text
feature/login
```

### <i class="fas fa-project-diagram"></i> Concept

```text
git switch -c feature/login
        │
        ├── Create branch
        │
        └── Switch to branch
```

---

## <i class="fas fa-history"></i> Older Equivalent

Before `git switch`, developers commonly used:

```bash
git checkout -b feature/login
```

Both commands create and switch to a new branch.

### Modern Git

```bash
git switch -c feature/login
```

### Older Syntax

```bash
git checkout -b feature/login
```

> <i class="fas fa-rocket"></i> **Modern Git recommendation:** Use `git switch` for branch switching and branch creation because it clearly communicates the intent.

---

## <i class="fas fa-terminal"></i> Related Branch Commands

```bash
# List local branches
git branch

# Create a branch without switching
git branch feature/login

# Switch to an existing branch
git switch feature/login

# Create and switch
git switch -c feature/login

# Delete a merged local branch
git branch -d feature/login
```

---

# <i class="fas fa-tag"></i> 3.6 Feature Branch Naming

A branch name should clearly communicate **what the branch is doing**.

### <i class="fas fa-check-circle"></i> Good Examples

```text
feature/login
feature/user-profile
feature/payment
feature/search
feature/dashboard
feature/notification
feature/password-reset
feature/email-verification
feature/dark-mode
feature/user-settings
```

### <i class="fas fa-times-circle"></i> Bad Examples

```text
test
new
abc
mybranch
work
branch1
temp
new-feature
```

### <i class="fas fa-ruler"></i> Recommended Structure

```text
<type>/<short-description>
```

Examples:

```text
feature/login
fix/navbar-error
hotfix/payment-crash
refactor/auth-service
docs/git-guide
```

### <i class="fas fa-check"></i> Good Naming Characteristics

A good branch name should be:

* Short
* Descriptive
* Consistent
* Task-oriented
* Easy to understand
* Easy to search

> <i class="fas fa-lightbulb"></i> **Tip:** Someone should be able to understand the purpose of a branch just by reading its name.

---

# <i class="fas fa-tags"></i> 3.7 Common Branch Naming Convention

| <i class="fas fa-tag"></i> Type              | <i class="fas fa-info-circle"></i> Purpose            | <i class="fas fa-code-branch"></i> Examples                           |
| :------------------------------------------- | :---------------------------------------------------- | :-------------------------------------------------------------------- |
| <i class="fas fa-star"></i> **Feature**      | New functionality                                     | `feature/login`<br>`feature/payment`<br>`feature/user-profile`        |
| <i class="fas fa-bug"></i> **Fix**           | Normal bug fix                                        | `fix/login-error`<br>`fix/navbar-mobile`<br>`fix/payment-calculation` |
| <i class="fas fa-fire"></i> **Hotfix**       | Urgent production fix                                 | `hotfix/payment-crash`<br>`hotfix/security-issue`                     |
| <i class="fas fa-sync-alt"></i> **Refactor** | Code restructuring without changing intended behavior | `refactor/auth-service`<br>`refactor/database-layer`                  |
| <i class="fas fa-book"></i> **Docs**         | Documentation changes                                 | `docs/git-guide`<br>`docs/api-documentation`                          |
| <i class="fas fa-flask"></i> **Experiment**  | Temporary research or experimentation                 | `experiment/new-cache`<br>`experiment/new-ui`                         |
| <i class="fas fa-cog"></i> **Chore**         | Maintenance or tooling work                           | `chore/update-dependencies`<br>`chore/configure-ci`                   |
| <i class="fas fa-vial"></i> **Test**         | Test-related work                                     | `test/auth-flow`<br>`test/payment-service`                            |

> <i class="fas fa-lightbulb"></i> Prefixes make branch purpose immediately visible to the whole team.

---

# <i class="fas fa-sync-alt"></i> 3.8 Complete Lifecycle of a Feature Branch

```text
                              ┌─────────────┐
                              │    main     │
                              └──────┬──────┘
                                     │
                                     ▼
                         Create Feature Branch
                                     │
                                     ▼
                              ┌─────────────┐
                              │feature/login│
                              └──────┬──────┘
                                     │
                              ┌──────┴──────┐
                              │             │
                              ▼             ▼
                           Coding        Testing
                              │             │
                              └──────┬──────┘
                                     │
                                     ▼
                                  Commit
                                     │
                                     ▼
                                   Push
                                     │
                                     ▼
                            Pull Request
                                     │
                                     ▼
                              Code Review
                                     │
                                     ▼
                              CI / Tests
                                     │
                                     ▼
                                  Merge
                                     │
                                     ▼
                              ┌─────────────┐
                              │    main     │
                              └──────┬──────┘
                                     │
                                     ▼
                                  Deploy
```

### <i class="fas fa-list-ol"></i> Lifecycle Steps

|  Step  | Action                   |
| :----: | :----------------------- |
|  **1** | Create a feature branch  |
|  **2** | Develop the feature      |
|  **3** | Test the changes         |
|  **4** | Commit the changes       |
|  **5** | Push the branch          |
|  **6** | Open a Pull Request      |
|  **7** | Review the code          |
|  **8** | Run CI / automated tests |
|  **9** | Merge into `main`        |
| **10** | Deploy when appropriate  |
| **11** | Delete the merged branch |

### <i class="fas fa-key"></i> Core Flow

```text
Create
  ↓
Develop
  ↓
Test
  ↓
Commit
  ↓
Push
  ↓
Pull Request
  ↓
Review
  ↓
CI
  ↓
Merge
  ↓
Deploy
  ↓
Delete Branch
```

---

# <i class="fas fa-terminal"></i> 3.9 Step-by-Step Example

Let's build a **User Login Feature**.

---

## <i class="fas fa-1"></i> Step 1 — Switch to `main`

```bash
git switch main
```

---

## <i class="fas fa-2"></i> Step 2 — Update `main`

```bash
git pull origin main
```

---

## <i class="fas fa-3"></i> Step 3 — Create Feature Branch

```bash
git switch -c feature/login
```

Now:

```text
main
│
└── feature/login
          ▲
          │
       Working
```

---

## <i class="fas fa-4"></i> Step 4 — Write the Code

Example files:

```text
src/
├── components/
│   └── LoginForm.jsx
├── pages/
│   └── Login.jsx
└── services/
    └── auth.js
```

---

## <i class="fas fa-5"></i> Step 5 — Check Changes

```bash
git status
```

Example:

```text
On branch feature/login

Changes not staged for commit:
  modified:   src/pages/Login.jsx

Untracked files:
  src/components/LoginForm.jsx
  src/services/auth.js
```

---

## <i class="fas fa-6"></i> Step 6 — Stage Changes

```bash
git add .
```

Or stage specific files:

```bash
git add src/pages/Login.jsx
git add src/components/LoginForm.jsx
git add src/services/auth.js
```

---

## <i class="fas fa-7"></i> Step 7 — Commit

```bash
git commit -m "Add user login feature"
```

A good commit message explains what the commit does.

### <i class="fas fa-check"></i> Good

```text
Add user login feature
Fix mobile navbar layout
Update authentication service
Add payment validation
```

### <i class="fas fa-times"></i> Avoid

```text
update
changes
done
fix
work
test
```

---

## <i class="fas fa-8"></i> Step 8 — Push to GitHub

First push:

```bash
git push -u origin feature/login
```

Now the remote branch exists.

```text
Local                         Remote
────────────────────────────────────────
feature/login    ─────────►  origin/feature/login
```

---

## <i class="fas fa-code-branch"></i> GitHub Branches

GitHub will now contain:

```text
main
feature/login
```

The next step is normally:

```text
feature/login
      │
      ▼
Pull Request
      │
      ▼
Code Review
      │
      ▼
CI Checks
      │
      ▼
Merge
      │
      ▼
main
```

---

## <i class="fas fa-terminal"></i> Complete Command Sequence

```bash
git switch main
git pull origin main

git switch -c feature/login

# Write code
# Test code

git status
git add .
git commit -m "Add user login feature"

git push -u origin feature/login
```

> <i class="fas fa-lightbulb"></i> **Pro Tip:** Keep commits focused and write commit messages that explain the change clearly.

---

# <i class="fas fa-link"></i> 3.10 Why Use `-u`?

The first time you push a newly created local branch, you can use:

```bash
git push -u origin feature/login
```

The `-u` option is short for:

```text
--set-upstream
```

It establishes a tracking relationship between the local branch and its remote branch.

---

## <i class="fas fa-cogs"></i> Command Breakdown

```text
git push -u origin feature/login
│   │    │   │
│   │    │   └── Local branch
│   │    └────── Remote name
│   └─────────── Set upstream
└─────────────── Push
```

### Parameter Meaning

| Parameter       | Meaning                      |
| :-------------- | :--------------------------- |
| `git`           | Git command                  |
| `push`          | Upload local commits         |
| `-u`            | Set upstream/tracking branch |
| `origin`        | Remote repository name       |
| `feature/login` | Branch being pushed          |

---

## <i class="fas fa-arrow-up"></i> First Push

```bash
git push -u origin feature/login
```

Git creates:

```text
Local Branch
feature/login
      │
      │ tracking
      ▼
Remote Branch
origin/feature/login
```

---

## <i class="fas fa-redo"></i> Later Pushes

Once upstream is configured:

```bash
git push
```

Git already knows where to push.

Similarly:

```bash
git pull
```

Git knows which remote-tracking branch to use.

---

## <i class="fas fa-search"></i> Check Tracking Information

```bash
git branch -vv
```

Example:

```text
* feature/login  abc1234 [origin/feature/login] Add login feature
  main           def5678 [origin/main] Update project
```

The `[origin/feature/login]` part shows the tracking relationship.

> <i class="fas fa-lightbulb"></i> **Important:** `-u` is normally most useful on the first push of a new local branch.

---

# <i class="fas fa-cloud"></i> 3.11 Local Branch vs Remote Branch

A **local branch** and a **remote-tracking branch** are related but conceptually different.

| Location                                                    | Name                   | Meaning                                   |
| :---------------------------------------------------------- | :--------------------- | :---------------------------------------- |
| <i class="fas fa-laptop"></i> Local Repository              | `feature/login`        | Your local working branch                 |
| <i class="fas fa-cloud"></i> Remote Repository              | `feature/login`        | Branch stored on GitHub                   |
| <i class="fas fa-link"></i> Local Remote-Tracking Reference | `origin/feature/login` | Your local reference to the remote branch |

---

## <i class="fas fa-laptop"></i> Local Repository

Your local repository may contain:

```text
Local Repository
│
├── main
├── feature/login
├── feature/payment
└── feature/dashboard
```

You actively work on:

```text
feature/login
```

---

## <i class="fas fa-cloud"></i> GitHub Remote Repository

GitHub may contain:

```text
GitHub
│
├── main
├── feature/login
├── feature/payment
└── feature/dashboard
```

---

## <i class="fas fa-link"></i> Remote-Tracking Reference

Your local Git maintains references such as:

```text
origin/main
origin/feature/login
origin/feature/payment
origin/feature/dashboard
```

These are references to the remote branches as last known to your local repository.

---

## <i class="fas fa-project-diagram"></i> Complete Relationship

```text
┌───────────────────────────────────────┐
│           Local Repository            │
│                                       │
│  main                                 │
│  feature/login  ◄── You work here     │
│                                       │
│  origin/main                           │
│  origin/feature/login ◄── Tracking    │
└───────────────────┬───────────────────┘
                    │
                    │ git push / git fetch
                    ▼
┌───────────────────────────────────────┐
│          GitHub Remote Repository     │
│                                       │
│  main                                 │
│  feature/login                        │
└───────────────────────────────────────┘
```

---

## <i class="fas fa-download"></i> `git fetch`

```bash
git fetch origin
```

This downloads information about remote changes without automatically merging those changes into your current working branch.

---

## <i class="fas fa-list"></i> List Remote Branches

```bash
git branch -r
```

Example:

```text
origin/main
origin/feature/login
origin/feature/payment
```

---

## <i class="fas fa-list-alt"></i> List All Branches

```bash
git branch -a
```

Example:

```text
* feature/login
  main
  remotes/origin/main
  remotes/origin/feature/login
  remotes/origin/feature/payment
```

---

# <i class="fas fa-sync-alt"></i> Keeping a Feature Branch Updated

While you are developing, other developers may merge changes into `main`.

Your branch might look like:

```text
A---B---C---D    main
     \
      E---F      feature/login
```

Your feature branch is now behind `main`.

There are two common ways to integrate the latest `main` changes.

---

## <i class="fas fa-code-merge"></i> Option 1 — Merge

```bash
git switch feature/login
git fetch origin
git merge origin/main
```

Conceptually:

```text
A---B---C---D---------M    main
     \             /
      E---F-------/
```

The merge creates a merge commit when one is needed.

---

## <i class="fas fa-redo"></i> Option 2 — Rebase

```bash
git switch feature/login
git fetch origin
git rebase origin/main
```

Conceptually:

```text
A---B---C---D---E'---F'
                    ↑
              feature/login
```

Rebase moves your feature commits on top of the updated `main`.

> <i class="fas fa-exclamation-triangle"></i> **Important:** Rebase rewrites commit history. Be careful when rebasing branches that other developers are already using.

---

# <i class="fas fa-code-branch"></i> Feature Branch vs Main Branch

| <i class="fas fa-code-branch"></i> Feature Branch | <i class="fas fa-shield-alt"></i> Main Branch     |
| :------------------------------------------------ | :------------------------------------------------ |
| Used for specific development work                | Used for integrated stable code                   |
| Usually short-lived                               | Usually long-lived                                |
| Can contain work in progress                      | Should normally remain reliable                   |
| Created per task or feature                       | Central integration branch                        |
| Used before Pull Request                          | Receives approved changes                         |
| Frequently updated during development             | Carefully controlled                              |
| Eventually merged                                 | Usually deployed from or used as a release source |

---

# <i class="fas fa-users"></i> Feature Branching With Multiple Developers

Imagine three developers:

```text
                              main
                                │
               ┌────────────────┼────────────────┐
               │                │                │
               ▼                ▼                ▼
        feature/login   feature/payment   feature/dashboard
               │                │                │
               ▼                ▼                ▼
         Developer 1      Developer 2      Developer 3
               │                │                │
               ▼                ▼                ▼
          Pull Request     Pull Request     Pull Request
               │                │                │
               └────────────────┼────────────────┘
                                ▼
                         Code Review / CI
                                │
                                ▼
                              Merge
                                │
                                ▼
                              main
```

### <i class="fas fa-user"></i> Developer 1

```bash
git switch main
git pull origin main
git switch -c feature/login

# Develop
git add .
git commit -m "Add user login"

git push -u origin feature/login
```

### <i class="fas fa-user"></i> Developer 2

```bash
git switch main
git pull origin main
git switch -c feature/payment

# Develop
git add .
git commit -m "Add payment integration"

git push -u origin feature/payment
```

### <i class="fas fa-user"></i> Developer 3

```bash
git switch main
git pull origin main
git switch -c feature/dashboard

# Develop
git add .
git commit -m "Add dashboard"

git push -u origin feature/dashboard
```

---

# <i class="fas fa-trash-alt"></i> Deleting a Feature Branch

Once a feature has been merged, the branch may no longer be necessary.

## <i class="fas fa-laptop"></i> Delete Local Branch

```bash
git branch -d feature/login
```

The `-d` option safely deletes a branch that Git considers merged.

---

## <i class="fas fa-exclamation-triangle"></i> Force Delete

```bash
git branch -D feature/login
```

`-D` forces deletion even if Git detects unmerged commits.

> **Use `-D` carefully.** Unmerged commits may become difficult to recover if no other reference points to them.

---

## <i class="fas fa-cloud"></i> Delete Remote Branch

```bash
git push origin --delete feature/login
```

After deletion:

```text
Local
└── feature/login        ← deleted

GitHub
└── feature/login        ← deleted
```

The commits already merged into `main` remain part of `main`'s history.

---

# <i class="fas fa-shield-alt"></i> Branch Protection

In professional teams, `main` is commonly protected.

Typical protection rules can include:

```text
main
│
├── Pull Request required
├── Code review required
├── CI checks required
├── Force push blocked
└── Direct push restricted
```

The workflow becomes:

```text
Developer
    │
    ▼
Feature Branch
    │
    ▼
Push
    │
    ▼
Pull Request
    │
    ▼
Code Review
    │
    ▼
CI Checks
    │
    ▼
Approval
    │
    ▼
Merge
    │
    ▼
main
```

> <i class="fas fa-lock"></i> Branch protection reduces the chance of accidentally introducing unreviewed or failing changes into the stable branch.

---

# <i class="fas fa-exclamation-triangle"></i> Common Mistakes

## <i class="fas fa-times-circle"></i> 1. Creating a Branch From Outdated `main`

Avoid creating a branch before updating your local `main`.

### Better

```bash
git switch main
git pull origin main
git switch -c feature/login
```

---

## <i class="fas fa-times-circle"></i> 2. Working Directly on `main`

Avoid:

```bash
git switch main

# Modify files

git add .
git commit -m "Add login"
```

Instead:

```bash
git switch main
git pull origin main
git switch -c feature/login
```

---

## <i class="fas fa-times-circle"></i> 3. Using Vague Names

Avoid:

```text
test
new
abc
work
branch1
```

Prefer:

```text
feature/login
feature/payment
fix/navbar-mobile
refactor/auth-service
```

---

## <i class="fas fa-times-circle"></i> 4. Forgetting to Push

A local branch does not automatically appear on GitHub.

Use:

```bash
git push -u origin feature/login
```

---

## <i class="fas fa-times-circle"></i> 5. Forgetting to Update `main`

Before creating a new feature branch:

```bash
git switch main
git pull origin main
```

---

## <i class="fas fa-times-circle"></i> 6. Making One Huge Commit

Avoid:

```text
"Update everything"
```

Prefer focused commits:

```text
Add login form
Add login validation
Connect login API
Handle authentication errors
```

---

## <i class="fas fa-times-circle"></i> 7. Mixing Unrelated Work

Avoid putting these into one branch:

```text
feature/login
├── Login
├── Payment
├── Navbar redesign
└── Database migration
```

Prefer focused branches:

```text
feature/login
feature/payment
feature/navbar-redesign
chore/database-migration
```

---

# <i class="fas fa-terminal"></i> Essential Feature Branch Commands

```bash
# Show current branch
git branch

# Show status
git status

# Switch to main
git switch main

# Update main
git pull origin main

# Create a new feature branch
git switch -c feature/login

# Switch to existing branch
git switch feature/login

# Stage all changes
git add .

# Commit changes
git commit -m "Add user login feature"

# First push
git push -u origin feature/login

# Later pushes
git push

# Fetch remote information
git fetch origin

# Pull latest changes
git pull

# List remote branches
git branch -r

# List local and remote branches
git branch -a

# Show tracking information
git branch -vv

# Delete merged local branch
git branch -d feature/login

# Force-delete local branch
git branch -D feature/login

# Delete remote branch
git push origin --delete feature/login
```

---

# <i class="fas fa-project-diagram"></i> Complete Feature Branch Mental Model

```text
                         ┌─────────────────┐
                         │      main       │
                         │  Stable Code    │
                         └────────┬────────┘
                                  │
                                  │ switch -c
                                  ▼
                         ┌─────────────────┐
                         │ feature/login   │
                         │ Development     │
                         └────────┬────────┘
                                  │
                         ┌────────┴────────┐
                         │                 │
                         ▼                 ▼
                      Coding            Testing
                         │                 │
                         └────────┬────────┘
                                  │
                                  ▼
                               Commit
                                  │
                                  ▼
                                Push
                                  │
                                  ▼
                         ┌─────────────────┐
                         │     GitHub      │
                         │ feature/login   │
                         └────────┬────────┘
                                  │
                                  ▼
                           Pull Request
                                  │
                                  ▼
                            Code Review
                                  │
                                  ▼
                             CI Checks
                                  │
                                  ▼
                               Merge
                                  │
                                  ▼
                         ┌─────────────────┐
                         │      main       │
                         │ Integrated Code │
                         └────────┬────────┘
                                  │
                                  ▼
                               Deploy
```

---

# <i class="fas fa-key"></i> Golden Rules of Feature Branching

> <i class="fas fa-check-circle"></i> **Rule 1:** Keep `main` stable.

> <i class="fas fa-check-circle"></i> **Rule 2:** Create a separate branch for each focused task.

> <i class="fas fa-check-circle"></i> **Rule 3:** Create the branch from the latest `main`.

> <i class="fas fa-check-circle"></i> **Rule 4:** Use meaningful branch names.

> <i class="fas fa-check-circle"></i> **Rule 5:** Keep commits small and logical.

> <i class="fas fa-check-circle"></i> **Rule 6:** Test your changes before creating or merging a Pull Request.

> <i class="fas fa-check-circle"></i> **Rule 7:** Push the feature branch to the remote repository.

> <i class="fas fa-check-circle"></i> **Rule 8:** Use Pull Requests for team integration.

> <i class="fas fa-check-circle"></i> **Rule 9:** Review and validate changes before merging.

> <i class="fas fa-check-circle"></i> **Rule 10:** Delete merged feature branches when they are no longer needed.

---

# <i class="fas fa-check-double"></i> Do & Don't

| <i class="fas fa-check-circle"></i> Do | <i class="fas fa-times-circle"></i> Don't |
| :------------------------------------- | :---------------------------------------- |
| Create a branch for new work           | Commit every feature directly to `main`   |
| Use meaningful names                   | Use `test`, `new`, or `abc`               |
| Update `main` before branching         | Start from outdated code                  |
| Keep branches focused                  | Mix unrelated tasks                       |
| Write clear commit messages            | Use vague messages like `update`          |
| Test before merging                    | Merge broken code                         |
| Use Pull Requests                      | Skip review in team workflows             |
| Keep branches synchronized             | Forget to push or fetch                   |
| Delete merged branches                 | Keep unnecessary stale branches           |
| Protect `main`                         | Allow uncontrolled changes                |

---

# <i class="fas fa-brain"></i> One-Line Definition

> **Feature Branching = One Task → One Branch → Develop → Test → Commit → Push → Pull Request → Review → CI → Merge → `main`.**

---

# <i class="fas fa-book"></i> References

* [Git Documentation](https://git-scm.com/doc)
* [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)
* [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)
* [Pro Git Book](https://git-scm.com/book/en/v2)

---

# <i class="fas fa-tags"></i> Tags

`#Git` `#FeatureBranching` `#GitWorkflow` `#DevOps` `#VersionControl` `#GitHub` `#Branching` `#Collaboration`

---

<p align="center">

<i class="fas fa-code-branch"></i>

**Feature Branching**

*Isolate → Develop → Review → Integrate*

<i class="fas fa-code-branch"></i>

</p>

---

<p align="center">

<i class="fas fa-calendar-alt"></i> **Last Updated: 2026**

</p>
