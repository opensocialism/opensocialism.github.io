#!/usr/bin/env bash
set -e # halt script on error

JEKYLLBUILDOUTPUT="$(bundle exec jekyll build --source .)"
echo "${JEKYLLBUILDOUTPUT}"
if echo "${JEKYLLBUILDOUTPUT}" | grep -i -q "ERROR"; then
    printf '%s\n' 'An Error was found in the Jekyll build' >&2
    exit 1
fi
bundle exec 'htmlproofer ./_site --url-ignore=#,#0 --assume-extension'
