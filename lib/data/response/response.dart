import 'package:json_annotation/json_annotation.dart';
import 'package:project_bank/domain/model/model.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "code")
  int? status;
  @JsonKey(name: "message")
  String? message;

}
@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "role_id")
  String? role_id;
  @JsonKey(name: "first_name")
  String? first_name;
  @JsonKey(name: "last_name")
  String? last_name;
  @JsonKey(name: "phoneno")
  String? phoneno;
  @JsonKey(name: "profile_image")
  String? profile_image;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "created_by")
  String? created_by;
  @JsonKey(name: "updated_by")
  String? updated_by;
  @JsonKey(name: "created_at")
  String? created_at;
  @JsonKey(name: "updated_at")
  String? updated_at;
  @JsonKey(name: "full_name")
  String? full_name;

  CustomerResponse(this.id, this.role_id,this.first_name,this.last_name,this.phoneno,this.profile_image,this.email,this.created_at,this.updated_at,this.created_by,this.updated_by,this.full_name);

// from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "data")
  CustomerResponse? customer;
  @JsonKey(name: "token")
  String? token;
  AuthenticationResponse(this.customer,this.token);
  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class TokenResponse {
  @JsonKey(name: "token")
  int? token;
  @JsonKey(name: "updated_at")
  String? updated_at;
  @JsonKey(name: "created_at")
  String? created_at;
  @JsonKey(name: "id")
  String? id;

  TokenResponse(this.token, this.updated_at, this.created_at,this.id);

// from json
  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}

@JsonSerializable()
class GetTokenResponse extends BaseResponse {
  @JsonKey(name: "data")
  TokenResponse? tokenResponse;
  GetTokenResponse(this.tokenResponse);
  // from json
  factory GetTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTokenResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GetTokenResponseToJson(this);
}

@JsonSerializable()
class ProjectResponse  {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;

  ProjectResponse (this.id, this.name);

// toJson
  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);

//fromJson
  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
}
@JsonSerializable()
class EnvironmentResponse  {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'display_text')
  String? display_text;
  @JsonKey(name: 'environment')
  String? environment;

  EnvironmentResponse (this.id, this.display_text,this.environment);

// toJson
  Map<String, dynamic> toJson() => _$EnvironmentResponseToJson(this);

//fromJson
  factory EnvironmentResponse.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentResponseFromJson(json);
}
@JsonSerializable()
class DeployToResponse  {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'display_text')
  String? display_text;
  @JsonKey(name: 'deployto')
  String? deployto;

  DeployToResponse (this.id, this.display_text,this.deployto);

// toJson
  Map<String, dynamic> toJson() => _$DeployToResponseToJson(this);

//fromJson
  factory DeployToResponse.fromJson(Map<String, dynamic> json) =>
      _$DeployToResponseFromJson(json);
}

@JsonSerializable()
class ServerNameResponse  {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'display_text')
  String? display_text;
  @JsonKey(name: 'servername')
  String? servername;

  ServerNameResponse (this.id, this.display_text,this.servername);

// toJson
  Map<String, dynamic> toJson() => _$ServerNameResponseToJson(this);

//fromJson
  factory ServerNameResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerNameResponseFromJson(json);
}
@JsonSerializable()
class TypeResponse  {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'display_text')
  String? display_text;
  @JsonKey(name: 'type')
  String? type;

  TypeResponse (this.id, this.display_text,this.type);

// toJson
  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);

//fromJson
  factory TypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeResponseFromJson(json);
}
@JsonSerializable()
class BranchResponse  {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'display_text')
  String? display_text;
  @JsonKey(name: 'branch')
  String? branch;

  BranchResponse (this.id, this.display_text,this.branch);

// toJson
  Map<String, dynamic> toJson() => _$BranchResponseToJson(this);

//fromJson
  factory BranchResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchResponseFromJson(json);
}
@JsonSerializable()
class UserResponse  {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'full_name')
  String full_name;

  UserResponse (this.id, this.full_name);

// toJson
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

//fromJson
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
@JsonSerializable()
class HostingDataResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'project_detail_id')
  String? project_detail_id;
  @JsonKey(name: 'git_repo')
  String? git_repo;
  @JsonKey(name: 'remote_folder')
  String? remote_folder;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'admin_url')
  String? admin_url;
  @JsonKey(name: 'technology')
  String? technology;
  @JsonKey(name: 'created_by')
  String? created_by;
  @JsonKey(name: 'created_at')
  String? created_at;
  @JsonKey(name: "project")
  ProjectResponse projectResponse;
  @JsonKey(name: "environment")
  EnvironmentResponse ? environmentResponse;
  @JsonKey(name: "deployto")
  DeployToResponse ? deployToResponse;
  @JsonKey(name: "servername")
  ServerNameResponse ? serverNameResponse;
  @JsonKey(name: "type")
  TypeResponse ? typeResponse;
  @JsonKey(name: "branch")
  BranchResponse ? branchResponse;
  @JsonKey(name: "user")
  UserResponse ? userResponse;
  @JsonKey(name: 'is_active')
  int? is_active;
  HostingDataResponse(this.id,this.project_detail_id,this.git_repo,this.remote_folder,this.url,this.admin_url,this.technology,this.created_at,this.created_by,this.projectResponse,this.environmentResponse,this.deployToResponse,this.serverNameResponse,this.typeResponse,this.branchResponse,this.userResponse,this.is_active);
  // from json
  factory HostingDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HostingDataResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$HostingDataResponseToJson(this);
}
@JsonSerializable()
class HostingResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<HostingDataResponse>? hostingDataResponse;

  HostingResponse(this.hostingDataResponse);

// toJson
  Map<String, dynamic> toJson() => _$HostingResponseToJson(this);

//fromJson
  factory HostingResponse.fromJson(Map<String, dynamic> json) =>
      _$HostingResponseFromJson(json);
}
@JsonSerializable()
class RoleDataResponse {
  @JsonKey(name: "is_active")
  int? is_active;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "project_detail_id")
  String? project_detail_id;
  @JsonKey(name: "role_name")
  String? role_name;
  String? credential;

  RoleDataResponse(this.is_active, this.id, this.project_detail_id,this.role_name,this.credential);

// from json
  factory RoleDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleDataResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$RoleDataResponseToJson(this);
}
@JsonSerializable()
class RolesResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<RoleDataResponse>? roleDataResponse;

  RolesResponse(this.roleDataResponse);

// toJson
  Map<String, dynamic> toJson() => _$RolesResponseToJson(this);

//fromJson
  factory RolesResponse.fromJson(Map<String, dynamic> json) =>
      _$RolesResponseFromJson(json);
}

@JsonSerializable()
class CredentialDataResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "project_detail_id")
  String? project_detail_id;
  @JsonKey(name: "hosting_id")
  String? hosting_id;
  @JsonKey(name: "project_role_id")
  String? project_role_id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "is_active")
  int? is_active;
  @JsonKey(name: "project_role")
  RoleDataResponse ? roleDataResponse;
  CredentialDataResponse(this.id, this.project_role_id, this.hosting_id,this.project_detail_id,this.username,this.password,this.is_active,this.roleDataResponse);

// from json
  factory CredentialDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CredentialDataResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CredentialDataResponseToJson(this);
}
@JsonSerializable()
class CredentialResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<CredentialDataResponse>? credentialDataResponse;

  CredentialResponse(this.credentialDataResponse);

// toJson
  Map<String, dynamic> toJson() => _$CredentialResponseToJson(this);

//fromJson
  factory CredentialResponse.fromJson(Map<String, dynamic> json) =>
      _$CredentialResponseFromJson(json);
}


@JsonSerializable()
class AddCredentialDataResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "project_detail_id")
  String? project_detail_id;
  @JsonKey(name: "hosting_id")
  String? hosting_id;
  @JsonKey(name: "project_role_id")
  String? project_role_id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "is_active")
  String? is_active;
  AddCredentialDataResponse(this.id, this.project_role_id, this.hosting_id,this.project_detail_id,this.username,this.password,this.is_active);

// from json
  factory AddCredentialDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCredentialDataResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddCredentialDataResponseToJson(this);
}

@JsonSerializable()
class AddCredentialResponse extends BaseResponse {
  @JsonKey(name: 'data')
  AddCredentialDataResponse? addCredentialDataResponse;
  AddCredentialResponse(this.addCredentialDataResponse);
// toJson
  Map<String, dynamic> toJson() => _$AddCredentialResponseToJson(this);
//fromJson
  factory AddCredentialResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCredentialResponseFromJson(json);

}

@JsonSerializable()
class DeleteCredentialResponse extends BaseResponse  {
  @JsonKey(name: "data")
  String? data;
  DeleteCredentialResponse(this.data);
  // from json
  factory DeleteCredentialResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCredentialResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$DeleteCredentialResponseToJson(this);
}
@JsonSerializable()
class ForgotPassResponse extends BaseResponse  {
  @JsonKey(name: "data")
  String? data;
  ForgotPassResponse(this.data);
  // from json
  factory ForgotPassResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ForgotPassResponseToJson(this);
}

@JsonSerializable()
class AddHostingResponse extends BaseResponse  {
  @JsonKey(name: "data")
  String? data;
  AddHostingResponse(this.data);
  // from json
  factory AddHostingResponse.fromJson(Map<String, dynamic> json) =>
      _$AddHostingResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddHostingResponseToJson(this);
}