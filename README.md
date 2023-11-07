# XStringCatelog

A framework that generates `enum` from `xcstrings` - Swift enumerations from String Catalog for iOS / iPadOS / macOS / tvOS.

If you are not familiar with [Apple's String Catalog](https://developer.apple.com/documentation/Xcode/localizing-and-varying-text-with-a-string-catalog) (introduced from Xcode 15 - WWDC 23), please check TODO.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Workflow](#workflow)
- [Appendix](#appendix)
  - [Apple's workflow and why it's bad](#apples-workflow-and-why-its-bad)
    - [Workflow](#workflow-1)
    - [Advantage against the old `Localizable String` approach](#advantage-against-the-old-localizable-string-approach)
    - [Why Apple's approach is bad](#why-apples-approach-is-bad)
  - [General thinking about Apple's tech stack](#general-thinking-about-apples-tech-stack)
- [Credit](#credit)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Workflow

- Add a `String Catalog` to your project.
- Build your app to compile your `String Catalog` from your current codebase.
- If you are dealing with an old codebase and needs to provide localization right now, add copies in the String Catalog. Otherwise leave them along. We'll revisit it later.
- Whenever you want to add a new string to the project, always manually create an entry in `Localizable.xcstrings` and add localized string(s).
  - Use a variable name friendly string as `Key`.
  - TODO: plural forms etc. is to be added later.
- Create `enum` in your code that contains all the String Catalog keys.
  - It can be constructed manually, all you need is to use a `LocalizedStringKey` in `SwiftUI.View`, not the String itself.
    - Helper function: `var key: LocalizedStringKey { LocalizedStringKey(rawValue) }`
  - OR use the [SringCatalogEnum](./StringCatalogEnum) CLI tool in this repo.
    - Copy `xcstrings-enum-generate` to your project.
    - Added something like `xcstrings-enum-generate --xcstrings-path ../Resources/Localizable.xcstrings --output-filename ../Generated/XcodeString.swift` to generate the `enum`.
  - OR use [SwiftGen](https://github.com/SwiftGen/SwiftGen/issues/1065) - hopefully better support will be added in future.
  - OR explore how to achieve it with [Sourcery](https://github.com/krzysztofzablocki/Sourcery).
- Use `LocalizedStringKey(key)` in your SwiftUI components.
  - With `StringCatalogEnum`: `Text(XCS.welcomeBack.key)`
- At this point, you end up with a native `enum`, hopefully generated from your `String Catalog`.
  - With `StringCatalogEnum`: remove hard-coded strings from your `SwiftUI` components and create manual keys and localized strings.

## Appendix

This section provides context and high order thinking, which can be ignored by senior developers.

### Apple's workflow and why it's bad

#### Workflow

As mentioned in TODO, Apple's bare minimum localization implementation is to reuse the mechanisms based on Localizable Strings, and makes it easier to use. Typical workflow is like:

- Write codes like `SwiftUI.Text("Product Title")`.
- Add a `String Catalog` to enable localization.
- Whenever you build your project, your String Catalog will be automatically updated with new strings.
  - What happens is that functions like `Text.init` take `LocalizedStringKey` as a parameter, and they are built into String Catalog, using the same string as both key and (default English) value.
  - For the reason above, `static let title = "Welcome"` will NOT be built into string catalog automatically.
- You can add a new language in your String Catalog to achieve localization.

#### Advantage against the old `Localizable String` approach

- Replaced the old `INI` style text file with more a modem `JSON` based format.
- Added a dedicated GUI editor.
- Existing or newly added `SwiftUI` strings can be compiled to `xcstrings` file automatically.
- Introduced classes like `LocalizedStringKey`, `String.LocalizationValue` to support all these localization features.

#### Why Apple's approach is bad

Or I should say why it's only good to build a MVP app. As long as you have built an app with decent level of complexity, you should have encountered use cases like:

- Short strings like "Share" may be translated to something like "分享" (share) or "点此分享" (tap here to share) in a different language, to fit length of different UI elements. 
- A long, 300 characters "lorem ipsum" strings with line breaks looks ugly to fit in your `SwiftUI.View`.
- And in general, compile-time check is always good to ensure good code quality, and allows fewer defects in QA stage.

### General thinking about Apple's tech stack

Apple usually doesn't promote certain design patterns. Most of the time, Apple only offers the essential components for you to build your system. This could lead to some bad results, for example, most of experienced iOS developers perhaps have seen massive view controllers more or less. Another example is that Google built components like `LiveData`, `Room` etc. and promoted their own `MVVM` pattern. Apple rarely does that.

I think this is because Apple, at its core, is a company that sells products. It offers tools to build apps for its products, but in the end, implementation is not what Apple is passionate about. Apple probably cares about backward compatibility more, as it does impact the products. So you don't see Apple is promoting using `enum` over hard-coded strings in their examples, and it doesn't mean you shouldn't do it yourself.

Companies like Google, on the other hand, are built around technology. They don't hesitate to kill their services and update their tech stack, which sometimes results confusion and frustration. But they do offer more software architectural level of thinking, which can be insightful for developers in their ecosystems.

Of course, this is just a high level summary. Apple built async/wait APIs to promote better codes, and Google still uses XML (bah) for string resources. And just like iOS and Android, we are seeing both parties learn from each other. Hopefully technology will keep evolving.

## Credit

- CLI tool built from [SwiftCLITemplate](https://github.com/superarts/SwiftCLITemplate).