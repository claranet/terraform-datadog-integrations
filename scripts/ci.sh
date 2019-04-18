#!/bin/bash
set -xueo pipefail

for path in $(find -name 'inputs.tf' -print); do 
    dir=$(dirname ${path})
    terraform init ${dir} >> /dev/null 2>&1
    terraform validate -check-variables=false ${dir}
done

terraform fmt

