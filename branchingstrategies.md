What Is Feature Branching? Feature branching means creating a separate branch for each new feature, bug fix, experiment working on. Instead of committing directly to main (or master)

## Feature Branching Strategies

Feature Branching হলো Git-এর এমন একটি workflow যেখানে প্রতিটি নতুন feature, bug fix, বা development task-এর জন্য আলাদা branch তৈরি করে কাজ করা হয়।

>Main branch-কে stable রেখে, আলাদা branch-এ নতুন কাজ করা।
3.1 Feature Branch
    ধরো তোমার project:
    my-project

    Main branch:
    main

    তুমি নতুন একটি feature বানাবে:
    User Login

    তাহলে সরাসরি main-এ কাজ না করে:
    main
    │
    └── feature/login
    এই feature/login branch-এ login-এর সব code লিখবে।
    
    কাজ শেষ হলে:
    feature/login
    │
    ↓
    main
    Merge করবে।

3.2 কেন Feature Branch ব্যবহার করা হয়?
    ধরো ৩ জন developer কাজ করছে:
    Developer 1 → Login
    Developer 2 → Payment
    Developer 3 → Dashboard
    সবাই যদি main branch-এ কাজ করে:
    main
    ↙    ↓    ↘
    Login Payment Dashboard

    তাহলে একে অপরের code-এর সাথে conflict হওয়ার সম্ভাবনা অনেক বেশি।

    Feature branching করলে:
    main
    /    \
    /      \
    feature/login   feature/payment
    │               │
    ↓               ↓
    Developer 1     Developer 2

    প্রতিটি developer নিজের branch-এ independently কাজ করতে পারে।

3.3 Main Branch
    main সাধারণত project-এর stable / production-ready branch হিসেবে ব্যবহৃত হয়।
    main সাধারণত project-এর stable / production-ready branch হিসেবে ব্যবহৃত হয়।

    তাই সাধারণত সরাসরি:
    git checkout main

    তারপর code modify করে commit করা ভালো practice নয়।
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

3.4 Feature Branch Creation
    প্রথমে latest main নিতে হবে:
    git switch main
    git pull origin main

    তারপর feature branch:
    git switch -c feature/login

    এখন:
    main
    │
    └── feature/login ← তুমি এখানে

    Check করতে:
    git branch

    Output:
    * feature/login
    main
    * চিহ্নটি current branch নির্দেশ করে।

3.5 git switch -c
    এই command:
    git switch -c feature/login
    1. নতুন branch তৈরি
    2. সেই branch-এ switch

    Equivalent old syntax:
    git checkout -b feature/login
    Modern Git-এ branch switching-এর জন্য git switch বেশি পরিষ্কার।

3.6 Feature Branch Naming
    Branch-এর নাম meaningful হওয়া উচিত।
    Good
    feature/login
    feature/user-profile
    feature/payment
    feature/search
    feature/dashboard
    feature/notification
    Bad
    test
    new
    abc
    mybranch
    work
    branch1

3.7 Common Branch Naming Convention
    একটি project-এ convention ব্যবহার করা ভালো।

    Feature
    feature/login
    feature/payment
    feature/user-profile
    Bug Fix
    fix/login-error
    fix/payment-calculation
    fix/navbar-mobile
    Hotfix
    hotfix/payment-crash
    hotfix/security-issue
    Refactoring
    refactor/auth-service
    refactor/database-layer
    Documentation
    docs/git-guide
    docs/api-documentation

3.8 Feature Branch-এর Complete Lifecycle
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

3.9 Step-by-Step Example
    ধরো তুমি login feature বানাচ্ছো।

    Step 1 — Main branch-এ যাও
    git switch main
    Step 2 — Latest code নাও
    git pull origin main
    Step 3 — Feature branch তৈরি করো
    git switch -c feature/login
    Step 4 — Code লিখো
    login.html
    login.js
    auth.js
    Step 5 — Status check
    git status
    Step 6 — Stage
    git add .
    Step 7 — Commit
    git commit -m *Add user login feature*
    Step 8 — Remote branch push
    git push -u origin feature/login

    এখন GitHub-এ:
    main
    feature/login
    দুটি branch থাকবে।

3.10 -u কেন ব্যবহার করি?
    প্রথমবার:
    git push -u origin feature/login
    এখানে:
    origin
    ↓
    remote repository

    feature/login
    ↓
    local branch

    -u বা --set-upstream local branch-এর সাথে remote branch-এর tracking relationship তৈরি করে।

    এরপর সাধারণত:
    git push
    এবং:
    git pull
    ব্যবহার করা যায়।

3.11 Local Branch vs Remote Branch

    টি খুব গুরুত্বপূর্ণ।
    Local:

    feature/login

    Remote:

    origin/feature/login

    দুটো technically একই branch object নয়।

    Local Repository
    └── feature/login

    GitHub
    └── origin/feature/login