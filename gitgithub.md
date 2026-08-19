# Git Commands So Far

## 1. Open WSL

wsl


## 2. Go to Project

cd /mnt/e/git-github


## 3. Check GitHub Repository

git remote -v


## 4. Check Repository Status

git status


## 5. Get Latest Code from GitHub

git pull


## 6. Stage Changes

git add .


## 7. Commit Changes

git commit -m "Update Git notes and files"


## 8. Push Changes to GitHub

git push


## 9. Remove Saved GitHub Credential

printf "protocol=https\nhost=github.com\n\n" | git credential reject


## Complete Workflow

wsl
cd /mnt/e/git-github
git status
git pull
git add .
git commit -m "Update Git notes and files"
git push


## GitHub Authentication

Username → GitHub username
Password → GitHub Personal Access Token (PAT)


GitHub → Local
git pull

Local → Staging
git add .

Staging → Local Repository
git commit

Local Repository → GitHub
git push