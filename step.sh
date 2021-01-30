#!/bin/bash
set -e

pushd $(mktemp -d)
wget https://github.com/LucianoPAlmeida/variable-injector/releases/download/${variable_injector_version}/x86_64-apple-macosx.zip
unzip x86_64-apple-macosx.zip
cp -f ./x86_64-apple-macosx/release/variable-injector /usr/local/bin/variable-injector

rm ./x86_64-apple-macosx.zip
rm -rf ./x86_64-apple-macosx
rm -rf ./__MACOSX/

#Check verbose
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
