#!/bin/bash
# set -ex

# Input values for test purpose
# export UNUSED_MARKER="$"
# export UPDATE_AVAILABLE_MARKER="#"
# export MAIN_VERSION_AVAILABLE_MARKER="@"

echo "Building Stats: "
echo "- Unused Marker: ${UNUSED_MARKER}"
echo "- Update Available Marker: ${UPDATE_AVAILABLE_MARKER}"
echo "- Main Version Update Marker: ${MAIN_VERSION_AVAILABLE_MARKER}"

function markOldPods() {
    local LINES=$(echo "$STATS" | wc -l)
    local PATTERN='[0-9][^`) ]*'
    local MAIN_PATTERN='[^.]*'
    echo "$STATS" | while true; do
        read POD
        if [[ -z ${POD}  && ${LINES} -lt 1 ]]; then
            echo "$STATS"
            break;
        fi
        LINES=$LINES-1
        VERSIONS=($(echo "$POD" | grep -Eo "$PATTERN"))
        if [ -z ${VERSIONS} ]; then
            continue
        fi
        if [ -z ${VERSIONS[0]} ]; then
            continue
        fi

        # If main version gets updated
        if [ ! -z ${VERSIONS[2]} ] && [ ${VERSIONS[0]} != ${VERSIONS[2]} ]; then
            EXISTING_MAIN_VERSION=($(echo "${VERSIONS[0]}" | grep -Eo "$MAIN_PATTERN"))
            LATEST_MAIN_VERSION=($(echo "${VERSIONS[2]}" | grep -Eo "$MAIN_PATTERN"))
            if [ ${LATEST_MAIN_VERSION} != ${EXISTING_MAIN_VERSION} ]; then
                STR="${POD}"
                STR_WITH="${POD} ${MAIN_VERSION_AVAILABLE_MARKER}"
                STATS="${STATS//$STR/$STR_WITH}"
                continue
            fi
        fi
        
        if [ -z ${VERSIONS[1]} ]; then
            continue
        fi
        # If minor version gets updated
        if [ ${VERSIONS[0]} != ${VERSIONS[1]} ] || [ ${VERSIONS[0]} != ${VERSIONS[2]} ]; then
            STR="${POD}"
            STR_WITH="${POD} ${UPDATE_AVAILABLE_MARKER}"
            STATS="${STATS//$STR/$STR_WITH}"
        fi
    done
}

function generatePodsStats() {
    local OUTPUT=$(bundle exec pod outdated)
    local SEARCH_STRING="Analyzing dependencies"
    local STATS=${OUTPUT#*$SEARCH_STRING}

    local STR='(unused)'
    local STR_WITH="${UNUSED_MARKER}"
    STATS=$(echo "${STATS//$STR/$STR_WITH}")

    STR=')'
    STR_WITH='`)'
    STATS=$(echo "${STATS//$STR/$STR_WITH}")

    STR='latest version '
    STR_WITH='latest version `'
    STATS=$(echo "${STATS//$STR/$STR_WITH}")

    STR=' ('
    STR_WITH='` ('
    STATS=$(echo "${STATS//$STR/$STR_WITH}")

    STR="${UNUSED_MARKER}\` "
    STR_WITH="\` ${UNUSED_MARKER} "
    STATS=$(echo "${STATS//$STR/$STR_WITH}")

    STATS=$(echo "$STATS" | sed -e 's/\([a-zA-Z][a-zA-Z]* \)\([0-9]\)/\1`\2/g')

    STATS=$(markOldPods "$STATS")
    STATS="${UNUSED_MARKER} = Unused library used
${UPDATE_AVAILABLE_MARKER} = New version available
${MAIN_VERSION_AVAILABLE_MARKER} = New main version available (Recomend Update)

    $STATS"
    echo "$STATS"
}
STATS=$(generatePodsStats)
echo "$STATS"
envman add --key PODS_USED_STATUS --value "${STATS}"
