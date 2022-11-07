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
  String addCredentialArray;
  AddCredentialsRequest(this.addCredentialArray);
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