import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<ForgotPasswordUseCaseInput, ForgotPassword> {
  Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgotPassword>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(ForgotPasswordRequest(
        input.email, input.password,input.token));
  }
}

class ForgotPasswordUseCaseInput {
  String email;
  String password;
  String token;
  ForgotPasswordUseCaseInput(this.email, this.password,this.token);
}