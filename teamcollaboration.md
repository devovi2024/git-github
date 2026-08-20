Excellent choice! Here is a complete, single Markdown file for **Section 6: Team Collaboration Best Practices**. Save it as `team-collaboration.md`.

---

```markdown
# 🤝 Team Collaboration Best Practices - Complete Guide

This guide covers everything you need to know about collaborating effectively with a team using Git – from branching strategies to code reviews, CI/CD, and release management.

---

## 📚 Table of Contents

1. [Fork vs Branch Workflow](#1-fork-vs-branch-workflow)
2. [Pull Request (PR) Workflow](#2-pull-request-pr-workflow)
3. [Code Review Process](#3-code-review-process)
4. [Branch Protection Rules](#4-branch-protection-rules)
5. [Git Hooks for Collaboration](#5-git-hooks-for-collaboration)
6. [CI/CD Integration](#6-cicd-integration)
7. [Semantic Versioning](#7-semantic-versioning)
8. [Release Management](#8-release-management)
9. [Best Practices Summary](#9-best-practices-summary)
10. [Useful Commands](#10-useful-commands)

---

## 1. Fork vs Branch Workflow

### Branch Workflow (Most Common for Teams)
- Everyone works on the **same repository**.
- Each developer creates **feature branches** off `main`/`develop`.
- Changes are merged back via Pull Requests.

**Best for:** Small to medium-sized teams with trusted members.

```bash
# Workflow Example
git checkout -b feature/login-page
# ... make changes ...
git push origin feature/login-page
# Create a Pull Request on GitHub/GitLab
```

### Fork Workflow (Open Source / Public Projects)
- Each developer **forks** the main repository to their own GitHub account.
- They push changes to their fork and create a **Pull Request** to the original repository.
- Maintainers review and merge.

**Best for:** Open-source projects or when you have external contributors.

```bash
# Fork Workflow Example
# 1. Fork the repo on GitHub
# 2. Clone your fork
git clone https://github.com/your-username/project.git
# 3. Add upstream remote
git remote add upstream https://github.com/original-owner/project.git
# 4. Create feature branch
git checkout -b feature/bug-fix
# 5. Push to your fork
git push origin feature/bug-fix
# 6. Create a PR from your fork to the original repo
```

| Feature | Branch Workflow | Fork Workflow |
|---------|----------------|---------------|
| Access | Direct write access needed | Anyone can contribute |
| Review | Required via PR | Required via PR |
| Security | Less secure (direct access) | More secure |
| Best for | Internal teams | Open source / external contributors |

---

## 2. Pull Request (PR) Workflow

A Pull Request is a formal request to merge changes from one branch to another. It is the backbone of team collaboration.

### Step-by-Step PR Process:

```bash
# 1. Create a feature branch from main
git checkout main
git pull origin main
git checkout -b feature/new-feature

# 2. Make changes and commit
git add .
git commit -m "feat: add new feature"

# 3. Push to remote
git push origin feature/new-feature

# 4. Create a Pull Request on GitHub/GitLab/Bitbucket
# - Title: Clear summary of the change
# - Description: What, why, and how to test
# - Assign reviewers
# - Link issues (e.g., Closes #123)

# 5. After review and approval, merge the PR
# Options: Merge commit, Squash merge, Rebase merge
```

### PR Template Example:
```markdown
## Description
Brief description of what this PR does.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change

## How Has This Been Tested?
Describe the tests you ran.

## Checklist
- [ ] My code follows the style guidelines
- [ ] I have performed a self-review
- [ ] I have commented my code where needed
- [ ] I have updated the documentation

## Related Issues
Closes #123
```

### Merge Strategies for PRs:

| Strategy | Command | When to Use |
|----------|---------|-------------|
| **Merge Commit** | `git merge --no-ff` | Preserves exact history of feature branch |
| **Squash Merge** | `git merge --squash` | Clean, single commit for small features |
| **Rebase Merge** | `git rebase` + merge | Linear history, clean git log |

---

## 3. Code Review Process

### Why Code Review?
- Catch bugs early
- Share knowledge across the team
- Maintain code quality and consistency
- Ensure adherence to coding standards

### Best Practices for Reviewers:

1. **Be respectful** – Focus on the code, not the person.
2. **Be specific** – Point to exact lines and suggest improvements.
3. **Be timely** – Review PRs within 24 hours.
4. **Approve or request changes** – Don't leave ambiguous comments.
5. **Test the code** – If possible, pull the branch and run it.

### Best Practices for Authors:

1. **Keep PRs small** – Max 200–400 lines of changes.
2. **Write descriptive titles and descriptions**.
3. **Self-review before assigning** – Check for obvious mistakes.
4. **Respond to comments** – Explain or fix as needed.
5. **Keep it focused** – One feature/fix per PR.

### Review Checklist:
```markdown
- [ ] Code is clean and readable
- [ ] No commented-out code or debug statements
- [ ] Appropriate error handling
- [ ] Tests pass (CI is green)
- [ ] New features have tests
- [ ] Documentation is updated
- [ ] No sensitive data (API keys, secrets)
```

---

## 4. Branch Protection Rules

Branch protection rules prevent accidental changes to critical branches like `main`, `develop`, or `release`.

### GitHub Branch Protection Settings:

1. Go to **Repository Settings** → **Branches** → **Add rule**
2. Apply to: `main` or `develop`
3. Enable protection rules:

| Rule | Purpose |
|------|---------|
| **Require pull request reviews** | At least 1–2 approvals before merging |
| **Dismiss stale approvals** | New commits must be re-reviewed |
| **Require status checks** | CI must pass before merging |
| **Require branches to be up-to-date** | Must be merged with latest main |
| **Include administrators** | Even admins must follow rules |
| **Restrict who can push** | Only certain users/teams can push directly |
| **Allow force pushes** | Disable force push to main |
| **Require signed commits** | Ensures commits are verified |

### Example: Protect `main` Branch

```yaml
# GitHub Settings:
# 1. Require 1 approval
# 2. Require status checks (CI)
# 3. Require conversation resolution
# 4. Disable force push
# 5. Allow only specific users to merge
```

---

## 5. Git Hooks for Collaboration

Git hooks are scripts that run automatically before or after certain Git commands. They help enforce team policies.

### Common Git Hooks:

| Hook | Timing | Purpose |
|------|--------|---------|
| `pre-commit` | Before commit | Lint code, run tests, check formatting |
| `commit-msg` | Before commit | Enforce commit message format |
| `pre-push` | Before push | Run full test suite, block if tests fail |
| `post-commit` | After commit | Send notifications |
| `pre-receive` | On server before push | Validate commits on server side |

### Example: pre-commit Hook (`.git/hooks/pre-commit`)

```bash
#!/bin/sh
# Run ESLint on staged JS files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.js$')
if [ -n "$STAGED_FILES" ]; then
    npm run lint $STAGED_FILES
    if [ $? -ne 0 ]; then
        echo "Linting failed. Commit aborted."
        exit 1
    fi
fi
```

### Using Husky (For Node.js Projects)

```bash
npm install husky --save-dev
npx husky install
npx husky add .husky/pre-commit "npm run lint"
npx husky add .husky/commit-msg "npx commitlint -E HUSKY_GIT_PARAMS"
```

---

## 6. CI/CD Integration

CI/CD (Continuous Integration / Continuous Deployment) automates testing and deployment.

### Popular CI/CD Tools:

| Tool | Hosting | Features |
|------|---------|----------|
| **GitHub Actions** | GitHub | Free for public repos, YAML-based |
| **GitLab CI/CD** | GitLab | Integrated with GitLab |
| **Jenkins** | Self-hosted | Highly customizable |
| **CircleCI** | Cloud | Fast, good for open source |
| **Travis CI** | Cloud | Simple YAML configuration |

### GitHub Actions Workflow Example (`.github/workflows/ci.yml`):

```yaml
name: CI Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Run tests
      run: npm test
    
    - name: Build project
      run: npm run build
    
    - name: Upload coverage
      uses: codecov/codecov-action@v3
```

### CI Best Practices:

1. **Run tests on every push and PR** – Catch issues early.
2. **Run linters and formatters** – Enforce code style.
3. **Build the application** – Ensure it compiles.
4. **Deploy to staging** – Test in a production-like environment.
5. **Keep CI fast** – Under 10–15 minutes is ideal.

---

## 7. Semantic Versioning

Semantic Versioning (SemVer) is a versioning scheme that communicates the impact of changes.

### Version Format: `MAJOR.MINOR.PATCH`

| Part | Meaning | Example |
|------|---------|---------|
| **MAJOR** | Incompatible API changes | `2.0.0` → `3.0.0` |
| **MINOR** | Backward-compatible new features | `2.0.0` → `2.1.0` |
| **PATCH** | Backward-compatible bug fixes | `2.0.0` → `2.0.1` |

### Git Versioning Best Practices:

1. **Tag releases** – Use `git tag v1.2.3`.
2. **Use annotated tags** – `git tag -a v1.0.0 -m "Release v1.0.0"`.
3. **Push tags** – `git push origin --tags`.
4. **Automate version bumps** – Use tools like `standard-version` or `semantic-release`.

### Example: Creating a Release Tag

```bash
# Bump version (manual)
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0

# Or use automated tools
npx standard-version   # Updates version in package.json and creates tag
```

---

## 8. Release Management

Release management is the process of planning, scheduling, and controlling software builds.

### Common Release Strategies:

| Strategy | Description | Best For |
|----------|-------------|----------|
| **Release Branches** | `release/v1.0` branch for final testing | Large teams, complex releases |
| **Tag-based Releases** | Tag a commit on `main` | Simple, frequent releases |
| **Continuous Deployment** | Every merge to main is deployed | High maturity teams |
| **Scheduled Releases** | Monthly/quarterly releases | Enterprise software |

### Step-by-Step Release Process:

```bash
# 1. Create release branch
git checkout -b release/v1.0.0 develop

# 2. Final testing and bug fixes on release branch
git add .
git commit -m "fix: final bug fixes for release"

# 3. Merge to main
git checkout main
git merge --no-ff release/v1.0.0 -m "Release v1.0.0"

# 4. Tag the release
git tag -a v1.0.0 -m "Production release v1.0.0"

# 5. Merge back to develop
git checkout develop
git merge --no-ff release/v1.0.0

# 6. Push everything
git push origin main develop --tags

# 7. Delete release branch
git branch -d release/v1.0.0
```

### Release Checklist:
- [ ] All planned features are merged
- [ ] Tests are passing on release branch
- [ ] Documentation is updated
- [ ] Changelog is updated
- [ ] Version is bumped (SemVer)
- [ ] Release is tagged
- [ ] Deployed to production
- [ ] Smoke tests pass in production

---

## 9. Best Practices Summary

| Practice | Why? |
|----------|------|
| **Always create a PR for merging** | Enables code review and accountability |
| **Keep PRs small and focused** | Easier to review and test |
| **Use branch protection rules** | Protects main branch from bad code |
| **Require CI to pass** | Ensures quality before merging |
| **Review code thoroughly** | Catch bugs and share knowledge |
| **Use conventional commits** | Standardized commit messages (e.g., `feat:`, `fix:`) |
| **Tag releases semantically** | Clear versioning for users |
| **Automate repetitive tasks** | Save time and reduce human error |
| **Communicate openly** | Discuss major changes before implementing |
| **Document everything** | Keep README, CONTRIBUTING, and CHANGELOG updated |

---

## 10. Useful Commands

```bash
# Workflow Commands
git checkout -b feature/name         # Create feature branch
git push origin feature/name         # Push branch to remote
git branch -d feature/name           # Delete local branch
git push origin --delete feature/name # Delete remote branch

# Remote Management
git remote -v                        # List remotes
git remote add upstream <url>        # Add upstream remote (fork workflow)
git fetch upstream                   # Fetch upstream changes
git merge upstream/main              # Merge upstream into your branch

# PR Management (GitHub CLI)
gh pr create --title "Title" --body "Description"   # Create PR
gh pr list                          # List open PRs
gh pr review --approve <PR-number>  # Approve a PR

# Tags
git tag                              # List all tags
git tag -a v1.0.0 -m "message"       # Create annotated tag
git push origin v1.0.0              # Push specific tag
git push origin --tags              # Push all tags

# Git Hooks
git config core.hooksPath .githooks # Change hooks path
.git/hooks/pre-commit               # Example hook file

# Useful Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all"
```

---

## 🎯 Key Takeaways

1. ✅ Use **Pull Requests** for every change.
2. ✅ Enforce **code reviews** – at least 1 approval.
3. ✅ Protect `main` and `develop` branches.
4. ✅ Integrate **CI/CD** to automate testing.
5. ✅ Use **Semantic Versioning** for releases.
6. ✅ Keep **communication open** with your team.
7. ✅ Automate with **Git hooks** and **aliases**.
8. ✅ Choose the right **workflow** (branch vs fork) for your team.
9. ✅ Document everything – onboarding becomes easier.
10. ✅ Celebrate small wins and learn from mistakes together!

---

## 📚 References

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)
- [Semantic Versioning](https://semver.org/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Pro Git Book - Distributed Workflows](https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows)

---

