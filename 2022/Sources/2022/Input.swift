// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length line_length implicit_return

// MARK: - Files

// swiftlint:disable explicit_type_interface identifier_name
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Files {
  /// input01.txt
  internal static let input01Txt = File(name: "input01", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input02.txt
  internal static let input02Txt = File(name: "input02", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input03.txt
  internal static let input03Txt = File(name: "input03", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample01.txt
  internal static let sample01Txt = File(name: "sample01", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample02.txt
  internal static let sample02Txt = File(name: "sample02", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample03.txt
  internal static let sample03Txt = File(name: "sample03", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
}
// swiftlint:enable explicit_type_interface identifier_name
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

internal struct File {
  internal let name: String
  internal let ext: String?
  internal let relativePath: String
  internal let mimeType: String

  internal var url: URL {
    return url(locale: nil)
  }

  internal func url(locale: Locale?) -> URL {
    let bundle = BundleToken.bundle
    let url = bundle.url(
      forResource: name,
      withExtension: ext,
      subdirectory: relativePath,
      localization: locale?.identifier
    )
    guard let result = url else {
      let file = name + (ext.flatMap { ".\($0)" } ?? "")
      fatalError("Could not locate file named \(file)")
    }
    return result
  }

  internal var path: String {
    return path(locale: nil)
  }

  internal func path(locale: Locale?) -> String {
    return url(locale: locale).path
  }
}

// swiftlint:disable convenience_type explicit_type_interface
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type explicit_type_interface
