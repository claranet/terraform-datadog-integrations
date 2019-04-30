#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

## root README generator
# only keep current README from begining to "Integrations summary" section (delete integrations list)
sed -i '/### Integrations summary ###/q' README.md
# add a newline after listing section
echo >> README.md
# loop over all ready integrations sets on the repo
for path in $(find "$(get_scope $1)" -mindepth 1 \( -path './scripts' -o -path '*/\.*' \) -prune -o -type d -print | sort -fdbi); do
    # split path in directories
    directories=($(list_dirs $path))
    # loop over directories in path
    for i in $(seq 1 $((${#directories[@]}-1))); do
        ## add tabulation for every subdirectory
        echo -en "\t" >> README.md
    done
    # add link to list of integrations modules
    echo -en "- [$(basename ${path})](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/" >> README.md
    # add path to link
    for directory in "${directories[@]}"; do
        echo -en "${directory}/" >> README.md
    done
    # end of markdown link
    echo ")" >> README.md
done

# this is the pattern from where custom information is saved to be restored
PATTERN_DOC="Related documentation"

# loop over every integrations set readme
for path in $(find "$(get_scope $1)" -name 'integrations-*.tf' -print | sort -fdbi); do
    cd $(dirname $path)
    EXIST=0
    if [ -f README.md ]; then
        mv README.md README.md.bak
        EXIST=1
    fi
    # module name from path
    module=$(list_dirs $(dirname ${path}))
    # module name with space as separator
    module_space=${module^^}
    # module name with dash as separator
    module_dash=${module//[ ]/-}
    # module name with slash as separator
    module_slash=${module//[ ]/\/}

    # (re)generate README from scratch
    cat <<EOF > README.md
# ${module_space} DataDog integration

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
    # auto generate terraform docs (inputs and outputs)
    terraform-docs --with-aggregate-type-defaults md table ./ >> README.md
    # if README does not exist
    if [[ $EXIST -eq 0 ]]; then
        # Simply add empty documentation section
        cat <<EOF >> README.md
## ${PATTERN_DOC}

EOF
    else
        # else restore the custom information saved before
        grep -Pzo --color=never ".*${PATTERN_DOC}(.*\n)*" README.md.bak | head -n -1 >> README.md
        rm README.md.bak
    fi
    # force unix format (I don't know why for now but you never know)
    dos2unix README.md
    cd - >> /dev/null
done
