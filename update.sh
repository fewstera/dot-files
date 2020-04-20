#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
(cd $DIR && find . -name .\* -type f -print0 | xargs -0 -I % cp $HOME/% .)
