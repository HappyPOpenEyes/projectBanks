import 'package:dartz/dartz.dart';
import 'package:project_bank/data/request/request.dart';

import '../../data/network/failure.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class DeleteCredentialsUseCase extends BaseUseCase<DeleteCredentialsCaseInput, DeleteCredential> {
  Repository _repository;

  DeleteCredentialsUseCase(this._repository);

  @override
  Future<Either<Failure, DeleteCredential>> execute(
      DeleteCredentialsCaseInput input) async {
    return await _repository.deleteCredential(DeleteCredentialsRequest(input.hosting_id,));
  }
}
class DeleteCredentialsCaseInput {
  String hosting_id;
  DeleteCredentialsCaseInput(this.hosting_id);
}