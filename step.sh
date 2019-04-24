#!/bin/bash
set -e

pushd $(mktemp -d)

git clone https://github.com/LucianoPAlmeida/variable-injector.git
cd variable-injector
git checkout ${variable_injector_version}
git checkout -b ${variable_injector_version}-branch

# Installing
make install

#Check verbose
VERBOSE=""

if [ ${verbose} = "true" ]; then

    VERBOSE="--verbose"
fi;

TEMP_DIR=$(pwd)
popd

variable-injector --file ${files} $VERBOSE --ignore ${vars_to_ignore} 