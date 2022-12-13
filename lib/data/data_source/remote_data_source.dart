
import 'package:project_bank/app/app_prefs.dart';
import 'package:project_bank/app/di.dart';
import 'package:project_bank/domain/model/model.dart';

import '../network/app_api.dart';
import '../request/request.dart';
import '../response/response.dart';



abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPassResponse> forgotPassword(ForgotPasswordRequest forgotPasswordRequest);
  Future<GetTokenResponse> getToken();
  Future<HostingResponse> getHosting();
  Future<RolesResponse> getRoles(RolesRequest rolesRequest);
  Future<CredentialResponse> getCredentials(CredentialsRequest credentialsRequest);
  Future<AddCredentialResponse>addcredential(AddCredentialsRequest addCredentialsRequest);
  Future<DeleteCredentialResponse> deletecredential(DeleteCredentialsRequest deleteCredentialsRequest);
  Future<AddHostingResponse> addHosting(AddHostingRequest addHostingRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {

    return await _appServiceClient.login(loginRequest.email, loginRequest.password, loginRequest.token);

  }

  @override
  Future<ForgotPassResponse> forgotPassword(ForgotPasswordRequest forgotPasswordRequest) async {

    return await _appServiceClient.forgotPass(forgotPasswordRequest.email, forgotPasswordRequest.password, forgotPasswordRequest.token);

  }

  @override
  Future<GetTokenResponse> getToken() async {
    return await _appServiceClient.getToken();
  }

  @override
  Future<HostingResponse> getHosting() async{
    return await _appServiceClient.getHosting(instance<AppPreferences>().getAuthenticationToken());
  }

  @override
  Future<RolesResponse> getRoles(RolesRequest rolesRequest) async{
    return await _appServiceClient.getRoles(instance<AppPreferences>().getAuthenticationToken(),rolesRequest.projectId);

  }
  @override
  Future<CredentialResponse> getCredentials(CredentialsRequest credentialsRequest) async {

    return await _appServiceClient.getCredintial(instance<AppPreferences>().getAuthenticationToken(),credentialsRequest.hosting_id,credentialsRequest.project_detail_id);

  }

  @override
  Future<AddCredentialResponse> addcredential(AddCredentialsRequest addCredentialsRequest) async {
    return await _appServiceClient.addcredential(instance<AppPreferences>().getAuthenticationToken(),addCredentialsRequest.project_detail_id,addCredentialsRequest.hosting_id,addCredentialsRequest.isActive,addCredentialsRequest.password,addCredentialsRequest.projectRoleId,addCredentialsRequest.username);
  }

  @override
  Future<DeleteCredentialResponse> deletecredential(DeleteCredentialsRequest deleteCredentialsRequest) async {
    return await _appServiceClient.deletecredential(instance<AppPreferences>().getAuthenticationToken(),deleteCredentialsRequest.hosting_id);
  }

  @override
  Future<AddHostingResponse> addHosting(AddHostingRequest addHostingRequest) async {
    return await _appServiceClient.addHosting(instance<AppPreferences>().getAuthenticationToken(),addHostingRequest.hosting_id,addHostingRequest.is_active,addHostingRequest.project_detail_id,addHostingRequest.deployto_id,addHostingRequest.environment_id,addHostingRequest.server_name_id,addHostingRequest.type_id,addHostingRequest.git_repo,addHostingRequest.branch_id,addHostingRequest.remote_folder,addHostingRequest.url,addHostingRequest.admin_url,addHostingRequest.technology,addHostingRequest.created_by,addHostingRequest.updated_by,addHostingRequest.created_at,addHostingRequest.updated_at);
  }
}