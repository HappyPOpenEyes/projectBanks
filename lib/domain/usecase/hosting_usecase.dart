import 'package:dartz/dartz.dart';
import 'package:project_bank/domain/model/model.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class HostingUseCase extends BaseUseCase<void, HostingArrayObject> {
  Repository _repository;
  HostingUseCase(this._repository);
  @override
  Future<Either<Failure, HostingArrayObject>> execute(void input) async {
    return await _repository.getHosting();
  }
}