// TODO: make XCStrings Decodable by listing all possible models
// Example: let obj = try JSONDecoder().decode(XCStrings.self, from: data)
/*
struct XCStrings: Decodable {
    let sourceLanguage: String
    let version: String
    let strings: [String: String]
}
*/
struct XCStrings: Decodable {
    let strings: [String: StringInfo]
}

/// Contains information about a specific string key, including its localizations.
/// This struct can handle both automatically generated and manually added data.
struct StringInfo: Decodable {
    /// The state of the extraction, if applicable. This field is optional
    /// and typically present in manually added translations.
    /// Example: "manual"
    let extractionState: String?
    let localizations: [String: Localization]
}

/// Represents the localization details of a string.
/// Contains information about the translated string and its state.
struct Localization: Decodable {
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
