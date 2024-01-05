# StringCatalogEnum

This utility converts an `xcstrings` file into a Swift `Enum`.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Purpose of this utility](#purpose-of-this-utility)
- [How to use](#how-to-use)
- [Example](#example)
- [Tech stack](#tech-stack)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Purpose of this utility

Although it may not be the best metaprogramming utility, it provides an easy to use way to generates native Swift code from String Catalog files.

You should notice that a lot of things are missing in this utility; for example, minimum documentation has been provided. Some of them are listed in the [issues](../../../issues) section. This is due to another purpose of this utility: to evaluate skills of new developers. You are welcome to learn from [mistakes made by previous contributors](../../../pulls?q=is%3Apr+is%3Aclosed+review%3Achanges_requested).

## How to use

- Download from [Releases](../../../releases).
- Follow [USAGE](USAGE.md) for more details.

## Example

For a string with key `errorMessage` in your String Catalog, you will have a `case errorMessage` in your generated `Enum`.

- `SwiftUI.View(XcodeString.errorMessage.key)`
- `let string = XcodeString.errorMessage.string`

## Tech stack

It is expected for the new developers to proactively research unfamiliar tech stack. It is encouraged to use `Google` or even `ChatGPT` to do your research, or even help you write some of your code, but in the end, you need to put things together to either learn how to use this utility, or make contribution. And as a contribution, you are expected to do your research about the following tech stack:

- `SPM` and `Swift Argument Parser`.
- `Quick` and `Nimble`.
- `Makefile` and `make`.

Hint: always ask questions if you are lost, just make sure you've done your research.

## How to use SwiftLint before pushing

1. Open your terminal
2. Navigate to StringCatalogEnum
3. Type "SwiftLint" and hit enter
4. Done
