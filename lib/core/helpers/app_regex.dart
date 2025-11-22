// ═══════════════════════════════════════════════════════════════
//  APP REGEX HELPER
// ═══════════════════════════════════════════════════════════════

class AppRegex {
  AppRegex._();

  /// Validates if a string is a valid website URL.
  /// This is an alias for isUrlValid for semantic clarity.
  static bool isWebsiteValid(String website) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(website);
  }

  /// Validates if a URL is in a valid format.
  /// Supports HTTP and HTTPS protocols.
  static bool isUrlValid(String url) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(url);
  }
}
