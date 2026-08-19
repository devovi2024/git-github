# <i class="fas fa-code-branch"></i> What Is Feature Branching?

[![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)
[![DevOps](https://img.shields.io/badge/DevOps-0A0A0A?style=for-the-badge&logo=devops&logoColor=white)](https://www.atlassian.com/devops)

---

> **Feature branching** means creating a separate branch for each new feature, bug fix, or experiment you are working on — instead of committing directly to `main` (or `master`).

---

## <i class="fas fa-list"></i> Table of Contents

| Section | Topic |
|---------|-------|
| 3.1 | <i class="fas fa-code-branch"></i> Feature Branch |
| 3.2 | <i class="fas fa-question-circle"></i> Why Use Feature Branching? |
| 3.3 | <i class="fas fa-building"></i> Main Branch |
| 3.4 | <i class="fas fa-tools"></i> Feature Branch Creation |
| 3.5 | <i class="fas fa-bolt"></i> `git switch -c` |
| 3.6 | <i class="fas fa-tag"></i> Feature Branch Naming |
| 3.7 | <i class="fas fa-list-ul"></i> Common Branch Naming Convention |
| 3.8 | <i class="fas fa-sync-alt"></i> Complete Lifecycle |
| 3.9 | <i class="fas fa-pen"></i> Step-by-Step Example |
| 3.10 | <i class="fas fa-link"></i> Why Use `-u`? |
| 3.11 | <i class="fas fa-globe"></i> Local Branch vs Remote Branch |

---

## <i class="fas fa-code-branch"></i> Feature Branching Strategies

**Feature Branching** হলো Git-এর এমন একটি workflow যেখানে প্রতিটি নতুন feature, bug fix, বা development task-এর জন্য আলাদা branch তৈরি করে কাজ করা হয়.

*Feature Branching is a Git workflow where a separate branch is created for every new feature, bug fix, or development task.*

> <i class="fas fa-bolt"></i> **Keep the `main` branch stable** — do all new work in separate branches.

---

## <i class="fas fa-code-branch"></i> 3.1 Feature Branch

**<i class="fas fa-folder"></i> Project:** `my-project`  
**<i class="fas fa-code-branch"></i> Main branch:** `main`  
**<i class="fas fa-star"></i> New feature:** `User Login`

Instead of working directly on `main`:

```
main
   │
   └── feature/login
```

You write all login-related code in the `feature/login` branch.

When the work is finished:

```
feature/login
      │
      ↓
    main
```

<i class="fas fa-check-circle" style="color: #28a745;"></i> **Merge** it into `main`.

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> **Tip:** Isolating work in feature branches keeps `main` clean and deployable at all times.

---

## <i class="fas fa-question-circle"></i> 3.2 Why Use Feature Branching?

Imagine **3 developers** working on different features:

| <i class="fas fa-user"></i> Developer | <i class="fas fa-bullseye"></i> Feature |
|---------------|-----------|
| Developer 1 | Login |
| Developer 2 | Payment |
| Developer 3 | Dashboard |

### <i class="fas fa-times-circle" style="color: #dc3545;"></i> Without Feature Branching (Directly on `main`):

```
              main
          ↙    ↓    ↘
       Login Payment Dashboard
```

<i class="fas fa-exclamation-triangle" style="color: #ffc107;"></i> **High chance of code conflicts!**

### <i class="fas fa-check-circle" style="color: #28a745;"></i> With Feature Branching:

```
              main
             /    \
            /      \
  feature/login   feature/payment
        │               │
        ↓               ↓
   Developer 1     Developer 2
```

<i class="fas fa-check-circle" style="color: #28a745;"></i> Each developer can work **independently** on their own branch.

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> Feature branching reduces merge conflicts and enables parallel development.

---

## <i class="fas fa-building"></i> 3.3 Main Branch

The `main` branch is the **stable / production-ready** version of the project.

> <i class="fas fa-exclamation-triangle" style="color: #ffc107;"></i> **Never** do this:
> ```bash
> git checkout main
> # then modify code and commit <i class="fas fa-times" style="color: #dc3545;"></i>
> ```

### <i class="fas fa-check-circle" style="color: #28a745;"></i> Proper Workflow:

```
main
   ↓
create branch
   ↓
work
   ↓
test
   ↓
review
   ↓
merge
   ↓
main
```

> <i class="fas fa-lock" style="color: #28a745;"></i> **Golden Rule:** Never commit directly to `main`. Always use Pull Requests.

---

## <i class="fas fa-tools"></i> 3.4 Feature Branch Creation

**Step 1** — Get the latest `main`:

```bash
git switch main
git pull origin main
```

**Step 2** — Create the feature branch:

```bash
git switch -c feature/login
```

Now:

```
main
    │
    └── feature/login   ← You are here
```

**Check your current branch:**

```bash
git branch
```

**Output:**

```
* feature/login   ← You are here
  main
```

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> **Tip:** The `*` symbol indicates your current branch. Always create feature branches from the latest `main`.

---

## <i class="fas fa-bolt"></i> 3.5 `git switch -c`

This command:

```bash
git switch -c feature/login
```

1. <i class="fas fa-check-circle" style="color: #28a745;"></i> Creates a new branch
2. <i class="fas fa-check-circle" style="color: #28a745;"></i> Switches to that branch

**Equivalent old syntax:**

```bash
git checkout -b feature/login
```

> <i class="fas fa-rocket"></i> In modern Git, `git switch` is cleaner and more intuitive for branch operations.

---

## <i class="fas fa-tag"></i> 3.6 Feature Branch Naming

Branch names should be **meaningful**:

### <i class="fas fa-check-circle" style="color: #28a745;"></i> Good Examples:

```
<i class="fas fa-check" style="color: #28a745;"></i> feature/login
<i class="fas fa-check" style="color: #28a745;"></i> feature/user-profile
<i class="fas fa-check" style="color: #28a745;"></i> feature/payment
<i class="fas fa-check" style="color: #28a745;"></i> feature/search
<i class="fas fa-check" style="color: #28a745;"></i> feature/dashboard
<i class="fas fa-check" style="color: #28a745;"></i> feature/notification
```

### <i class="fas fa-times-circle" style="color: #dc3545;"></i> Bad Examples:

```
<i class="fas fa-times" style="color: #dc3545;"></i> test
<i class="fas fa-times" style="color: #dc3545;"></i> new
<i class="fas fa-times" style="color: #dc3545;"></i> abc
<i class="fas fa-times" style="color: #dc3545;"></i> mybranch
<i class="fas fa-times" style="color: #dc3545;"></i> work
<i class="fas fa-times" style="color: #dc3545;"></i> branch1
```

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> Descriptive names help team members understand the branch's purpose instantly.

---

## <i class="fas fa-list-ul"></i> 3.7 Common Branch Naming Convention

| <i class="fas fa-tag"></i> Type | <i class="fas fa-file-alt"></i> Examples |
|----------|-------------|
| **<i class="fas fa-star"></i> Feature** | `feature/login`, `feature/payment`, `feature/user-profile` |
| **<i class="fas fa-bug"></i> Bug Fix** | `fix/login-error`, `fix/payment-calculation`, `fix/navbar-mobile` |
| **<i class="fas fa-exclamation-triangle"></i> Hotfix** | `hotfix/payment-crash`, `hotfix/security-issue` |
| **<i class="fas fa-sync"></i> Refactoring** | `refactor/auth-service`, `refactor/database-layer` |
| **<i class="fas fa-book"></i> Documentation** | `docs/git-guide`, `docs/api-documentation` |

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> Using prefixes like `feature/`, `fix/`, `hotfix/` makes it easy to identify the type of work at a glance.

---

## <i class="fas fa-sync-alt"></i> 3.8 Complete Lifecycle of a Feature Branch

```
            main
              │
              │
      create feature branch
              │
              ↓
      feature/login
              │
      ┌───────┴────────┐
      ↓                ↓
   Coding            Testing
      │                │
      └───────┬────────┘
              ↓
            Commit
              ↓
            Push
              ↓
        Pull Request
              ↓
         Code Review
              ↓
            Merge
              ↓
            main
```

> <i class="fas fa-key"></i> **Key Steps:** Coding → Testing → Commit → Push → Pull Request → Code Review → Merge

---

## <i class="fas fa-pen"></i> 3.9 Step-by-Step Example

Building a **Login Feature**:

| Step | Action | Command |
|------|--------|---------|
| 1 <i class="fas fa-arrow-right"></i> | Go to `main` | `git switch main` |
| 2 <i class="fas fa-arrow-right"></i> | Get latest code | `git pull origin main` |
| 3 <i class="fas fa-arrow-right"></i> | Create feature branch | `git switch -c feature/login` |
| 4 <i class="fas fa-arrow-right"></i> | Write code | `login.html`, `login.js`, `auth.js` |
| 5 <i class="fas fa-arrow-right"></i> | Check status | `git status` |
| 6 <i class="fas fa-arrow-right"></i> | Stage changes | `git add .` |
| 7 <i class="fas fa-arrow-right"></i> | Commit | `git commit -m "Add user login feature"` |
| 8 <i class="fas fa-arrow-right"></i> | Push to remote | `git push -u origin feature/login` |

**Now on GitHub:**

```
<i class="fas fa-code-branch"></i> main
<i class="fas fa-code-branch"></i> feature/login
```

Both branches will exist.

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> **Pro Tip:** Always write clear, descriptive commit messages so team members understand what changed.

---

## <i class="fas fa-link"></i> 3.10 Why Use `-u`?

On the **first push**:

```bash
git push -u origin feature/login
```

| <i class="fas fa-cog"></i> Parameter | <i class="fas fa-info-circle"></i> Meaning |
|-----------|---------|
| `origin` | Remote repository |
| `feature/login` | Local branch |
| `-u` / `--set-upstream` | Creates tracking relationship |

After setting upstream, you can simply use:

```bash
git push   # <i class="fas fa-check" style="color: #28a745;"></i> No need to specify branch
git pull   # <i class="fas fa-check" style="color: #28a745;"></i> No need to specify branch
```

> <i class="fas fa-lightbulb" style="color: #ffc107;"></i> Without `-u`, you'd have to specify the remote and branch every time. `-u` saves time and reduces errors!

---

## <i class="fas fa-globe"></i> 3.11 Local Branch vs Remote Branch

| <i class="fas fa-map-marker-alt"></i> Location | <i class="fas fa-code-branch"></i> Branch |
|-------------|-----------|
| **Local** | `feature/login` |
| **Remote** | `origin/feature/login` |

> <i class="fas fa-exclamation-triangle" style="color: #ffc107;"></i> **Important:** They are **not** the same branch object!

```
<i class="fas fa-folder"></i> Local Repository
└── <i class="fas fa-code-branch"></i> feature/login

<i class="fas fa-cloud"></i> GitHub (Remote)
└── <i class="fas fa-code-branch"></i> origin/feature/login
```

> <i class="fas fa-lock" style="color: #28a745;"></i> **Remember:** The local branch is your **working copy**. The remote branch is the **shared version** on the server. Always keep them in sync with `pull` and `push`.

---

## <i class="fas fa-flag-checkered"></i> Summary

| <i class="fas fa-check-circle" style="color: #28a745;"></i> Do | <i class="fas fa-times-circle" style="color: #dc3545;"></i> Don't |
|-------|----------|
| Create feature branches for all new work | Commit directly to `main` |
| Use meaningful branch names | Use vague names like `test` or `new` |
| Keep `main` stable and deployable | Merge untested code |
| Use Pull Requests for code review | Skip code review |
| Sync local and remote branches | Forget to push or pull |
| Write clear commit messages | Write vague messages like "update" |

---

## <i class="fas fa-book"></i> References

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)
- [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials)
- [Pro Git Book](https://git-scm.com/book/en/v2)

---

## <i class="fas fa-tags"></i> Tags

`#Git` `#FeatureBranching` `#DevOps` `#VersionControl` `#Collaboration` `#GitHub` `#Workflow`

---

*<i class="fas fa-calendar-alt"></i> Last Updated: 2026*

---

> <i class="fas fa-star" style="color: #ffc107;"></i> **Found this helpful?** Star this guide and share it with your team!