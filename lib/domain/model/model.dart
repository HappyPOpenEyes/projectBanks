import 'dart:convert';
import 'dart:ffi';

class Customer {
  String id;
  String role_id;
  String first_name;
  String last_name;
  String phoneno;
  String profile_image;
  String email;
  String created_by;
  String updated_by;
  String created_at;
  String updated_at;
  String full_name;
  Customer(this.id, this.role_id, this.first_name,this.last_name,this.profile_image,this.phoneno,this.email,this.created_by,this.updated_by,this.created_at,this.updated_at,this.full_name);
}


class Authentication {
  Customer? customer;
  String token;
  Authentication(this.customer,this.token);
}

class DeleteCredential {
  String data;
  DeleteCredential(this.data,);
}
class ForgotPassword {
  String data;
  ForgotPassword(this.data,);
}

class TokenData {
  int token;
  String id;
  String updated_at;
  String created_at;

  TokenData(this.token, this.id, this.updated_at,this.created_at);
}
class GetTokenData {
  TokenData? tokenData;
  GetTokenData(this.tokenData);
}
class ProjectData {
  String id;
  String name;
  ProjectData(this.id, this.name);
}
class EnvironmentData {
  String id;
  String display_text;
  String environment;
  EnvironmentData(this.id, this.display_text,this.environment);
}
class DeployToData {
  String id;
  String display_text;
  String deployto;
  DeployToData(this.id, this.display_text,this.deployto);
}
class ServerNameData {
  String id;
  String display_text;
  String servername;
  ServerNameData(this.id, this.display_text,this.servername);
}
class TypeData {
  String id;
  String display_text;
  String type;
  TypeData(this.id, this.display_text,this.type);
}
class BranchData {
  String id;
  String display_text;
  String branch;
  BranchData(this.id, this.display_text,this.branch);
}
class GetHostingData {
  String id;
  String? project_detail_id;
  String git_repo;
  String remote_folder;
  String url;
  String admin_url;
  String technology;
  String created_by;
  String created_at;
  int is_active;
  ProjectData? projectData;
  EnvironmentData? environmentData;
  DeployToData? deployToData;
  ServerNameData? serverNameData;
  TypeData? typeData;
  BranchData? branchData;
  GetHostingData(this.id,this.project_detail_id,this.git_repo,this.remote_folder,this.url,this.admin_url,this.technology,this.created_by,this.created_at,this.projectData,this.environmentData,this.deployToData,this.serverNameData,this.typeData,this.branchData,this.is_active);
}
class HostingArrayObject {
  List<GetHostingData> getHostingData;
  HostingArrayObject(this.getHostingData);
}
class CredentialsData {

  String id;
  String project_detail_id;
  String hosting_id;
  String project_role_id;
  String username;
  String password;
  int is_active;
  RolesData? rolesData;

  CredentialsData(this.id, this.project_detail_id, this.hosting_id,this.project_role_id,this.username,this.password,this.is_active,this.rolesData);
}
class AddCredentialsData {

  String id;
  String project_detail_id;
  String hosting_id;
  String project_role_id;
  String username;
  String password;
  String is_active;

  AddCredentialsData(this.id, this.project_detail_id, this.hosting_id,this.project_role_id,this.username,this.password,this.is_active);
}
class CredentialsArrayObject {
  List<CredentialsData> credentialsData;
  CredentialsArrayObject(this.credentialsData);
}
class AddCredentialsObject {
  AddCredentialsData? addCredentialsData;
  AddCredentialsObject(this.addCredentialsData);
}
class RolesData {
  int is_active;
  int id;
  String project_detail_id;
  String role_name;
  String credentials;
  RolesData(this.is_active, this.id, this.project_detail_id,this.role_name,this.credentials);
}
class RolesArrayObject {
  List<RolesData> rolesData;
  RolesArrayObject(this.rolesData);
}
// To parse this JSON data, do
//
//     final addCredentialPost = addCredentialPostFromJson(jsonString);

List<AddCredentialPost> addCredentialPostFromJson(String str) => List<AddCredentialPost>.from(json.decode(str).map((x) => AddCredentialPost.fromJson(x)));

String addCredentialPostToJson(List<AddCredentialPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddCredentialPost {
  AddCredentialPost({
    required this.id,
    required this.projectDetailId,
    required this.hostingId,
    required this.isActive,
    required this.password,
    required this.projectRoleId,
    required this.username,
  });

  String id;
  String projectDetailId;
  String hostingId;
  String isActive;
  String password;
  String projectRoleId;
  String username;

  factory AddCredentialPost.fromJson(Map<String, dynamic> json) => AddCredentialPost(
    id: json["id"],
    projectDetailId: json["project_detail_id"],
    hostingId: json["hosting_id"],
    isActive: json["is_active"],
    password: json["password"],
    projectRoleId: json["project_role_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_detail_id": projectDetailId,
    "hosting_id": hostingId,
    "is_active": isActive,
    "password": password,
    "project_role_id": projectRoleId,
    "username": username,
  };


}

// To parse this JSON data, do
//
//     final addCredentialGet = addCredentialGetFromJson(jsonString);


List<AddCredentialGet> addCredentialGetFromJson(String str) => List<AddCredentialGet>.from(json.decode(str).map((x) => AddCredentialGet.fromJson(x)));

String addCredentialGetToJson(List<AddCredentialGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddCredentialGet {
  AddCredentialGet({
    required this.code,
    required this.message,
    required this.data,
    required this.token,
    required this.success,
  });

  int code;
  String message;
  Data data;
  String token;
  String success;

  factory AddCredentialGet.fromJson(Map<String, dynamic> json) => AddCredentialGet(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
    "token": token,
    "success": success,
  };
}

class Data {
  Data({
    required this.createdBy,
    required this.projectDetailId,
    required this.hostingId,
    required this.projectRoleId,
    required this.username,
    required this.password,
    required this.isActive,
    required this.updatedBy,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  String createdBy;
  String projectDetailId;
  String hostingId;
  String projectRoleId;
  String username;
  String password;
  String isActive;
  String updatedBy;
  String id;
  DateTime updatedAt;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdBy: json["created_by"],
    projectDetailId: json["project_detail_id"],
    hostingId: json["hosting_id"],
    projectRoleId: json["project_role_id"],
    username: json["username"],
    password: json["password"],
    isActive: json["is_active"],
    updatedBy: json["updated_by"],
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "created_by": createdBy,
    "project_detail_id": projectDetailId,
    "hosting_id": hostingId,
    "project_role_id": projectRoleId,
    "username": username,
    "password": password,
    "is_active": isActive,
    "updated_by": updatedBy,
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}

