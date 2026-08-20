================================================================================
                  ADVANCED GIT WORKFLOWS
                  Complete Learning & Practice Repository
================================================================================

This is a comprehensive guide for learning and practicing advanced Git concepts
with hands-on examples and real-world scenarios.

================================================================================
TABLE OF CONTENTS
================================================================================

1.  Coverage
2.  Required Software
3.  Project Structure
4.  Quick Start
5.  Branching Strategy
6.  Cherry-Pick Operations
7.  Single-File Operations
8.  Merge vs Rebase
9.  Conflict Resolution Mastery
10. Team Collaboration Workflow
11. .gitignore File
12. Useful Git Commands
13. Common Issues & Solutions
14. Practice Challenges
15. References & Resources

================================================================================
1. COVERAGE
================================================================================

What you will learn in this repository:

    [X] Git Basics & Foundation
    [X] Feature Branching Strategies
    [X] Merge vs Rebase: Deep Dive
    [X] Cherry-Picking & Single-File Operations
    [X] Conflict Resolution Mastery
    [X] Team Collaboration Best Practices
    [X] Advanced Workflow Patterns
    [X] Tooling & Automation
    [X] Troubleshooting & Common Issues

================================================================================
2. REQUIRED SOFTWARE
================================================================================

    +------------------+---------------+
    | Tool             | Version       |
    +------------------+---------------+
    | Git              | 2.30+         |
    | VS Code          | Latest        |
    | Terminal / PowerShell | Any    |
    +------------------+---------------+

================================================================================
3. PROJECT STRUCTURE
================================================================================

    my-test/
    |-- README.md                  # This file
    |-- CHECKLIST.md               # Learning checklist
    |-- CONFLICT_NOTES.txt         # Conflict resolution notes
    |-- file.txt                   # Practice file
    |-- assignment_1_rahul.py      # Assignment example
    |-- assignment_1_sita.py       # Assignment example
    |-- conflict.txt               # Conflict practice file
    |-- .gitignore                 # Ignore file

================================================================================
4. QUICK START
================================================================================

Step 1: Clone the repository
------------------------------------------------------------
    git clone https://github.com/your-username/my-test.git
    cd my-test

Step 2: Configure your Git
------------------------------------------------------------
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"

Step 3: Create your first branch
------------------------------------------------------------
    git checkout -b feature/your-feature

================================================================================
5. BRANCHING STRATEGY
================================================================================

This repository uses the following branch model:

    main (Production)
    |
    |-- develop (Development)
    |   |
    |   |-- feature/student-rahul-assignment1
    |   |-- feature/student-sita-assignment1
    |   |-- feature/teacher-review-assignment1
    |
    |-- hotfix/urgent-bug-fix

Branch Naming Convention:

    +------------------+---------------------------+---------------------------+
    | Type             | Format                    | Example                   |
    +------------------+---------------------------+---------------------------+
    | Feature          | feature/<name>            | feature/login-page        |
    | Bugfix           | bugfix/<issue-id>         | bugfix/issue-123          |
    | Hotfix           | hotfix/<description>      | hotfix/security-patch     |
    | Assignment       | feature/student-<name>-<id>| feature/student-rahul-001 |
    +------------------+---------------------------+---------------------------+

================================================================================
6. CHERRY-PICK OPERATIONS
================================================================================

Bring a specific commit from another branch
------------------------------------------------------------
    git checkout main
    git cherry-pick <commit-hash>

Bring multiple commits at once
------------------------------------------------------------
    git cherry-pick hash1 hash2 hash3

Bring changes without committing
------------------------------------------------------------
    git cherry-pick -n <commit-hash>

Abort cherry-pick
------------------------------------------------------------
    git cherry-pick --abort

Continue cherry-pick after resolving conflict
------------------------------------------------------------
    git add <file>
    git cherry-pick --continue

================================================================================
7. SINGLE-FILE OPERATIONS
================================================================================

Bring a file from another branch
------------------------------------------------------------
    git checkout <branch-name> -- <filename>

Bring a file from an old commit
------------------------------------------------------------
    git checkout <commit-hash> -- <filename>

Unstage a file
------------------------------------------------------------
    git reset HEAD <filename>

Discard file changes
------------------------------------------------------------
    git checkout -- <filename>

Restore a file (Git 2.23+)
------------------------------------------------------------
    git restore <filename>
    git restore --staged <filename>

================================================================================
8. MERGE VS REBASE
================================================================================

Merge (Non-linear history)
------------------------------------------------------------
    git checkout main
    git merge feature-branch

Rebase (Linear history)
------------------------------------------------------------
    git checkout feature-branch
    git rebase main

Resolve rebase conflict
------------------------------------------------------------
    # Edit the file
    git add <file>
    git rebase --continue

Abort rebase
------------------------------------------------------------
    git rebase --abort

================================================================================
9. CONFLICT RESOLUTION MASTERY
================================================================================

Creating and Resolving Merge Conflict:

Step 1: Create conflict
------------------------------------------------------------
    git checkout main
    echo "Line 1" > conflict.txt
    echo "Line 2" >> conflict.txt
    echo "Line 3" >> conflict.txt
    git add conflict.txt
    git commit -m "add: conflict.txt in master"

    git checkout -b feature-conflict
    echo "Line 1" > conflict.txt
    echo "Feature Branch Line" >> conflict.txt
    echo "Line 3" >> conflict.txt
    git add conflict.txt
    git commit -m "update: changed middle line in feature branch"

    git checkout master
    echo "Line 1" > conflict.txt
    echo "Master Branch Line" >> conflict.txt
    echo "Line 3" >> conflict.txt
    git add conflict.txt
    git commit -m "update: changed middle line in master"

    git merge feature-conflict  # Conflict will occur

Step 2: View conflict file
------------------------------------------------------------
    <<<<<<< HEAD
    Master Branch Line
    =======
    Feature Branch Line
    >>>>>>> feature-conflict

Step 3: Resolve
------------------------------------------------------------
    # Edit the file (remove markers, keep desired changes)
    git add conflict.txt
    git commit -m "merge: resolved conflict in conflict.txt"

Conflict Resolution Commands:

    +----------------------+------------------------------------------+
    | Command              | Purpose                                  |
    +----------------------+------------------------------------------+
    | git status           | View conflicting files                   |
    | git diff             | View differences                         |
    | git mergetool        | Use GUI tool                             |
    | git add <file>       | Stage resolved file                      |
    | git merge --abort    | Abort merge                              |
    | git rebase --abort   | Abort rebase                             |
    | git cherry-pick --abort | Abort cherry-pick                    |
    | git checkout --ours <file> | Accept current version             |
    | git checkout --theirs <file> | Accept incoming version             |
    +----------------------+------------------------------------------+

================================================================================
10. TEAM COLLABORATION WORKFLOW
================================================================================

Student Assignment Submission
------------------------------------------------------------
    git checkout -b feature/student-rahul-assignment1
    echo "My Assignment Solution" > assignment_1_rahul.py
    git add assignment_1_rahul.py
    git commit -m "feat: assignment 1 submitted by Rahul"
    git push origin feature/student-rahul-assignment1

Teacher Review
------------------------------------------------------------
    git checkout -b feature/teacher-review
    git checkout feature/student-rahul-assignment1 -- assignment_1_rahul.py
    echo "# Review: Good work! Need minor fixes" >> assignment_1_rahul.py
    git add assignment_1_rahul.py
    git commit -m "review: added feedback for Rahul"
    git checkout main
    git cherry-pick <review-commit-hash>

Collecting Multiple Students' Work
------------------------------------------------------------
    git checkout main
    git checkout feature/student-rahul -- assignment_1_rahul.py
    git checkout feature/student-sita -- assignment_1_sita.py
    git checkout feature/student-ravi -- assignment_1_ravi.py
    git add .
    git commit -m "feat: collected all assignments"

================================================================================
11. .GITIGNORE FILE
================================================================================

    # Dependencies
    node_modules/
    vendor/
    __pycache__/

    # Log files
    *.log
    *.tmp

    # Environment files
    .env
    *.env

    # OS files
    .DS_Store
    Thumbs.db

    # IDE files
    .vscode/
    .idea/

================================================================================
12. USEFUL GIT COMMANDS SUMMARY
================================================================================

    +----------------------------+------------------------------------------+
    | Command                    | Purpose                                  |
    +----------------------------+------------------------------------------+
    | git init                   | Initialize new repository                |
    | git clone <url>            | Clone repository                         |
    | git add <file>             | Stage file                               |
    | git commit -m "msg"        | Commit changes                           |
    | git status                 | Check status                             |
    | git log --oneline --graph --all | View history                       |
    | git branch                 | List branches                            |
    | git checkout -b <branch>   | Create and switch to new branch          |
    | git checkout <branch>      | Switch to branch                         |
    | git merge <branch>         | Merge branch                             |
    | git rebase <branch>        | Rebase branch                            |
    | git cherry-pick <hash>     | Pick specific commit                     |
    | git reset HEAD~1           | Undo last commit                         |
    | git revert <hash>          | Revert commit changes                    |
    | git stash                  | Stash changes temporarily                |
    | git stash pop              | Apply stashed changes                    |
    | git fetch                  | Fetch remote updates                     |
    | git pull                   | Pull remote updates                      |
    | git branch -d <branch>     | Delete branch                            |
    | git branch -a              | List all branches (local + remote)       |
    | git log --merge            | Show commits causing conflicts           |
    | git diff --base <file>     | Compare with base version                |
    | git diff --ours <file>     | Compare with current version             |
    | git diff --theirs <file>   | Compare with incoming version            |
    +----------------------------+------------------------------------------+

================================================================================
13. COMMON ISSUES & SOLUTIONS
================================================================================

    +-------------------------------------+----------------------------------+
    | Issue                               | Solution                         |
    +-------------------------------------+----------------------------------+
    | fatal: not a git repository        | Run git init or clone correct    |
    |                                     | folder                           |
    | error: pathspec 'main' did not     | Check branch name (main vs       |
    | match                               | master)                          |
    | CONFLICT (content)                 | Edit conflict file, git add,     |
    |                                     | git commit                       |
    | Your branch is ahead of origin     | Run git push                     |
    | Permission denied (publickey)      | Set up SSH key or use HTTPS      |
    | fatal: refusing to merge           | Clean working directory          |
    | You have not concluded your merge  | Use merge --abort or --continue  |
    | error: cannot apply commit         | Resolve or abort cherry-pick     |
    +-------------------------------------+----------------------------------+

================================================================================
14. PRACTICE CHALLENGES
================================================================================

Challenge 1: Cherry-Pick
------------------------------------------------------------
    1. Create a feature branch with 3 commits
    2. Cherry-pick only the second commit to main

Challenge 2: Single-File Operation
------------------------------------------------------------
    1. Create a new file in feature branch
    2. Bring only that file to main

Challenge 3: Conflict Resolution
------------------------------------------------------------
    1. Change the same line in same file on two branches
    2. Merge and resolve the conflict

Challenge 4: Team Collaboration
------------------------------------------------------------
    1. Create 3 student branches
    2. Collect all assignments into main

Challenge 5: Rebase Conflict
------------------------------------------------------------
    1. Create two branches with conflicting changes
    2. Rebase and resolve conflicts

Challenge 6: Cherry-Pick Conflict
------------------------------------------------------------
    1. Create conflicting commits
    2. Cherry-pick and resolve conflicts

================================================================================
15. REFERENCES & RESOURCES
================================================================================

    Git Official Documentation
    https://git-scm.com/doc

    Pro Git Book
    https://git-scm.com/book/en/v2

    GitHub Flow
    https://guides.github.com/introduction/flow/

    Atlassian Git Tutorial
    https://www.atlassian.com/git/tutorials

    Git Cheat Sheet
    https://training.github.com/downloads/github-git-cheat-sheet/

================================================================================
16. CONTRIBUTORS
================================================================================

    Your Name - Initial work

================================================================================
17. LICENSE
================================================================================

    This project is created for educational purposes. You can use it for
    learning and practice.

================================================================================
                             HAPPY CODING!
================================================================================