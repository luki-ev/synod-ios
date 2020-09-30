// 
// Copyright 2020 Vector Creations Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

/// BuildSettings provides settings computed at build time.
/// In future, it may be automatically generated from xcconfig files
@objcMembers
final class BuildSettings: NSObject {
    
    // MARK: - Bundle Settings
    static var bundleDisplayName: String {
        Bundle.app.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
    
    static var applicationGroupIdentifier: String {
        Bundle.app.object(forInfoDictionaryKey: "applicationGroupIdentifier") as! String
    }
    
    static var baseBundleIdentifier: String {
        Bundle.app.object(forInfoDictionaryKey: "baseBundleIdentifier") as! String
    }
    
    static var keychainAccessGroup: String {
        Bundle.app.object(forInfoDictionaryKey: "keychainAccessGroup") as! String
    }
    
    static var pushKitAppIdProd: String {
        return baseBundleIdentifier
    }
    
    static var pushKitAppIdDev: String {
        return baseBundleIdentifier + ".ios.voip.dev"
    }
    
    static var pusherAppIdProd: String {
        return baseBundleIdentifier + ".ios.prod"
    }
    
    static var pusherAppIdDev: String {
        return baseBundleIdentifier + ".ios.dev"
    }
    
    static var pushKitAppId: String {
        #if DEBUG
        return pushKitAppIdDev
        #else
        return pushKitAppIdProd
        #endif
    }
    
    static var pusherAppId: String {
        #if DEBUG
        return pusherAppIdDev
        #else
        return pusherAppIdProd
        #endif
    }
    
    // Element-Web instance for the app
    static let applicationWebAppUrlString = "https://web.synod.im"
    
    
    // MARK: - Server configuration
    
    // Default servers proposed on the authentication screen
    static let serverConfigDefaultHomeserverUrlString = "https://synod.im"
    static let serverConfigDefaultIdentityServerUrlString = "https://id.synod.im"
    
    static let serverConfigSygnalAPIUrlString = "https://push.synod.im/_matrix/push/v1/notify"
    
    
    // MARK: - Legal URLs
    static let applicationCopyrightUrlString = "https://synod.im/terms"
    static let applicationPrivacyPolicyUrlString = "https://synod.im/privacy"
    static let applicationTermsConditionsUrlString = "https://synod.im/terms"
    
    
    // MARk: - Matrix permalinks
    // Paths for URLs that will considered as Matrix permalinks. Those permalinks are opened within the app
    static let matrixPermalinkPaths: [String: [String]] = [
        // Official Matrix ones
        "matrix.to": ["/"],
        "www.matrix.to": ["/"],
    ]
    
    
    // MARK: - VoIP
    static var allowVoIPUsage: Bool {
        #if canImport(JitsiMeet)
        return true
        #else
        return false
        #endif
    }
    static let stunServerFallbackUrlString: String? = "stun:turn.jitsi.luki.org"
    
    
    // MARK: -  Public rooms Directory
    static let publicRoomsShowDirectory: Bool = true
    static let publicRoomsAllowServerChange: Bool = true
    // List of homeservers for the public rooms directory
    static let publicRoomsDirectoryServers = [
        "synod.im"
    ]
    
    
    // MARK: - Analytics
    static let analyticsServerUrl = URL(string: "https://synod.im/piwik.php")
    static let analyticsAppId = "1"
    
    
    // MARK: - Bug report
    static let bugReportEndpointUrlString = "https://synod.im/bugreports"
    // Use the name allocated by the bug report server
    static let bugReportApplicationId = "synod-ios"
    
    
    // MARK: - Integrations
    static let integrationsUiUrlString = "https://dimension.synod.im/riot"
    static let integrationsRestApiUrlString = "https://dimension.synod.im/api/v1/scalar"
    // Widgets in those paths require a scalar token
    static let integrationsScalarWidgetsPaths = [
        "https://dimension.synod.im/widgets",
    ]
    // Jitsi server used outside integrations to create conference calls from the call button in the timeline
    static let jitsiServerUrl = NSURL(string: "https://jitsi.luki.org")

    
    // MARK: - Features
    
    /// Setting to force protection by pin code
    static let forcePinProtection: Bool = false
    
    /// Max allowed time to continue using the app without prompting PIN
    static let pinCodeGraceTimeInSeconds: TimeInterval = 0
    
    /// Force non-jailbroken app usage
    static let forceNonJailbrokenUsage: Bool = false
    
    static let allowSendingStickers: Bool = true
    
    static let allowLocalContactsAccess: Bool = true
    
    // MARK: - Feature Specifics
    
    /// Not allowed pin codes. User won't be able to select one of the pin in the list.
    static let notAllowedPINs: [String] = []
    
    /// Maximum number of allowed pin failures when unlocking, before force logging out the user. Defaults to `3`
    static let maxAllowedNumberOfPinFailures: Int = 3
    
    /// Maximum number of allowed biometrics failures when unlocking, before fallbacking the user to the pin if set or logging out the user. Defaults to `5`
    static let maxAllowedNumberOfBiometricsFailures: Int = 5
    
    /// Indicates should the app log out the user when number of PIN failures reaches `maxAllowedNumberOfPinFailures`. Defaults to `false`
    static let logOutUserWhenPINFailuresExceeded: Bool = false
    
    /// Indicates should the app log out the user when number of biometrics failures reaches `maxAllowedNumberOfBiometricsFailures`. Defaults to `false`
    static let logOutUserWhenBiometricsFailuresExceeded: Bool = false
    
    // MARK: - General Settings Screen
    
    static let settingsScreenShowUserFirstName: Bool = false
    static let settingsScreenShowUserSurname: Bool = false
    static let settingsScreenAllowAddingEmailThreepids: Bool = true
    static let settingsScreenAllowAddingPhoneThreepids: Bool = false
    static let settingsScreenShowThreepidExplanatory: Bool = true
    static let settingsScreenShowDiscoverySettings: Bool = true
    static let settingsScreenAllowIdentityServerConfig: Bool = true
    static let settingsScreenShowAdvancedSettings: Bool = true
    static let settingsScreenShowLabSettings: Bool = true
    static let settingsScreenAllowChangingRageshakeSettings: Bool = true
    static let settingsScreenAllowChangingCrashUsageDataSettings: Bool = true
    static let settingsScreenAllowBugReportingManually: Bool = false
    static let settingsScreenAllowDeactivatingAccount: Bool = true
    
    // MARK: - Room Settings Screen
    
    static let roomSettingsScreenShowLowPriorityOption: Bool = true
    static let roomSettingsScreenShowDirectChatOption: Bool = true
    static let roomSettingsScreenAllowChangingAccessSettings: Bool = true
    static let roomSettingsScreenAllowChangingHistorySettings: Bool = true
    static let roomSettingsScreenShowAddressSettings: Bool = true
    static let roomSettingsScreenShowFlairSettings: Bool = true
    static let roomSettingsScreenShowAdvancedSettings: Bool = true
    
    // MARK: - Message
    static let messageDetailsAllowShare: Bool = true
    static let messageDetailsAllowPermalink: Bool = true
    static let messageDetailsAllowViewSource: Bool = true
    static let messageDetailsAllowSave: Bool = true
    
    // MARK: - HTTP
    /// Additional HTTP headers will be sent by all requests. Not recommended to use request-specific headers, like `Authorization`.
    /// Empty dictionary by default.
    static let httpAdditionalHeaders: [String: String] = [:]
    
    
    // MARK: - Authentication Screen
    static let authScreenShowRegister = true
    static let authScreenShowPhoneNumber = false
    static let authScreenShowForgotPassword = true
    static let authScreenShowCustomServerOptions = true
}
