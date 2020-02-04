# A-Complete-Guide-To-Flutter
This repo contains all the source code posted on Medium and also contains all the projects which had been created till now.

All Tutorials plus additional snippets and shorter posts can be found on the [Medium Page](https://medium.com/boring-apps).

<a href='https://twitter.com/1rahulchandra1' target='_blank'><img height='36' style='border:0px;height:36px;' src='http://victoryoutreach.org/wp-content/uploads/2014/11/follow-us-on-twitter.png' border='0' alt='Follow us on Twitter' /></a>


## Contribution:
Please clone and star this repo to stay up to date on changes. If anyone, would like to contribute to it. You can open the issue and start contributing to it.

## Education:
All my brothers and sister, it is very important to understand that we are here to learn and excel in our professional life. So it's not really important from where we learn the stuff either from Youtube, Medium etc. If any one of you had some great website to share. Pls open an issue. I am looking forward to create the one of the **Biggest Repository On Flutter**, so that any one can learn from it.



## Tutorials

**001 - Building a Notes App in Flutter - UI example:** [Source]()- In this tutorial we break down the UI into Flutter Widgets, complete our layout and then tweak to get our final design to match our screenshots.



# Some Git Commands for Best Workflow Practices: 
You can follow the below workflow, if you are new to Git. 

## Initial setup
1. Fork the main A-Complete-Guide-To-Flutter
2. Clone this repo on your machine
3. Add the main repo as "upstream"
  * `git remote add upstream https://github.com/irahulcse/A-Complete-Guide-To-Flutter`

## Starting a new issue
1. Get the latest version of the project
  * `git fetch upstream`
  * `git checkout master`
  * `git pull upstream master`

2. Create a new branch starting from that newly updated main branch, and link it to your GitHub fork.
  * `git checkout -b MyNewIssue`
  * `git push --set-upstream origin MyNewIssue`

3. Make your changes, commit them, and push them to your fork
  * *make changes*
  * `git commit -a`
  * *write a good commit message*
  * `git push`

## Rebasing your branch
When there have been changes in the main repo that you want to get, the cleanest option is often to rebase your branch on top of the latest commits.

1. Get the latest commits and update your local master branch
  * `git fetch upstream`
  * `git checkout master`
  * `git pull upstream master`

2. Rebase your in-progress feature branch
  * `git checkout MyInProgressFeature`
  * `git rebase master`
  * `git push -f`

## Resetting a branch after you've messed it up
1. Make sure there isn't any work that you care about losing
2. Do a hard reset to the branch you want to restart from.
  * `git checkout MyMessedUpBranch`
  * `git reset --hard upstream/master`

## Adding a single commit from one branch to another branch
1. Find and copy the commit ID that you want to use
2. Cherry-pick that commit
  * `git checkout MyCleanBranch`
  * `git cherry-pick COMMIT_ID`
