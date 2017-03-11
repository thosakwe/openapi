import 'package:owl/annotation/json.dart';
import 'schemas.g.dart';

@JsonClass()
class Schema {
  String swagger, host, basePath;
  Info info;
  List<String> schemes, consumes, produces;
  @Transient()
  Map<String, SecurityScheme> securityDefinitions;
  @JsonField(native: true)
  Map<String, List<String>> security;
  List<Tag> tags;
  ExternalDocumentation externalDocs;
  @JsonField(native: true)
  Map<String, Map<String, Operation>> paths;
  Schema(
      {this.swagger,
      this.host,
      this.basePath,
      this.info,
      this.schemes,
      this.consumes,
      this.produces,
      this.security,
      this.tags,
      this.externalDocs});

  factory Schema.fromMap(Map map) {
    var obj = SchemaMapper.parse(map);

    if (map['securityDefinitions'] is Map) {
      var defs = map['securityDefinitions'] as Map;
      obj.securityDefinitions = defs.keys.fold(
          {},
          (out, k) =>
              out..[k.toString()] = SecuritySchemeMapper.parse(defs[k]));
    }

    return obj;
  }

  Map<String, dynamic> toJson() {
    var map = SchemaMapper.map(this);

    if (securityDefinitions != null) {
      map['securityDefinitions'] = securityDefinitions.keys.fold(
          {},
          (out, k) =>
              out..[k] = SecuritySchemeMapper.map(securityDefinitions[k]));
    }

    return map;
  }
}

@JsonClass()
class Info {}

@JsonClass()
class Operation {
  List<String> tags, consumes, produces, schemes;
  String summary, description, operationId;
  ExternalDocumentation externalDocs;
  bool deprecated;
  Operation(
      {this.tags,
      this.summary,
      this.description,
      this.externalDocs,
      this.operationId,
      this.consumes,
      this.produces,
      this.schemes});
  factory Operation.fromMap(Map map) => OperationMapper.parse(map);
  Map<String, dynamic> toJson() => OperationMapper.map(this);
}

@JsonClass()
class ExternalDocumentation {
  String description, url;
  ExternalDocumentation({this.description, this.url});
  factory ExternalDocumentation.fromMap(Map map) =>
      ExternalDocumentationMapper.parse(map);
  Map<String, dynamic> toJson() => ExternalDocumentationMapper.map(this);
}

@JsonClass()
class Parameters {}

@JsonClass()
class Reference {}

@JsonClass()
class Responses {}

@JsonClass()
class Response {}

@JsonClass()
class Tag {
  String name, description;
  ExternalDocumentation externalDocs;
  Tag({this.name, this.description, this.externalDocs});
  factory Tag.fromMap(Map map) => TagMapper.parse(map);
  Map<String, dynamic> toJson() => TagMapper.map(this);
}

@JsonClass()
class SecurityScheme {
  String type, description, name, flow, authorizationUrl, tokenUrl;
  @JsonField(key: 'in')
  String in_;
  @JsonField(native: true)
  Map<String, String> scopes;
  SecurityScheme(
      {this.type,
      this.description,
      this.name,
      this.in_,
      this.flow,
      this.authorizationUrl,
      this.tokenUrl,
      this.scopes});
  factory SecurityScheme.fromMap(Map map) => SecuritySchemeMapper.parse(map);
  Map<String, dynamic> toJson() => SecuritySchemeMapper.map(this);
}
