import '../../data/request/request.dart';
import '../../data/network/failure.dart';
import '../../data/request/request.dart';
import 'package:dartz/dartz.dart';

import '../../data/response/response.dart';
import '../model/model.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure,GetTokenData>> getToken();
  Future<Either<Failure,HostingArrayObject>> getHosting();
  Future<Either<Failure,RolesArrayObject>> getRoles(RolesRequest rolesRequest);
  Future<Either<Failure,CredentialsArrayObject>> getCredentials(CredentialsRequest credentialsRequest);
  Future<Either<Failure,AddCredentialsObject>> addcredential(AddCredentialsRequest addCredentialsRequest);
  Future<Either<Failure,DeleteCredential>> deleteCredential(DeleteCredentialsRequest deleteCredentialsRequest);
  Future<Either<Failure,ForgotPassword>> forgotPassword(ForgotPasswordRequest forgotPasswordRequest);
  Future<Either<Failure,GetHostingActiveObjectData>> addHosting(AddHostingRequest addHostingRequest);
}