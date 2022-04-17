# R.swift.Plugin

Use R.swift for resources in your own Swift package.

### How ?

1. This is a plugin for Swift Package Manager, which supports plugins since Swift 5.6,
therefore the proper swift tools needs to be used

    `// swift-tools-version:5.6`

2. You need two dependencies, `R.swift.Library` as usual, but also `R.swift.Plugin`

    ```
    dependencies: [
        .package(url: "https://github.com/mac-cain13/R.swift.Library", from: "5.4.0"),
        .package(url: "https://github.com/quentinfasquel/R.swift.Plugin", from: "5.4.0")
    ],
    ```
    
3. Your target needs to link with `R.swift.Library` and use the plugin

    ```
    targets: [
        .target(
            name: "YourTarget",
            dependencies: [.product(name: "RswiftDynamic", package: "R.swift.Library")],
            resources: [
                .copy("someImage.png") // Resource example
            ],
            plugins: [.plugin(name: "RswiftPlugin", package: "R.swift.Plugin")]
        ),
    ```

4. Use R.swift like before :

    ```
    let image = R.image.someImage()
    ```

--

### More...

This plugin may not be _bullet-proof_ since it was barely tested. It is awaiting to become officially supported by the official **R.swift**, here is what to know about how it works :

- The SPM plugin uses an executable variant of the official **R.swift**. It is currently hosted through a github release built from [this branch](https://github.com/quentinfasquel/R.swift/tree/feature/generate-swift-package-resources).

- It uses `--accessLevel public` so that the resources of a package, and mostly `R.validate()`, are accessible in the package's **test target**.

- The executable is slightly big (~ 24Mb) since it carries along a dependency on Swift Package Manager's own _package model_


- Your feedback is welcome!
