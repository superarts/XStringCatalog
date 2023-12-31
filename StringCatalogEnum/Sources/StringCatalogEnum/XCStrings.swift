public struct XCStrings: Decodable {
    let sourceLanguage: String
    let version: String
    let strings: [String: StringInfo]
}