
import 'package:dartz/dartz.dart';
import 'package:project_bank/data/request/request.dart';
import 'package:project_bank/domain/model/model.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RolesUseCase extends BaseUseCase<RolesUseCaseInput, RolesArrayObject> {
  Repository _repository;

  RolesUseCase(this._repository);

  @override
  Future<Either<Failure, RolesArrayObject>> execute(
      RolesUseCaseInput input) async {
    return await _repository.getRoles(RolesRequest(input.projectId));
  }
}
class RolesUseCaseInput {
  String projectId;
  RolesUseCaseInput(this.projectId);
}