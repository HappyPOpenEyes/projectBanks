
import 'package:dartz/dartz.dart';
import 'package:project_bank/data/mapper/mapper.dart';
import '../../domain/model/model.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../request/request.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  //LocalDataSource _localDataSource;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, GetTokenData>> getToken() async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.getToken();
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          print("Failuare..................");
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE,
                  response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HostingArrayObject>> getHosting()  async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.getHosting();
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          print("Failuare..................");
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE,
                  response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, RolesArrayObject>> getRoles(RolesRequest rolesRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.getRoles(rolesRequest);
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          print("Failuare..................");
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE,
                  response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CredentialsArrayObject>> getCredentials(CredentialsRequest credentialsRequest)async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.getCredentials(credentialsRequest);
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          print("Failuare..................");
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE,
                  response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, DeleteCredential>> deleteCredential(DeleteCredentialsRequest deleteCredentialsRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.deletecredential(deleteCredentialsRequest);
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          print("Successes..................");
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          print("Failure..................");
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE,
                  response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        print("Failure..................2");
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      print("Failure..................3");
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddCredentialsObject>> addcredential(AddCredentialsRequest addCredentialsRequest)  async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.addcredential(addCredentialsRequest);
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          print("Successes..................");
          return Right(response.toDomain());
        }
        else {
          // return biz logic error
          // return left
          print("Failure..................");
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE,
                  response.message ?? ResponseMessage.DEFAULT));
        }
    }
    catch (error) {
        print("Failure..................2");
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      print("Failure..................3");
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ForgotPassword>> forgotPassword(ForgotPasswordRequest forgotPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      try {
        final response = await _remoteDataSource.forgotPassword(forgotPasswordRequest);
        if (response.status == ResponseCode.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}


