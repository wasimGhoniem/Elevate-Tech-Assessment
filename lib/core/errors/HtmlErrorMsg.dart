class HtmlErrorMessage {
  final String message;

  HtmlErrorMessage(this.message);

  /// Factory constructor to extract the message from a simple HTML string
  factory HtmlErrorMessage.fromHtmlString(String htmlString) {
    const startTag = '<pre>';
    const endTag = '</pre>';

    // Find the index of the opening <pre> tag
    final startIndex = htmlString.indexOf(startTag);

    // If <pre> tag is found, find the closing tag after it
    if (startIndex != -1) {
      final endIndex = htmlString.indexOf(endTag, startIndex + startTag.length);

      // If </pre> tag is also found
      if (endIndex != -1) {
        // Extract the substring between the tags and trim whitespace
        final extractedMessage = htmlString.substring(
          startIndex + startTag.length,
          endIndex,
        ).trim();
        return HtmlErrorMessage(extractedMessage);
      }
    }

    // Fallback if <pre>...</pre> structure is not found
    // You could return the whole string, or a default error message
    return HtmlErrorMessage('Could not extract error message from HTML.');
  }

  @override
  String toString() => 'HtmlErrorMessage: $message';
}