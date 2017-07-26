import 'package:meta/meta.dart';

/// License information for the exposed API.
class License {
  /// **Required**. The license name used for the API.
  final String name;

  ///	A URL to the license used for the API. MUST be in the format of a URL.
  final String url;

  const License({@required this.name, this.url});
}
