// TODO: make XCStrings Decodable by listing all possible models
// Example: let obj = try JSONDecoder().decode(XCStrings.self, from: data)
/*
struct XCStrings: Decodable {
    let sourceLanguage: String
    let version: String
    let strings: [String: String]
}
*/

import Foundation

/// Model that helps separate the logic used in StringCatalogEnum struct.
struct StringEnumKeyModel {
    
    /// Creates enum cases depending on whether key == name
    ///   - Parameters:
    ///     - stringData: A dictionary containing string data.
    ///     - keyNameMatches: A boolean flag indicating whether the enum cases should match the keys exactly.
    ///     - keywordEnum: An array of raw values from the Keyword enum in StringCatalogEnum struct
    func createEnumKeys(with stringData: [String: Any], keyNameMatches: Bool, keywordEnum: [String]) -> String {
        var partialOutput = ""
        var cases = [String]()
        var knownCases = [String]()
        for (key, _) in stringData {
            
            guard let name = convertToVariableName(key: key) else {
                print("SKIPPING: \(key)")
                continue
            }
            
            if keyNameMatches {
                guard key == name else {
                    continue
                }
            } else {
                guard key != name else {
                    continue
                }
            }
            
            guard !knownCases.contains(name) else {
                cases.append("    // TODO: fix duplicated entry - case \(name)\n")
                continue
            }
            knownCases.append(name)

            // TODO: extract `localizations.en.stringUnit.value` and add in comments as inline documents

            let caseString: String
            if keywordEnum.contains(name) {
                caseString = keyNameMatches
                    ? "    case `\(name)`\n"
                    : "    case `\(name)` = \"\(key.replacingOccurrences(of: "\n", with: ""))\"\n"
            } else {
                caseString = keyNameMatches
                    ? "    case \(name)\n"
                    : "    case \(name) = \"\(key.replacingOccurrences(of: "\n", with: ""))\"\n"
            }

            cases.append(caseString)
        }
        cases.sort()
        cases.forEach { string in
            partialOutput += string
        }

        return partialOutput
    }

   
    
    /// Convert a Strint Catalog key to a Swift variable name.
    func convertToVariableName(key: String) -> String? {
        var result = key
        // Check if the entire string is uppercase
        if key == key.uppercased() {
            result = key.lowercased()
        }

        
        // Uppercase remaining words, e.g. "an example" to "anExample";
        result = result.split(separator: " ").enumerated().map { (index, substring) in
                index == 0 ? String(substring.prefix(1)).lowercased() + substring.dropFirst() : String(substring).capitalized
            }.joined()
        
        // Leave only letters and numeric characters
        result = result.components(separatedBy: CharacterSet.letters.union(CharacterSet.alphanumerics).inverted).joined()

        // Remove leading numeric characters
        while !result.isEmpty {
            let firstLetter = result.prefix(1)
            let digitsCharacters = CharacterSet(charactersIn: "0123456789")
            if CharacterSet(charactersIn: String(firstLetter)).isSubset(of: digitsCharacters) {
                // print("dropping first of: \(result)")
                result = String(result.dropFirst())
            } else {
                break
            }
        }

        // Return nil if empty
        guard !result.isEmpty else {
            return nil
        }

        // Return lowercased string if there's only 1 character
        guard result.count > 1 else {
            return result.lowercased()
        }

        // Change the first character to lowercase
        let firstLetter = result.prefix(1).lowercased()
        let remainingLetters = result.dropFirst()
        result = firstLetter + remainingLetters

        return result
    }
}
