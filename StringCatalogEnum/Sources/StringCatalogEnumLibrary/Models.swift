public struct StringInfo: Decodable {
    let extractionState: String?
    let localizations: [String: Localization]?
}

public struct Localization: Decodable {
    let variations: Variations?
}

public struct Variations: Decodable {
    let plural: PluralVariations?
    let device: DeviceVariations?
}

public struct PluralVariations: Decodable {
    let one: StringUnitWrapper?
    let other: StringUnitWrapper?
}

public struct DeviceVariations: Decodable {
    let variations: [String: StringUnitWrapper]?
}

public struct StringUnitWrapper: Decodable {
    let stringUnit: StringUnit
}

public struct StringUnit: Decodable {
    let state: String
    let value: String
}