import 'package:dartz/dartz.dart';
import 'package:project_bank/data/request/request.dart';

import '../../data/network/failure.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AddCredentialUseCase implements BaseUseCase<AddCredentialUseCaseInput, AddCredentialsObject> {
  Repository _repository;

  AddCredentialUseCase(this._repository);

  @override
  Future<Either<Failure, AddCredentialsObject>> execute(
      AddCredentialUseCaseInput input) async {
    return await _repository.addcredential(AddCredentialsRequest(input.addCredentialArray));
  }
}

class AddCredentialUseCaseInput {
  String addCredentialArray;
  AddCredentialUseCaseInput(this.addCredentialArray);
}