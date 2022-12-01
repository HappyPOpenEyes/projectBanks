import 'package:dartz/dartz.dart';
import 'package:project_bank/data/request/request.dart';

import '../../data/network/failure.dart';
import '../../data/response/response.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AddHostingUseCase implements BaseUseCase<AddHostingUseCaseInput, GetHostingActiveObjectData> {
  Repository _repository;
  AddHostingUseCase(this._repository);

  @override
  Future<Either<Failure, GetHostingActiveObjectData>> execute(
      AddHostingUseCaseInput input) async {
    return await _repository.addHosting(AddHostingRequest(
        input.hostingId, input.isActive,input.project_detail_id!,input.deployto_id!,input.environment_id!,input.server_name_id!,input.type_id!,input.git_repo,input.branch_id!,input.remote_folder,input.url,input.admin_url,input.technology,input.created_by,input.updated_by,input.created_at,input.updated_at));
  }
}

class AddHostingUseCaseInput {
  String hostingId;
  bool isActive;
  String? project_detail_id;
  String? deployto_id;
  String? environment_id;
  String? server_name_id;
  String? type_id;
  String git_repo;
  String? branch_id;
  String remote_folder;
  String url;
  String admin_url;
  String technology;
  String created_by;
  String updated_by;
  String created_at;
  String updated_at;
  AddHostingUseCaseInput(this.hostingId, this.isActive,this.project_detail_id,this.deployto_id,this.environment_id,this.server_name_id,this.type_id,this.git_repo,this.branch_id,this.remote_folder,this.url,this.admin_url,this.technology,this.created_by,this.updated_by,this.created_at,this.updated_at);
}