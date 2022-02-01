# Outdated-Libs-Stats

This step will create report about versions of used libraries.


## Required Params and Sample Values

You need to pass these param, all are required:

### Normal Params
- UNUSED_MARKER:                    ":ghost:"
- UPDATE_AVAILABLE_MARKER:          ":rocket:"
- MAIN_VERSION_AVAILABLE_MARKER:    ":fire:"

## How to use this Step

Add this in your bitrise.yml file and replace proper variables:

```
- git::https://github.com/KageRiyuu/bitrise-step-outdated-libs-stats.git@main:
    title: Outdated Libs Stats
    inputs:
    - UNUSED_MARKER: ":ghost:"
    - UPDATE_AVAILABLE_MARKER: ":rocket:"
    - MAIN_VERSION_AVAILABLE_MARKER: ":fire:"
```