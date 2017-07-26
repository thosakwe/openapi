import 'package:meta/meta.dart';
import 'info.dart';
import 'path.dart';

/// This is the root document object for the API specification.
/// It combines what previously was the Resource Listing and API Declaration (version 1.2 and earlier) together into one document.
class Swagger {
  /// **Required**. Specifies the Swagger Specification version being used.
  ///
  /// It can be used by the Swagger UI and other clients to interpret the API listing. The value MUST be `"2.0"`.
  final String swagger;

  /// **Required**. Provides metadata about the API.
  /// The metadata can be used by the clients if needed.
  final Info info;

  /// The host (name or ip) serving the API.
  ///
  /// This MUST be the host only and does not include the scheme nor sub-paths.
  /// It MAY include a port. If the host is not included, the host serving the documentation is to be used (including the port).
  /// The host does not support path templating.
  final String host;

  /// The base path on which the API is served, which is relative to the host.
  ///
  /// If it is not included, the API is served directly under the host. The value MUST start with a leading slash (`/`).
  /// The basePath does not support path templating.
  final String basePath;

  /// The transfer protocol of the API.
  ///
  /// Values MUST be from the list: `"http"`, `"https"`, `"ws"`, `"wss"`.
  /// If the schemes is not included, the default scheme to be used is the one used to access the Swagger definition itself.
  final List<String> schemes;

  /// A list of MIME types the APIs can consume.
  ///
  /// This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types.
  final List<String> consumes;

  /// A list of MIME types the APIs can produce.
  ///
  /// This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types.
  final List<String> produces;

  /// **Required**. The available paths and operations for the API.
  final Map<String, dynamic> paths;
}