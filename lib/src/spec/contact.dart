/// Contact information for the exposed API.
class Contact {
  /// The identifying name of the contact person/organization.
  final String name;

  /// The URL pointing to the contact information. MUST be in the format of a URL.
  final String url;

  /// The email address of the contact person/organization. MUST be in the format of an email address.
  final String email;

  const Contact({this.name, this.url, this.email});
}