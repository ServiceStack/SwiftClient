import PackageDescription

let package = Package(
    name: "ServiceStackClient",
    dependencies: [
        .Package(url: "https://github.com/mxcl/PromiseKit", majorVersion: 4)
    ]
)
