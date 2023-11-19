import ArgumentParser
import Foundation
import XCTest

// MARK: - Helper Class

class StringCatalogGenerator {

    struct Error: Swift.Error {
        case unexpectedJSON(message: String? = nil)
    }

    enum Keyword: String, CaseIterable {
        case `continue`, `default`
    }

    static func generateEnum(from xcstringsPath: String, outputFilename: String, enumName: String = "XcodeStringKey", enumTypealias: String = "XCS") throws {
        let generator = StringCatalogGenerator(xcstringsPath: xcstringsPath, outputFilename: outputFilename, enumName: enumName, enumTypealias: enumTypealias)
        try generator.generateEnum()
    }

    private let xcstringsPath: String
    private let outputFilename: String
    private let enumName: String
    private let enumTypealias: String

    private init(xcstringsPath: String, outputFilename: String, enumName: String, enumTypealias: String) {
        self.xcstringsPath = xcstringsPath
        self.outputFilename = outputFilename
        self.enumName = enumName
        self.enumTypealias = enumTypealias
    }

    private func generateEnum() throws {
        print("LOADING: \(xcstringsPath)")
        let url = URL(fileURLWithPath: xcstringsPath)
        let data = try Data(contentsOf: url)
        print(data)

        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw Error.unexpectedJSON(message: "cannot parse first level object")
        }

        guard let strings = json["strings"] as? [String: Any] else {
            throw Error.unexpectedJSON(message: "cannot parse `strings`")
        }

        var output = """
            // This file is generated by XcodeStringEnum. Please do *NOT* update it manually.
            // As a common practice, swiftLint is disabled for generated files.
            // swiftlint:disable all

            import SwiftUI

            /// Makes it a bit easier to type.
            typealias \(enumTypealias) = \(enumName)

            /// Generated by StringCatalogEnum, this enum contains all existing Strin Category keys.
            enum \(enumName): String, CaseIterable {

            """

        var cases = [String]()
        var knownCases = [String]()
        for (key, _) in strings {
            guard let name = convertToVariableName(key: key) else {
                print("SKIPPING: \(key)")
                continue
            }
            guard key == name else {
                continue
            }
            guard !knownCases.contains(name) else {
                cases.append("    // TODO: fix duplicated entry - case \(name)\n")
                continue
            }
            knownCases.append(name)

            if Keyword.allCases.map({ $0.rawValue }).contains(name) {
                cases.append("    case `\(name)`\n")
            } else {
                cases.append("    case \(name)\n")
            }
        }
        cases.sort()
        cases.forEach { string in
            output += string
        }

        // ... (rest of the code remains the same)
        
        let outputURL = URL(fileURLWithPath: outputFilename)
        try output.write(to: outputURL, atomically: true, encoding: .utf8)
        print("Written to: \(outputFilename)")
    }

    private func convertToVariableName(key: String) -> String? {
        // ... (unchanged)
    }
}

// MARK: - Command Line Interface

struct StringCatalogEnum: ParsableCommand {
    // ... (unchanged)

    func run() throws {
       StringCatalogGenerator.generateEnum(from: xcstringsPath, outputFilename: outputFilename, enumName: enumName, enumTypealias: enumTypealias)
    }

    // ... (unchanged)
}

// MARK: - Run Command

StringCatalogEnum.main()
