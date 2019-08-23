#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Update README.md for every integrations modules"

# download awk script to hack terraform-docs
TERRAFORM_AWK="/tmp/terraform-docs.awk"
curl -Lso ${TERRAFORM_AWK} "https://raw.githubusercontent.com/cloudposse/build-harness/master/bin/terraform-docs.awk"
# this is the pattern from where custom information is saved to be restored
PATTERN_DOC="Related documentation"

# loop over every modules
for module in $(browse_modules "$(get_scope ${1:-})" 'integrations-*.tf'); do
    echo -e "\t- Generate README.md for module: ${module}"
    cd ${module}
    EXIST=0
    if [ -f README.md ]; then
        mv README.md README.md.bak
        EXIST=1
    fi
    # module name from path
    module_space=$(list_dirs ${module})
    # module name with space as separator
    module_upper=${module_space^^}
    # module name with dash as separator
    module_dash=${module_space//[ ]/-}
    # module name with slash as separator
    module_slash=${module_space//[ ]/\/}

    # (re)generate README from scratch
    cat <<EOF > README.md
# ${module_upper} DataDog integration

## How to use this module

\`\`\`
module "datadog-integrations-${module_dash}" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//${module_slash}?ref={revision}"
EOF

    # if README already exist
    if [[ $EXIST -eq 1 ]]; then
        # take all custom config in declaration module example after "source" and until the end of block to restore it
        sed -n '/^[[:space:]]*source[[:space:]]*=.*/,/^\}/p' README.md.bak | tail -n +2 | head -n -1 >> README.md
    fi

    # close block and generate the next until list of integrations
    cat <<EOF >> README.md
}

\`\`\`

EOF
    # hack for terraform-docs with terraform 0.12 / HCL2 support
    tmp_tf=$(mktemp -d)
    awk -f ${TERRAFORM_AWK} ./*.tf > ${tmp_tf}/main.tf
    # auto generate terraform docs (inputs and outputs)
    terraform-docs --with-aggregate-type-defaults md table ${tmp_tf}/ >> README.md
    rm -fr ${tmp_tf}
    # if README does not exist
    if [[ $EXIST -eq 0 ]]; then
        # Simply add empty documentation section
        cat <<EOF >> README.md
## ${PATTERN_DOC}

EOF
    else
        # else restore the custom information saved before
        grep -Pzo --color=never ".*${PATTERN_DOC}(.*\n)*" README.md.bak | head -n -1 >> README.md
        rm -f README.md.bak
    fi
    # force unix format (I don't know why for now but you never know)
    dos2unix README.md 2> /dev/null
    cd - >> /dev/null
done
