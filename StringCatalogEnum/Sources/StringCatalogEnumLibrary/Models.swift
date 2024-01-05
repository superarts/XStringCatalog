/// Represents the root structure of the xcstrings JSON.
/// This struct is designed to handle various JSON formats, including those
/// generated from SwiftUI and manually added translations.
/// 
/// Examples of supported JSON formats:
///
/// 1. Generated from SwiftUI (no translation added):
/// ```
/// "Home": {}
/// ```
///
/// 2. Generated from SwiftUI, with an English translation:
/// ```
/// "Login": {
///   "localizations": {
///     "en": {
///       "stringUnit": {
///         "state": "translated",
///         "value": "Login"
///       }
///     }
///   }
/// }
/// ```
///
/// 3. Manually added, English only:
/// ```
/// "welcomeBack": {
///   "extractionState": "manual",
///   "localizations": {
///     "en": {
///       "stringUnit": {
///         "state": "translated",
///         "value": "Welcome back"
///       }
///     }
///   }
/// }
/// ```
public struct Localizations: Decodable {
    public let sourceLanguage: String
    public let version: String
    public let strings: [String: StringInfo]
}

public struct StringInfo: Decodable {
    public let extractionState: String?
    public let localizations: [String: Localization]?
}

public struct Localization: Decodable {
    public let stringUnit: StringUnit?
    // let variations: Variations?
}

// struct Variations: Decodable {
//     let plural: PluralVariations?
//     let device: DeviceVariations?
// }

// struct PluralVariations: Decodable {
//     let one: StringUnitWrapper?
//     let other: StringUnitWrapper?
// }

// struct DeviceVariations: Decodable {
//     let variations: [String: StringUnitWrapper]?
// }

// struct StringUnitWrapper: Decodable {
//     let stringUnit: StringUnit
// }

public struct StringUnit: Decodable {
    public let state: String
    public let value: String
}