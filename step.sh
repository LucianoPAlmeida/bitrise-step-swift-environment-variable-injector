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

if [ ${verbose} = "true" ]; then

    VERBOSE="--verbose"
fi;

TEMP_DIR=$(pwd)
popd

variable-injector --file ${files} $VERBOSE --ignore ${vars_to_ignore} 