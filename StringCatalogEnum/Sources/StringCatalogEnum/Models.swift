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