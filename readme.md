user@user-VirtualBox:~/devops-netology/branching$ git remote add origin https://github.com/FanisIbragimov/devops-netology.git
user@user-VirtualBox:~/devops-netology/branching$ git remote
origin
user@user-VirtualBox:~/devops-netology/branching$ git pull origin
From https://github.com/FanisIbragimov/devops-netology
 * [new branch]      fix        -> origin/fix
 * [new branch]      main       -> origin/main
You asked to pull from the remote 'origin', but did not specify
a branch. Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.
user@user-VirtualBox:~/devops-netology/branching$ git fetch origin
user@user-VirtualBox:~/devops-netology/branching$ git pull origin
You asked to pull from the remote 'origin', but did not specify
a branch. Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.
user@user-VirtualBox:~/devops-netology/branching$ ^C
user@user-VirtualBox:~/devops-netology/branching$ .git/config
bash: .git/config: No such file or directory
user@user-VirtualBox:~/devops-netology/branching$ nano .git/config
user@user-VirtualBox:~/devops-netology/branching$ 

user@user-VirtualBox:~/devops-netology/branching$ git push origin git-merge
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Counting objects: 12, done.
Compressing objects: 100% (12/12), done.
Writing objects: 100% (12/12), 1.15 KiB | 1.15 MiB/s, done.
Total 12 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 1 local object.
remote: 
remote: Create a pull request for 'git-merge' on GitHub by visiting:
remote:      https://github.com/FanisIbragimov/devops-netology/pull/new/git-merge
remote: 
To https://github.com/FanisIbragimov/devops-netology.git
 * [new branch]      git-merge -> git-merge
user@user-VirtualBox:~/devops-netology/branching$ git remote show origin
* remote origin
  Fetch URL: https://github.com/FanisIbragimov/devops-netology.git
  Push  URL: https://github.com/FanisIbragimov/devops-netology.git
  HEAD branch: main
  Remote branches:
    fix       tracked
    git-merge tracked
    main      tracked
  Local refs configured for 'git push':
    fix       pushes to fix       (fast-forwardable)
    git-merge pushes to git-merge (up to date)
    main      pushes to main      (local out of date)
user@user-VirtualBox:~/devops-netology/branching$ nano merge.sh
user@user-VirtualBox:~/devops-netology/branching$ git add merge.sh
user@user-VirtualBox:~/devops-netology/branching$ git commit -m "merge:use shift"
[git-merge 3f953aa] merge:use shift
 1 file changed, 4 insertions(+), 3 deletions(-)
user@user-VirtualBox:~/devops-netology/branching$ git push origin git-merge
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Counting objects: 4, done.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 459 bytes | 153.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/FanisIbragimov/devops-netology.git
   b231d49..3f953aa  git-merge -> git-merge
user@user-VirtualBox:~/devops-netology/branching$ git checkout main
Switched to branch 'main'
user@user-VirtualBox:~/devops-netology/branching$ nano rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git add rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git push origin main
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
To https://github.com/FanisIbragimov/devops-netology.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
user@user-VirtualBox:~/devops-netology/branching$ git status
On branch main
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   rebase.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.merge.sh.swp

user@user-VirtualBox:~/devops-netology/branching$ git fetch main
fatal: 'main' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
user@user-VirtualBox:~/devops-netology/branching$ git fetch origin
user@user-VirtualBox:~/devops-netology/branching$ git push origin master:master
error: src refspec master does not match any.
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
user@user-VirtualBox:~/devops-netology/branching$ git push origin main:main
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/FanisIbragimov/devops-netology.git/'
user@user-VirtualBox:~/devops-netology/branching$ git push origin main:main
Username for 'https://github.com': infanis@gmail.com	
Password for 'https://infanis@gmail.com@github.com': 
To https://github.com/FanisIbragimov/devops-netology.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
user@user-VirtualBox:~/devops-netology/branching$ git branch
  fix
  git-merge
* main
user@user-VirtualBox:~/devops-netology/branching$ git push -u origin main
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
To https://github.com/FanisIbragimov/devops-netology.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
user@user-VirtualBox:~/devops-netology/branching$ ^C
user@user-VirtualBox:~/devops-netology/branching$ git push -f origin main
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/FanisIbragimov/devops-netology.git
 + fb434c9...19e51bc main -> main (forced update)
user@user-VirtualBox:~/devops-netology/branching$ git status
On branch main
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   rebase.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.merge.sh.swp

user@user-VirtualBox:~/devops-netology/branching$ git commit -m "1
> git commit -m "1
[main 6bc8751] 1 git commit -m 1
 1 file changed, 4 insertions(+), 2 deletions(-)
user@user-VirtualBox:~/devops-netology/branching$ 
user@user-VirtualBox:~/devops-netology/branching$ git commit -m "1
git commit -m "1"
> git commit -m "1
git commit -m "1"
On branch main
Untracked files:
	../.merge.sh.swp

nothing added to commit but untracked files present
On branch main
Untracked files:
	../.merge.sh.swp

nothing added to commit but untracked files present
user@user-VirtualBox:~/devops-netology/branching$ git status
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.merge.sh.swp

nothing added to commit but untracked files present (use "git add" to track)
user@user-VirtualBox:~/devops-netology/branching$ git push -f origin main
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Counting objects: 4, done.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 397 bytes | 397.00 KiB/s, done.
Total 4 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/FanisIbragimov/devops-netology.git
   19e51bc..6bc8751  main -> main
user@user-VirtualBox:~/devops-netology/branching$ git log
commit 6bc8751ec7d7eea0712588a0874b806fab44d5c2 (HEAD -> main, origin/main)
Author: Fanis Ibragimov <infanis@gmail.com>
Date:   Thu Jul 22 17:59:47 2021 +0400

    1
    git commit -m 1

commit 19e51bc065797884c9f7f675aabf9e22929ed318
Author: Fanis Ibragimov <infanis@gmail.com>
Date:   Wed Jul 21 09:43:21 2021 +0400

    prepare for merge and rebase

commit 0308cd78b3a11dae895b3cc0c732f72f34731b24 (tag: v0.1, tag: v0.0)
Author: Fanis Ibragimov <infanis@gmail.com>
Date:   Fri Jul 16 07:45:19 2021 +0400

    Moved and deleted

commit ecd96dcc2c370c8e7dc0aeb056f411343ee024ce
Author: Fanis Ibragimov <infanis@gmail.com>
Date:   Fri Jul 16 07:21:40 2021 +0400

    Prepare to delete and move

commit 6cfb54bec26bba789e2953e931d58987b0ce9b4c
Author: Fanis Ibragimov <infanis@gmail.com>
Date:   Fri Jul 16 07:17:27 2021 +0400

    Added gitignore

commit 4b537f5c73f0bdc3679939eae4ea414517a9b8d3
Author: Fanis Ibragimov <infanis@gmail.com>
Date:   Thu Jul 15 08:11:13 2021 +0400

    First commit

commit 776cffe4fd9646898d3c9aaad739fe42a8e826dc
Author: FanisIbragimov <87299405+FanisIbragimov@users.noreply.github.com>
Date:   Mon Jul 12 11:12:40 2021 +0400

    Create README.md
user@user-VirtualBox:~/devops-netology/branching$ git checkout 19e51bc065797884c9f7f675aabf9e22929ed318
Note: checking out '19e51bc065797884c9f7f675aabf9e22929ed318'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 19e51bc prepare for merge and rebase
user@user-VirtualBox:~/devops-netology/branching$ git branch
* (HEAD detached at 19e51bc)
  fix
  git-merge
  main
user@user-VirtualBox:~/devops-netology/branching$ git checkout -b git-rebase
Switched to a new branch 'git-rebase'
user@user-VirtualBox:~/devops-netology/branching$ git status
On branch git-rebase
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.merge.sh.swp

nothing added to commit but untracked files present (use "git add" to track)
user@user-VirtualBox:~/devops-netology/branching$ nano rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git add rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git commit -m "git-rebase 1"
[git-rebase 484f60b] git-rebase 1
 1 file changed, 4 insertions(+), 2 deletions(-)
user@user-VirtualBox:~/devops-netology/branching$ nano rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git add rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git commit -m "git rebase 2"
[git-rebase 736463d] git rebase 2
 1 file changed, 1 insertion(+), 1 deletion(-)
user@user-VirtualBox:~/devops-netology/branching$ git push -f origin git-rebaseUsername for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Counting objects: 8, done.
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 771 bytes | 771.00 KiB/s, done.
Total 8 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 1 local object.
remote: 
remote: Create a pull request for 'git-rebase' on GitHub by visiting:
remote:      https://github.com/FanisIbragimov/devops-netology/pull/new/git-rebase
remote: 
To https://github.com/FanisIbragimov/devops-netology.git
 * [new branch]      git-rebase -> git-rebase
user@user-VirtualBox:~/devops-netology/branching$ git branch
  fix
  git-merge
* git-rebase
  main
user@user-VirtualBox:~/devops-netology/branching$ git checkout main
Switched to branch 'main'
user@user-VirtualBox:~/devops-netology/branching$ git merge git-merge
Merge made by the 'recursive' strategy.
 branching/merge.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
user@user-VirtualBox:~/devops-netology/branching$ git push
fatal: The current branch main has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin main

user@user-VirtualBox:~/devops-netology/branching$ git push --set-upstream origin git merge
error: src refspec git does not match any.
error: src refspec merge does not match any.
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
user@user-VirtualBox:~/devops-netology/branching$ git checkout git-merge
Switched to branch 'git-merge'
user@user-VirtualBox:~/devops-netology/branching$ git merge git-merge
Already up to date.
user@user-VirtualBox:~/devops-netology/branching$ git push
fatal: The current branch git-merge has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin git-merge

user@user-VirtualBox:~/devops-netology/branching$ git push -f origin git-merge
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Everything up-to-date
user@user-VirtualBox:~/devops-netology/branching$ git push'
> ^C
user@user-VirtualBox:~/devops-netology/branching$ 
user@user-VirtualBox:~/devops-netology/branching$ git push'
> git push'^C
user@user-VirtualBox:~/devops-netology/branching$ ^C
user@user-VirtualBox:~/devops-netology/branching$ git push
fatal: The current branch git-merge has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin git-merge

user@user-VirtualBox:~/devops-netology/branching$ git checkout master
error: pathspec 'master' did not match any file(s) known to git.
user@user-VirtualBox:~/devops-netology/branching$ git checkout main
Switched to branch 'main'
user@user-VirtualBox:~/devops-netology/branching$ git merge git-merge
Already up to date.
user@user-VirtualBox:~/devops-netology/branching$ git push
fatal: The current branch main has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin main

user@user-VirtualBox:~/devops-netology/branching$ git push - u origin -all
error: did you mean `--all` (with two dashes ?)
user@user-VirtualBox:~/devops-netology/branching$ git push -u origin --all
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Counting objects: 6, done.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 671 bytes | 671.00 KiB/s, done.
Total 6 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/FanisIbragimov/devops-netology.git
   4ab2d0f..50856ff  fix -> fix
   6bc8751..228bb9e  main -> main
Branch 'fix' set up to track remote branch 'fix' from 'origin'.
Branch 'git-merge' set up to track remote branch 'git-merge' from 'origin'.
Branch 'git-rebase' set up to track remote branch 'git-rebase' from 'origin'.
Branch 'main' set up to track remote branch 'main' from 'origin'.
user@user-VirtualBox:~/devops-netology/branching$ git checkout git-rebase
Switched to branch 'git-rebase'
Your branch is up to date with 'origin/git-rebase'.
user@user-VirtualBox:~/devops-netology/branching$ git rebase -i maim
fatal: Needed a single revision
invalid upstream 'maim'
user@user-VirtualBox:~/devops-netology/branching$ git rebase -i main
error: invalid line 2: fixup pick 736463d git rebase 2
You can fix this with 'git rebase --edit-todo' and then run 'git rebase --continue'.
Or you can abort the rebase with 'git rebase --abort'.
user@user-VirtualBox:~/devops-netology/branching$ git rebase --edit-todo
error: invalid line 2: fixup pick 736463d git rebase 2
error: unusable todo list: '.git/rebase-merge/git-rebase-todo'
user@user-VirtualBox:~/devops-netology/branching$ git rebase --continue
Auto-merging branching/rebase.sh
CONFLICT (content): Merge conflict in branching/rebase.sh
error: could not apply 484f60b... git-rebase 1

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

Could not apply 484f60b... git-rebase 1
user@user-VirtualBox:~/devops-netology/branching$ nano rebase.sh
Use "fg" to return to nano.

[5]+  Stopped                 nano rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ nano rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git add rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git rebase --continue
Auto-merging branching/rebase.sh
CONFLICT (content): Merge conflict in branching/rebase.sh
error: could not apply 736463d... git rebase 2

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

Could not apply 736463d... git rebase 2
user@user-VirtualBox:~/devops-netology/branching$ nano rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git add rebase.sh
user@user-VirtualBox:~/devops-netology/branching$ git rebase --continue
Successfully rebased and updated refs/heads/git-rebase.
user@user-VirtualBox:~/devops-netology/branching$ git push
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
To https://github.com/FanisIbragimov/devops-netology.git
 ! [rejected]        git-rebase -> git-rebase (non-fast-forward)
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
user@user-VirtualBox:~/devops-netology/branching$ git push -u origin git-rebaseUsername for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
To https://github.com/FanisIbragimov/devops-netology.git
 ! [rejected]        git-rebase -> git-rebase (non-fast-forward)
error: failed to push some refs to 'https://github.com/FanisIbragimov/devops-netology.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
user@user-VirtualBox:~/devops-netology/branching$ git push - u origin git-rebase -f
error: src refspec u does not match any.
error: src refspec origin does not match any.
error: failed to push some refs to '-'
user@user-VirtualBox:~/devops-netology/branching$ git push -u origin git-rebase -f
Username for 'https://github.com': infanis@gmail.com
Password for 'https://infanis@gmail.com@github.com': 
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/FanisIbragimov/devops-netology.git
 + 736463d...228bb9e git-rebase -> git-rebase (forced update)
Branch 'git-rebase' set up to track remote branch 'git-rebase' from 'origin'.
user@user-VirtualBox:~/devops-netology/branching$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
user@user-VirtualBox:~/devops-netology/branching$ git merge git-rebase
Already up to date.
user@user-VirtualBox:~/devops-netology/branching$ 


