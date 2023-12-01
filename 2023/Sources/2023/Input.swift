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
  /// input04.txt
  internal static let input04Txt = File(name: "input04", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input05.txt
  internal static let input05Txt = File(name: "input05", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input06.txt
  internal static let input06Txt = File(name: "input06", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input07.txt
  internal static let input07Txt = File(name: "input07", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input08.txt
  internal static let input08Txt = File(name: "input08", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input09.txt
  internal static let input09Txt = File(name: "input09", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// input10.txt
  internal static let input10Txt = File(name: "input10", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample01.txt
  internal static let sample01Txt = File(name: "sample01", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample02.txt
  internal static let sample02Txt = File(name: "sample02", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample03.txt
  internal static let sample03Txt = File(name: "sample03", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample04.txt
  internal static let sample04Txt = File(name: "sample04", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample05.txt
  internal static let sample05Txt = File(name: "sample05", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample06.txt
  internal static let sample06Txt = File(name: "sample06", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample07.txt
  internal static let sample07Txt = File(name: "sample07", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample08.txt
  internal static let sample08Txt = File(name: "sample08", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample09.txt
  internal static let sample09Txt = File(name: "sample09", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
  /// sample10.txt
  internal static let sample10Txt = File(name: "sample10", ext: "txt", relativePath: "", mimeType: "application/octet-stream")
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
