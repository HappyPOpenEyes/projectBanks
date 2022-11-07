import 'package:dartz/dartz.dart';
import 'package:project_bank/data/request/request.dart';
import 'package:project_bank/domain/model/model.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class CredentialsUseCase extends BaseUseCase<CredentialCaseInput, CredentialsArrayObject> {
  Repository _repository;

  CredentialsUseCase(this._repository);

  @override
  Future<Either<Failure, CredentialsArrayObject>> execute(
      CredentialCaseInput input) async {
    return await _repository.getCredentials(CredentialsRequest(input.hosting_id,input.project_detail_id));
  }
}
class CredentialCaseInput {
  String project_detail_id;
  String hosting_id;
  CredentialCaseInput(this.project_detail_id,this.hosting_id);
}