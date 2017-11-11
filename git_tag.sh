#!/bin/bash
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
GIT_TAG=$TRAVIS_BRANCH-$TRAVIS_BUILD_NUMBER
git tag $GIT_TAG -a -m "Generated tag from TravisCI"
git push -q https://$GITHUB_TOKEN@github.com/$TRAVIS_REPO_SLUG --tags