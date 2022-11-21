// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['code'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['role_id'] as String?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['phoneno'] as String?,
      json['profile_image'] as String?,
      json['email'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['created_by'] as String?,
      json['updated_by'] as String?,
      json['full_name'] as String?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role_id': instance.role_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phoneno': instance.phoneno,
      'profile_image': instance.profile_image,
      'email': instance.email,
      'created_by': instance.created_by,
      'updated_by': instance.updated_by,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'full_name': instance.full_name,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : CustomerResponse.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] as String?,
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.customer,
      'token': instance.token,
    };

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      json['token'] as int?,
      json['updated_at'] as String?,
      json['created_at'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
    };

GetTokenResponse _$GetTokenResponseFromJson(Map<String, dynamic> json) =>
    GetTokenResponse(
      json['data'] == null
          ? null
          : TokenResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetTokenResponseToJson(GetTokenResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.tokenResponse,
    };

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

EnvironmentResponse _$EnvironmentResponseFromJson(Map<String, dynamic> json) =>
    EnvironmentResponse(
      json['id'] as String?,
      json['display_text'] as String?,
      json['environment'] as String?,
    );

Map<String, dynamic> _$EnvironmentResponseToJson(
        EnvironmentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.display_text,
      'environment': instance.environment,
    };

DeployToResponse _$DeployToResponseFromJson(Map<String, dynamic> json) =>
    DeployToResponse(
      json['id'] as String?,
      json['display_text'] as String?,
      json['deployto'] as String?,
    );

Map<String, dynamic> _$DeployToResponseToJson(DeployToResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.display_text,
      'deployto': instance.deployto,
    };

ServerNameResponse _$ServerNameResponseFromJson(Map<String, dynamic> json) =>
    ServerNameResponse(
      json['id'] as String?,
      json['display_text'] as String?,
      json['servername'] as String?,
    );

Map<String, dynamic> _$ServerNameResponseToJson(ServerNameResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.display_text,
      'servername': instance.servername,
    };

TypeResponse _$TypeResponseFromJson(Map<String, dynamic> json) => TypeResponse(
      json['id'] as String?,
      json['display_text'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$TypeResponseToJson(TypeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.display_text,
      'type': instance.type,
    };

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) =>
    BranchResponse(
      json['id'] as String?,
      json['display_text'] as String?,
      json['branch'] as String?,
    );

Map<String, dynamic> _$BranchResponseToJson(BranchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_text': instance.display_text,
      'branch': instance.branch,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as String,
      json['full_name'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
    };

HostingDataResponse _$HostingDataResponseFromJson(Map<String, dynamic> json) =>
    HostingDataResponse(
      json['id'] as String?,
      json['project_detail_id'] as String?,
      json['git_repo'] as String?,
      json['remote_folder'] as String?,
      json['url'] as String?,
      json['admin_url'] as String?,
      json['technology'] as String?,
      json['created_at'] as String?,
      json['created_by'] as String?,
      ProjectResponse.fromJson(json['project'] as Map<String, dynamic>),
      json['environment'] == null
          ? null
          : EnvironmentResponse.fromJson(
              json['environment'] as Map<String, dynamic>),
      json['deployto'] == null
          ? null
          : DeployToResponse.fromJson(json['deployto'] as Map<String, dynamic>),
      json['servername'] == null
          ? null
          : ServerNameResponse.fromJson(
              json['servername'] as Map<String, dynamic>),
      json['type'] == null
          ? null
          : TypeResponse.fromJson(json['type'] as Map<String, dynamic>),
      json['branch'] == null
          ? null
          : BranchResponse.fromJson(json['branch'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['is_active'] as int?,
    );

Map<String, dynamic> _$HostingDataResponseToJson(
        HostingDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_detail_id': instance.project_detail_id,
      'git_repo': instance.git_repo,
      'remote_folder': instance.remote_folder,
      'url': instance.url,
      'admin_url': instance.admin_url,
      'technology': instance.technology,
      'created_by': instance.created_by,
      'created_at': instance.created_at,
      'project': instance.projectResponse,
      'environment': instance.environmentResponse,
      'deployto': instance.deployToResponse,
      'servername': instance.serverNameResponse,
      'type': instance.typeResponse,
      'branch': instance.branchResponse,
      'user': instance.userResponse,
      'is_active': instance.is_active,
    };

HostingResponse _$HostingResponseFromJson(Map<String, dynamic> json) =>
    HostingResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => HostingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HostingResponseToJson(HostingResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.hostingDataResponse,
    };

RoleDataResponse _$RoleDataResponseFromJson(Map<String, dynamic> json) =>
    RoleDataResponse(
      json['is_active'] as int?,
      json['id'] as int?,
      json['project_detail_id'] as String?,
      json['role_name'] as String?,
      json['credential'] as String?,
    );

Map<String, dynamic> _$RoleDataResponseToJson(RoleDataResponse instance) =>
    <String, dynamic>{
      'is_active': instance.is_active,
      'id': instance.id,
      'project_detail_id': instance.project_detail_id,
      'role_name': instance.role_name,
      'credential': instance.credential,
    };

RolesResponse _$RolesResponseFromJson(Map<String, dynamic> json) =>
    RolesResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => RoleDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RolesResponseToJson(RolesResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.roleDataResponse,
    };

CredentialDataResponse _$CredentialDataResponseFromJson(
        Map<String, dynamic> json) =>
    CredentialDataResponse(
      json['id'] as String?,
      json['project_role_id'] as String?,
      json['hosting_id'] as String?,
      json['project_detail_id'] as String?,
      json['username'] as String?,
      json['password'] as String?,
      json['is_active'] as int?,
      json['project_role'] == null
          ? null
          : RoleDataResponse.fromJson(
              json['project_role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CredentialDataResponseToJson(
        CredentialDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_detail_id': instance.project_detail_id,
      'hosting_id': instance.hosting_id,
      'project_role_id': instance.project_role_id,
      'username': instance.username,
      'password': instance.password,
      'is_active': instance.is_active,
      'project_role': instance.roleDataResponse,
    };

CredentialResponse _$CredentialResponseFromJson(Map<String, dynamic> json) =>
    CredentialResponse(
      (json['data'] as List<dynamic>?)
          ?.map(
              (e) => CredentialDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CredentialResponseToJson(CredentialResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.credentialDataResponse,
    };

AddCredentialDataResponse _$AddCredentialDataResponseFromJson(
        Map<String, dynamic> json) =>
    AddCredentialDataResponse(
      json['id'] as String?,
      json['project_role_id'] as String?,
      json['hosting_id'] as String?,
      json['project_detail_id'] as String?,
      json['username'] as String?,
      json['password'] as String?,
      json['is_active'] as String?,
    );

Map<String, dynamic> _$AddCredentialDataResponseToJson(
        AddCredentialDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_detail_id': instance.project_detail_id,
      'hosting_id': instance.hosting_id,
      'project_role_id': instance.project_role_id,
      'username': instance.username,
      'password': instance.password,
      'is_active': instance.is_active,
    };

AddCredentialResponse _$AddCredentialResponseFromJson(
        Map<String, dynamic> json) =>
    AddCredentialResponse(
      json['data'] == null
          ? null
          : AddCredentialDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AddCredentialResponseToJson(
        AddCredentialResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.addCredentialDataResponse,
    };

DeleteCredentialResponse _$DeleteCredentialResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteCredentialResponse(
      json['data'] as String?,
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DeleteCredentialResponseToJson(
        DeleteCredentialResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ForgotPassResponse _$ForgotPassResponseFromJson(Map<String, dynamic> json) =>
    ForgotPassResponse(
      json['data'] as String?,
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgotPassResponseToJson(ForgotPassResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

AddHostingResponse _$AddHostingResponseFromJson(Map<String, dynamic> json) =>
    AddHostingResponse(
      json['data'] as String?,
    )
      ..status = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AddHostingResponseToJson(AddHostingResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
