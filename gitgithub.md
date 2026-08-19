# Git Commands So Far

1. Open WSL

wsl


2. Go to Project

cd /mnt/e/git-github


3. Check GitHub Repository

git remote -v


4. Check Repository Status

git status


5. Get Latest Code from GitHub

git pull


6. Get Latest Remote Information

git fetch


7. Check File Changes

git diff


8. Stage Changes

git add .


9. Check Staged Changes

git diff --staged


10. Commit Changes

git commit -m "Update Git notes and files"


11. Push Changes to GitHub

git push


12. Remove Saved GitHub Credential

printf "protocol=https\nhost=github.com\n\n" | git credential reject


Complete Workflow

wsl
cd /mnt/e/git-github
git status
git pull
git diff
git add .
git diff --staged
git commit -m "Update Git notes and files"
git push


GitHub Authentication

Username → GitHub username
Password → GitHub Personal Access Token (PAT)


Git Workflow

GitHub
   ↓
git pull / git fetch
   ↓
Local Repository
   ↓
Edit Files
   ↓
git status
   ↓
git diff
   ↓
git add .
   ↓
git diff --staged
   ↓
git commit
   ↓
git push
   ↓
GitHub


Git Command Purpose

git status
→ Shows which files have changed

git diff
→ Shows what has changed

git add .
→ Stages all changes

git diff --staged
→ Shows changes ready to be committed

git commit
→ Saves changes to the local repository

git push
→ Sends local commits to GitHub

git pull
→ Gets changes from GitHub and updates the local branch

git fetch
→ Gets the latest information from GitHub without changing working files


GitHub Push Protection

Secret detected
       ↓
Push blocked
       ↓
Remove secret from commit history
       ↓
git reset origin/master
       ↓
Remove secret from file
       ↓
git add .
       ↓
git commit
       ↓
git push