import ArgumentParser

struct SringCatalogEnum: ParsableCommand {
    // @Argument(help: "The phrase to repeat.")
    // var phrase: String

    // @Flag(help: "Include a counter with each repetition.")
    // var includeCounter = false

    @Option(name: .shortAndLong, help: "Full path and filename of the 'xcstrings' file.")
    var xcstringsPath: String

    func run() throws {
        print(xcstringsPath)
    }
}

SringCatalogEnum.main()