
import 'dart:ffi';

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

  @POST("/addhosting")
  Future<AddHostingResponse> addHosting(
      @Header("Authorization") String token,
      @Field("id") String hostingId,
      @Field("is_active") bool isActive,
      @Field("project_detail_id") String project_detail_id,
      @Field("deployto_id") String deployto_id,
      @Field("environment_id") String environment_id,
      @Field("server_name_id") String server_name_id,
      @Field("type_id") String type_id,
      @Field("git_repo") String git_repo,
      @Field("branch_id") String branch_id,
      @Field("remote_folder") String remote_folder,
      @Field("url") String url,
      @Field("admin_url") String admin_url,
      @Field("technology") String technology,
      @Field("created_by") String created_by,
      @Field("updated_by") String updated_by,
      @Field("created_at") String created_at,
      @Field("updated_at") String updated_at,
      );

  @POST("/password/email")
  Future<ForgotPassResponse> forgotPass(
      @Field("email") String email,
      @Field("password") String password,
      @Field("token") String token,
      );
}

