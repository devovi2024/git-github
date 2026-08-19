# Git Commands So Far

## 1. Open WSL

```bash
wsl
```

## 2. Go to Project

```bash
cd /mnt/e/git-github
```

## 3. Check GitHub Repository

```bash
git remote -v
```

## 4. Check Repository Status

```bash
git status
```

## 5. Get Latest Code from GitHub

```bash
git pull
```

## 6. Stage Changes

```bash
git add .
```

## 7. Commit Changes

```bash
git commit -m "Update Git notes and files"
```

## 8. Push Changes to GitHub

```bash
git push
```

## 9. Remove Saved GitHub Credential

```bash
printf "protocol=https\nhost=github.com\n\n" | git credential reject
```

## Complete Workflow

```bash
wsl
cd /mnt/e/git-github
git status
git pull
git add .
git commit -m "Update Git notes and files"
git push
```

## GitHub Authentication

```text
Username → GitHub username
Password → GitHub Personal Access Token (PAT)
```
