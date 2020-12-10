#!/bin/bash
# From https://medium.com/@martinomensio/how-to-host-reveal-js-slides-on-github-pages-and-have-a-tidy-repository-1a363944c38d

## Necessario solo per creare altri repository che puntano a revealjs tramite sottomodulo git

if [ -d .git ]; then
    echo "git repository already exits"
    exit 1
fi

# create your empty repository
git init

# create a submodule with reveal.js
# warning: use https submodule (not ssh) for making GitHub pages happy.
# It will initialise the submodules without problems.
git submodule add https://github.com/hakimel/reveal.js.git

# pick a released version, take a look https://github.com/hakimel/reveal.js/releases to select a valid tag
cd reveal.js && git checkout tags/4.1.0 && cd ..

# now you are ready to create your slides in your repository
