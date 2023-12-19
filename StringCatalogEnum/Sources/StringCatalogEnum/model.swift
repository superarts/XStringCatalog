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

struct StringInfo: Decodable {
    let extractionState: String?
    let localizations: [String: Localization]
}

struct Localization: Decodable {
    let stringUnit: StringUnit
}

struct StringUnit: Decodable {
    let state: String
    let value: String
}
