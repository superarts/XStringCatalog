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

struct XCStrings: Decodable {
    let sourceLanguage: String
    let version: String
    let strings: [String: StringInfo]
}

struct StringInfo: Decodable {
    let extractionState: String?
    let localizations: [String: Localization]?
}

struct Localization: Decodable {
    let variations: Variations?
}

struct Variations: Decodable {
    let plural: PluralVariations?
    let device: DeviceVariations?
}

struct PluralVariations: Decodable {
    let one: StringUnitWrapper?
    let other: StringUnitWrapper?
}

struct DeviceVariations: Decodable {
    let variations: [String: StringUnitWrapper]?
}

struct StringUnitWrapper: Decodable {
    let stringUnit: StringUnit
}

struct StringUnit: Decodable {
    let state: String
    let value: String
}
