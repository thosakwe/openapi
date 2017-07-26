import 'package:meta/meta.dart';
import 'contact.dart';
import 'license.dart';

/// The object provides metadata about the API.
/// The metadata can be used by the clients if needed, and can be presented in the Swagger-UI for convenience.
class Info {
  /// **Required**. The title of the application.
  final String title;

  /// A short description of the application. GFM syntax can be used for rich text representation.
  final String description;

  ///	The Terms of Service for the API.
  final String termsOfService;

  /// The contact information for the exposed API.
  final Contact contact;

  /// The license information for the exposed API.
  final License license;

  /// **Required**. Provides the version of the application API (not to be confused with the specification version).
  final String version;

  const Info(
      {@required this.title,
      this.description,
      this.termsOfService,
      this.contact,
      this.license,
      @required this.version});
}
