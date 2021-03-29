#!/usr/bin/env bash

# A gerrit script to push all repositories from a manifest

# This again, will have to be adapted based on your setup.

cwd=$PWD
PROJECTS="$(grep 'styx' .repo/manifests/snippets/styx.xml | awk '{print $2}' | awk -F'"' '{print $2}' | uniq | grep -v caf)"
for project in ${PROJECTS}; do
    cd "$project" || exit
    git push -f -o skip-validation "$(git remote -v | head -1 | awk '{print $2}' | sed -e 's/https:\/\/github.com\/StyxProject/ssh:\/\/aashil123@gerrit.styxproject.tk:29418\/StyxProject/')" HEAD:refs/heads/R
    cd - || exit
done
cd "$cwd" || exit
