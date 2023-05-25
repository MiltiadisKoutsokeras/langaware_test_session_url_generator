#!/usr/bin/env bash

################################################################################
# LANGaware (https://langaware.com/)
# Authors:
# Miltiadis Koutsokeras <miltos@langaware.com>
################################################################################

### Script setup
_SELF_="$(basename "$(readlink -e "${BASH_SOURCE[0]}")" && echo X)" && \
readonly _SELF_="${_SELF_%$'\nX'}"
_SELFDIR_="$(dirname "$(readlink -e "${BASH_SOURCE[0]}")" && echo X)" && \
readonly _SELFDIR_="${_SELFDIR_%$'\nX'}"

### Includes
# Nothing

### Constants
readonly REPO_NAME_PLACEHOLDER="__REPO_NAME__"
readonly REPO_DESCRIPTION_PLACEHOLDER="__REPO_DESCRIPTION__"
readonly REPO_AUTHOR_PLACEHOLDER="__REPO_AUTHOR__"

### Global variables
# Nothing

### Functions
echo_red_bold() {
  echo -e "\\e[1m\\e[31m${*}\\e[0m"
}

echo_green_bold() {
  echo -e "\\e[1m\\e[32m${*}\\e[0m"
}

################################################################################
# Main program

# Check environment variables
if [ '' = "${PROJECT_REQUIRED_PREFIX}" ]
then
    echo_red_bold "PROJECT_REQUIRED_PREFIX is empty!"
    exit 1
fi
if [ '' = "${REPO_NAME}" ]
then
    echo_red_bold "REPO_NAME is empty!"
    exit 1
fi
if [[ ! "${REPO_NAME}" =~ ^${PROJECT_REQUIRED_PREFIX}.* ]]
then
    echo_red_bold "REPO_NAME does not start with ${PROJECT_REQUIRED_PREFIX}!"
    exit 1
fi
if [[ ! "${REPO_NAME}" =~ ^${PROJECT_REQUIRED_PREFIX}[a-z_]+$ ]]
then
    echo_red_bold "REPO_NAME contains characters that are not suitable! Please \
use only lowercase letters and undescores (_)"
    exit 1
fi
if [ '' = "${REPO_AUTHOR}" ]
then
    echo_red_bold "REPO_AUTHOR is empty!"
    exit 1
fi

# Replace placeholders in template with environment variables values
echo_green_bold "Replacing placeholder strings in files"
for filename in $(git ls-files)
do
    sed --in-place "s/${REPO_AUTHOR_PLACEHOLDER}/${REPO_AUTHOR}/g" \
"${filename}" || echo "No ${REPO_AUTHOR_PLACEHOLDER} change in file ${filename}"
    sed --in-place "s/${REPO_NAME_PLACEHOLDER}/${REPO_NAME}/g" "${filename}" \
|| echo "No ${REPO_NAME_PLACEHOLDER} change in file ${filename}"
    sed --in-place "s/${REPO_DESCRIPTION_PLACEHOLDER}/${REPO_DESCRIPTION}/g" \
"${filename}" \
|| echo "No ${REPO_DESCRIPTION_PLACEHOLDER} change in file ${filename}"
done
echo "Replaced placeholders successfully!"

# Rename placeholder files
echo_green_bold "Renaming placeholder files"
for filename in $(git ls-files)
do
    dirname="$(dirname "${filename}")"
    basename="$(basename "${filename}")"
    if [ "${basename}" = "${REPO_NAME_PLACEHOLDER}" ]
    then
        git mv "${filename}" "${dirname}/${REPO_NAME}" && \
echo "Renamed ${filename} to ${dirname}/${REPO_NAME}"
    fi
done

# Rename placeholder folders
git mv "${REPO_NAME_PLACEHOLDER}" "${REPO_NAME}"

# Create README.md
cat <<EOF > "README.md"
# ${REPO_NAME}

## General

${REPO_DESCRIPTION}

## Development instructions

Read the file [CONTRIBUTING.md](CONTRIBUTING.md)
EOF

# Remove renaming GitHub Action workflow, not needed in new project
git rm -f "${_SELFDIR_}/../workflows/create-project.yaml"

# Remove self, not needed in new project
git rm -f "${_SELFDIR_}/${_SELF_}"

################################################################################
