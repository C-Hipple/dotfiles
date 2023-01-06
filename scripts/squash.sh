BRANCH=`git rev-parse --abbrev-ref HEAD`
echo $BRANCH

# xargs is a simple way to strip any whitespace
# NOTE: This is not guaranteed to work if there is both a master and a main branch.
MAIN=`git branch -l master main | sed 's/^* //' | xargs`
echo $MAIN

git checkout $MAIN
git pull
git merge --squash $BRANCH
git stash
git checkout $BRANCH
git reset --hard "origin/$MAIN"
git stash pop
