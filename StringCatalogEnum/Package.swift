// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// TODO: clean up this local CLI package dependency
/*
let packageCLIGit = Package.Dependency.package(
    name: "StringCatalogEnum", // <- Not sure why this is needed, help?
    url: "https://github.com/superarts/swift-cli-core", 
    .revision("70d7df4e862be86799e9d514e5e55ca92585e7f8")
)
let packageCLILocal = Package.Dependency.package(
    name: "StringCatalogEnum", // <- Not sure why this is needed, help?
    path: "../../"
)
let packageCLI = packageCLILocal
//let packageCLI = packageCLIGit
*/

let package = Package(
    name: "StringCatalogEnum",
    platforms: [
        .macOS(.v10_12),
    ],
    products: [
        .executable(name: "xcstrings-enum-generate", targets: ["StringCatalogEnum"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/apple/swift-argument-parser", 
            .upToNextMinor(from: "1.2.3")
        ),
        // packageCLI,
        .package(
            url: "https://github.com/Quick/Quick.git", 
            .upToNextMinor(from: "7.3.0")
        ),
        .package(
            url: "https://github.com/Quick/Nimble.git", 
            .upToNextMinor(from: "13.0.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "StringCatalogEnum",
            dependencies: [
                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser"
                ),
                /*
                .product(
                    name: "packageCLI",
                    package: "packageCLI"
                ),
                */
            ]
        ),
        .testTarget(
            name: "StringCatalogEnumTests",
            dependencies: ["StringCatalogEnum", "Quick", "Nimble"]
        ),
    ]
)
