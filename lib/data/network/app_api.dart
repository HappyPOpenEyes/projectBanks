
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constant.dart';
import '../response/response.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      @Field("token") String token,
      );

  @GET("/getToken")
  Future<GetTokenResponse> getToken();

  @GET("/gethosting")
  Future<HostingResponse> getHosting(
      @Header("Authorization") String token,
      );

  @GET("/getprojectrole/{ProjectId}")
  Future<RolesResponse> getRoles(
      @Header("Authorization") String token,
      @Path("ProjectId") String projectId,
      );

  @POST("/getcredentials")
  Future<CredentialResponse> getCredintial(
      @Header("Authorization") String token,
      @Field("project_detail_id") String projectId,
      @Field("hosting_id") String hostingId,
      );

  @POST("/addcredential")
  Future<AddCredentialResponse> addcredential(
      @Header("Authorization") String token,
      @Body() String addCredentialArray,
      );
  @POST("/deletecredential")
  Future<DeleteCredentialResponse> deletecredential(
      @Header("Authorization") String token,
      @Field("id") String credentialId,
      );

  @POST("/password/email")
  Future<ForgotPassResponse> forgotPass(
      @Field("email") String email,
      @Field("password") String password,
      @Field("token") String token,
      );
}

