# Outdated Libs Stats

This step will create report about versions of used libraries.


## Required Params and Sample Values

You need to pass these param, all are required:

### Inputs
- UNUSED_MARKER:                    ":ghost:"
- UPDATE_AVAILABLE_MARKER:          ":rocket:"
- MAIN_VERSION_AVAILABLE_MARKER:    ":fire:"

### Outputs
- USED_LIBS_STATUS

#### Sample Output
---
Pods Status:  

:ghost: = Unused library used  
:rocket: = New version available  
:fire: = New main version available (Recomend Update)  

The following pod updates are available:  
- DateToolsSwift 4.0.0 -> 4.0.0 (latest version 5.0.0) :fire:
- ECKit-Utils 1.2.2 -> 1.2.2 (latest version 3.1.0) :fire:
- ECNetworking 0.8.1 -> 0.8.1 (latest version 2.0.1) :fire:
- Firebase 8.0.0 ->  :ghost: (latest version 8.11.0) :rocket:
- FirebaseABTesting 8.8.0 -> 8.11.0 (latest version 8.11.0) :rocket:
- FirebaseAnalytics 8.0.0 -> 8.0.0 (latest version 8.11.0) :rocket:
- FirebaseCore 8.0.0 -> 8.0.0 (latest version 8.11.0) :rocket:
- FirebaseCoreDiagnostics 8.8.0 -> 8.11.0 (latest version 8.11.0) :rocket:
- FirebaseCrashlytics 8.0.0 -> 8.0.0 (latest version 8.11.0) :rocket:
- FirebaseInstallations 8.8.0 -> 8.11.0 (latest version 8.11.0) :rocket:
- FirebasePerformance 8.0.0 -> 8.0.0 (latest version 8.11.0) :rocket:
- FirebaseRemoteConfig 8.0.0 -> 8.0.0 (latest version 8.11.0) :rocket:
- GoogleAppMeasurement 8.0.0 -> 8.0.0 (latest version 8.11.0) :rocket:
- GoogleDataTransport 9.1.0 -> 9.1.2 (latest version 9.1.2) :rocket:
- GoogleUtilities 7.5.2 ->  :ghost: (latest version 7.7.0) :rocket:
- KeychainAccess 3.1.1 -> 3.1.1 (latest version 4.2.2) :fire:
- OHHTTPStubs 6.1.0 ->  :ghost: (latest version 9.1.0) :rocket:
- PromisesObjC 1.2.12 -> 1.2.12 (latest version 2.0.0) :fire:
- Protobuf 3.18.0 -> 3.19.4 (latest version 4.0.0-rc1) :fire:
- RAnalytics 5.3.0 -> 5.3.0 (latest version 9.1.1) :fire:
- RInAppMessaging 4.0.1 -> 4.0.1 (latest version 6.0.0) :fire:
- RLogger 1.2.1 -> 1.2.1 (latest version 2.0.0) :fire:
- RPushPNP 2.1.0 -> 2.1.0 (latest version 5.1.0) :fire:
- SDWebImage 5.0.2 -> 5.0.2 (latest version 5.12.3) :rocket:
- SnapshotTesting 1.8.2 -> 1.8.2 (latest version 1.9.0) :rocket:
- SwiftLint 0.41.0 -> 0.46.2 (latest version 0.46.2) :rocket:
- Swinject 2.8.0 -> 2.8.0 (latest version 2.8.1) :rocket:
- XMLMapper 1.6.1 -> 2.0.0 (latest version 2.0.0) :fire:
---

## How to use this Step

Add this in your bitrise.yml file and replace proper variables:

```
- git::https://github.com/EC-Mobile/bitrise-step-outdated-libs-stats.git@main:
    title: Outdated Libs Stats
    inputs:
    - UNUSED_MARKER: ":ghost:"
    - UPDATE_AVAILABLE_MARKER: ":rocket:"
    - MAIN_VERSION_AVAILABLE_MARKER: ":fire:"
```