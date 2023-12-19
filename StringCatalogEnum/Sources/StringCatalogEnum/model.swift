// TODO: make XCStrings Decodable by listing all possible models
// Example: let obj = try JSONDecoder().decode(XCStrings.self, from: data)

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
    /// Dictionary mapping a string key to its `StringInfo`.
    /// Each key represents a string identifier (e.g., "Login", "welcomeBack").
    let strings: [String: StringInfo]
}

/// Contains information about a specific string key, including its localizations.
/// This struct can handle both automatically generated and manually added data.
struct StringInfo: Decodable {
    /// The state of the extraction, if applicable. This field is optional
    /// and typically present in manually added translations.
    /// Example: "manual"
    let extractionState: String?

    /// Dictionary mapping locale codes (e.g., "en") to their respective `Localization`.
    /// Handles multiple localizations for the same string.
    let localizations: [String: Localization]
}

/// Represents the localization details of a string.
/// Contains information about the translated string and its state.
struct Localization: Decodable {
    /// Contains the actual localized string and its state.
    /// Example: state - "translated", value - "Login"
    let stringUnit: StringUnit
}

/// Details of the localized string, including its state and value.
/// Used for translating and tracking the state of a string.
struct StringUnit: Decodable {
    /// The state of the string, indicating its translation status.
    /// Example: "translated"
    let state: String

    /// The localized string value.
    /// Example: "Login", "Welcome back"
    let value: String
}
