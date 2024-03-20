
import Foundation

public struct StringEnumHelper {
    public init() {}

    public func createEnumKeys(with stringData: Localizations, keyNameMatches: Bool, keywordEnum: [String]) -> String {
        var partialOutput = ""
        var cases = [String]()
        var knownCases = [String]()

        for (key, data) in stringData.strings {
            guard let name = convertToVariableName(key: key) else {
                print("SKIPPING: \(key)")
                continue
            }

            if keyNameMatches, key != name {
                continue
            } else if !keyNameMatches, key == name {
                continue
            }

            guard !knownCases.contains(name) else {
                cases.append("    // TODO: fix duplicated entry - case \(name)\n")
                continue
            }
            knownCases.append(name)

            var localizationComments = [String]()
            if let localizations = data.localizations {
                for (languageCode, localization) in localizations {
                    if let stringUnit = localization.stringUnit {
                        let value = stringUnit.value.replacingOccurrences(of: "\n", with: " ")
                        localizationComments.append("    /// '\(languageCode)': \"\(value)\"")
                    }
                }
            }

            localizationComments = localizationComments.isEmpty ? ["    /// No localizations available"] : localizationComments
            let comment = localizationComments.joined(separator: "\n")

            let caseString = keywordEnum.contains(name)
                ? keyNameMatches
                    ? "    case `\(name)`\n"
                    : "    case `\(name)` = \"\(key.replacingOccurrences(of: "\n", with: ""))\"\n"
                : keyNameMatches
                    ? "    case \(name)\n"
                    : "    case \(name) = \"\(key.replacingOccurrences(of: "\n", with: ""))\"\n"

            cases.append("\(comment)\n\(caseString)")
        }

        cases.sort()
        cases.forEach { partialOutput += $0 }

        return partialOutput
    }

    public func convertToVariableName(key: String) -> String? {
        var result = key
        if key == key.uppercased() {
            result = key.lowercased()
        }

        result = result.split(separator: " ").enumerated().map { index, substring in
            index == 0 ? String(substring.prefix(1)).lowercased() + substring.dropFirst() : String(substring).capitalized
        }.joined()

        result = result.components(separatedBy: CharacterSet.letters.union(CharacterSet.alphanumerics).inverted).joined()

        while let firstChar = result.first, firstChar.isNumber {
            result.removeFirst()
        }

        guard !result.isEmpty else { return nil }
        guard result.count > 1 else { return result.lowercased() }

        let firstLetter = result.prefix(1).lowercased()
        let remainingLetters = result.dropFirst()
        return firstLetter + remainingLetters
    }
}
