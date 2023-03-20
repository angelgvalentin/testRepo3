#!/bin/bash




# Checkout Source release Branch

# Name of the branch to level up from
echo "What branch are you leveling up from?"
read SOURCE_BRANCH

echo "checking out ${SOURCE_BRANCH}"
git checkout $SOURCE_BRANCH
git pull


# Name of the target branch we are leveling up
echo "What branch are you leveling up?"
read TARGET_BRANCH

echo "checking out ${TARGET_BRANCH}"
git checkout $TARGET_BRANCH
git pull


git checkout -b LEVEL_UP_BRANCH

echo "merging ${SOURCE_BRANCH} into LEVEL_UP_BRANCH"
git merge --no-ff -m "Leveled up the repository from ${SOURCE_BRANCH}" $SOURCE_BRANCH


echo "---------> Pushing to remote"
git push -v -u origin LEVEL_UP_BRANCH

echo "checking out ${TARGET_BRANCH}"
git checkout $TARGET_BRANCH

git branch -D LEVEL_UP_BRANCH