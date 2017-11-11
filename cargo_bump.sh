#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ] || [ "$TRAVIS_BRANCH" == "dev" ] ; then
    cargo install cargo-bump
    if [ "$TRAVIS_BRANCH" == "master" ]; then
        VERSION_BUMP=`cargo bump minor`
    else
        VERSION_BUMP=`cargo bump`
    fi
    COMMIT_MSG="[ci skip][$TRAVIS_BRANCH-$TRAVIS_BUILD_NUMBER] $VERSION_BUMP"
    git add Cargo.toml
    git commit -m "$COMMIT_MSG"
    git config --global user.email "builds@travis-ci.com"
    git config --global user.name "Travis CI"
    git push https://$GITHUB_TOKEN@github.com/$TRAVIS_REPO_SLUG HEAD:$TRAVIS_BRANCH
fi 