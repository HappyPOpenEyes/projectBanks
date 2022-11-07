import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class TokenUseCase extends BaseUseCase<void, GetTokenData> {
  Repository _repository;
  TokenUseCase(this._repository);
  @override
  Future<Either<Failure, GetTokenData>> execute(void input) async {
    return await _repository.getToken();
  }
}