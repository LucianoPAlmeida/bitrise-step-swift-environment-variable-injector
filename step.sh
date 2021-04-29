#!/bin/bash
set -e

pushd $(mktemp -d)

PLATFORM=$(uname -m)
TRIPLE=$PLATFORM-apple-macosx

wget https://github.com/LucianoPAlmeida/variable-injector/releases/download/${variable_injector_version}/$TRIPLE.zip

if [[ ! -e $TRIPLE.zip ]]; then
    echo "Release $variable_injector_version did not contain a pre-built binary targeting this architecture"
    exit 1
fi;

unzip $TRIPLE.zip
cp -f ./$TRIPLE/release/variable-injector /usr/local/bin/variable-injector

rm ./$TRIPLE.zip
rm -rf ./$TRIPLE
rm -rf ./__MACOSX/

# Check verbose
VERBOSE=""
IGNORE_PARAM=""
if [[ ${verbose} = "true" ]]; then
    VERBOSE="--verbose"
fi;

# Trim the string.
VARS_TO_IGNORE=`echo ${vars_to_ignore:-""}`
if [[ ! -z $VARS_TO_IGNORE ]]; then 
    IGNORE_PARAM="--ignore $VARS_TO_IGNORE"
fi;

TEMP_DIR=$(pwd)
popd

echo variable-injector --file ${files} $VERBOSE $IGNORE_PARAM
