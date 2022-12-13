class LoginRequest {
  String email;
  String password;
  String token;
  //String imei;
  //String deviceType;

  LoginRequest(this.email, this.password, this.token);
}
class RolesRequest {
  String projectId;
  RolesRequest(this.projectId);
}
class CredentialsRequest {
  String project_detail_id;
  String hosting_id;
  CredentialsRequest(this.project_detail_id,this.hosting_id);
}
class AddCredentialsRequest {
  String project_detail_id;
  String hosting_id;
  String isActive;
  String password;
  String projectRoleId;
  String username;
  AddCredentialsRequest(this.project_detail_id,this.hosting_id,this.isActive,this.password,this.projectRoleId,this.username);
}
class DeleteCredentialsRequest {
  String hosting_id;
  DeleteCredentialsRequest(this.hosting_id);
}
class ForgotPasswordRequest {
  String email;
  String password;
  String token;
  //String imei;
  //String deviceType;

  ForgotPasswordRequest(this.email, this.password, this.token);
}
class AddHostingRequest {
  String hosting_id;
  bool is_active;
  String project_detail_id;
  String deployto_id;
  String environment_id;
  String server_name_id;
  String type_id;
  String git_repo;
  String branch_id;
  String remote_folder;
  String url;
  String admin_url;
  String technology;
  String created_by;
  String updated_by;
  String created_at;
  String updated_at;
  AddHostingRequest(this.hosting_id, this.is_active,this.project_detail_id,this.deployto_id,this.environment_id,this.server_name_id,this.type_id,this.git_repo,this.branch_id,this.remote_folder,this.url,this.admin_url,this.technology,this.created_by,this.updated_by,this.created_at,this.updated_at);
}