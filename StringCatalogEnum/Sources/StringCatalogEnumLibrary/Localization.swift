public struct Localizations: Decodable {
    let sourceLanguage: String
    let version: String
    let strings: [String: StringInfo]
}