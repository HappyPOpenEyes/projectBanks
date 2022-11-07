import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';


@freezed
class LoginObject with _$LoginObject{
  factory LoginObject(String userName,String password, String token) = _LoginObject;
}
@freezed
class ForgotPasswordObject with _$ForgotPasswordObject{
  factory ForgotPasswordObject(String userName,String password, String token) = _ForgotPasswordObject;
}
@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(String countryMobileCode, String mobileNumber, String userName,
      String email, String password, String profilePicture)  = _RegisterObject;
}
@freezed
class RolesObject with _$RolesObject{
  factory RolesObject(String projectId) = _RolesObject;
}
@freezed
class CredentialsObject with _$CredentialsObject{
  factory CredentialsObject(String project_detail_id,String hosting_id) = _CredentialsObject;
}
@freezed
class AddCredentialsObject with _$AddCredentialsObject{
  factory AddCredentialsObject(String addCredentialArray) = _AddCredentialsObject;
}