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
    return await _repository.addcredential(AddCredentialsRequest(input.project_detail_id,input.hosting_id,input.isActive,input.password,input.projectRoleId,input.username));
  }
}

class AddCredentialUseCaseInput {
  String project_detail_id;
  String hosting_id;
  String isActive;
  String password;
  String projectRoleId;
  String username;
  AddCredentialUseCaseInput(this.project_detail_id,this.hosting_id,this.isActive,this.password,this.projectRoleId,this.username);
}