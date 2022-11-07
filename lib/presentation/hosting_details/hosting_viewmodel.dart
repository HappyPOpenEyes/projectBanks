
import 'dart:ffi';

import 'package:project_bank/domain/usecase/credentials_usecase.dart';
import 'package:project_bank/domain/usecase/roles_usecase.dart';
import 'package:project_bank/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/model/model.dart';
import '../../domain/model/model.dart';
import '../../domain/model/model.dart';
import '../common/freezed_data_classes.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';

class HostingDetailsViewModel extends BaseViewModel with HostingDetailsViewModelInputs, HostingDetailsViewModelOutputs{
  var rolesObject = RolesObject("");
  var credentialsObject = CredentialsObject("","");
  List<RolesData> rolesData =[];
  List<CredentialsData> credentialsData =[];
  RolesUseCase _rolesUseCase;
  CredentialsUseCase _credentialsUseCase;
  final _dataStreamController = BehaviorSubject<HostingDetailsViewObject>();
  final _credeTialStreamController = BehaviorSubject<CredentialsDetailsViewObject>();
  HostingDetailsViewModel(this._rolesUseCase,this._credentialsUseCase);
  @override
  void start() {
    // TODO: implement start
    _getRoles();
  }
  _getRoles() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _rolesUseCase.execute(RolesUseCaseInput(rolesObject.projectId))).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (HostingDetailsObject) {
      inputState.add(ContentState());
      inputHostingDetailsData.add(HostingDetailsViewObject(HostingDetailsObject.rolesData));
      rolesData = HostingDetailsObject.rolesData;
     //print(HostingDetailsObject.rolesData.length);
      _getCredentials();
    });
  }

  _getCredentials() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _credentialsUseCase.execute(CredentialCaseInput(credentialsObject.project_detail_id,credentialsObject.hosting_id))).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (CredentialsDetailsObject) {
      inputState.add(ContentState());
      inputCredentialsData.add(CredentialsDetailsViewObject(CredentialsDetailsObject.credentialsData));
      credentialsData = CredentialsDetailsObject.credentialsData;
    //  print(CredentialsDetailsObject.credentialsData.length);
      if (CredentialsDetailsObject.credentialsData.length>0){
        for (var i in CredentialsDetailsObject.credentialsData) {
          for(var j in rolesData){
            print(i.project_role_id);
            print(j.id);
            if(i.project_role_id.toString() == j.id.toString()){
              if(j.credentials.isEmpty){
                j.credentials = i.username;
              }
              else {
                j.credentials = j.credentials+" "+i.username;
              }
          }
          }
        }

      }
    });

  }
  @override
  setProjectId(String projectIdPass) {
    // TODO: implement setPassword
    rolesObject = rolesObject.copyWith(
        projectId: projectIdPass); // data class operation same as kotlin
  }
  @override
  setRequestDataForCredential(String projectIdPass,String hostingId) {
    // TODO: implement setPassword
    credentialsObject = credentialsObject.copyWith(
        project_detail_id: projectIdPass);
    credentialsObject = credentialsObject.copyWith(
        hosting_id: hostingId);
    // data class operation same as kotlin
  }
  @override
  void dispose() {
    _dataStreamController.close();
    _credeTialStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHostingDetailsData => _dataStreamController.sink;
  Sink get inputCredentialsData => _credeTialStreamController.sink;

  // outputs
  Stream<HostingDetailsViewObject> get outputHostingDetailsData =>
      _dataStreamController.stream.map((data) => data);

  @override
  // TODO: implement outputCredentialsData
  Stream<CredentialsDetailsViewObject> get outputCredentialsData =>  _credeTialStreamController.stream.map((data) => data);


}

abstract class HostingDetailsViewModelInputs {
  setProjectId(String projectIdPass);
  setRequestDataForCredential(String projectIdPass,String hostingId);
  Sink get inputHostingDetailsData;
  Sink get inputCredentialsData;
}

abstract class HostingDetailsViewModelOutputs {
  Stream<HostingDetailsViewObject> get outputHostingDetailsData;
  Stream<CredentialsDetailsViewObject> get outputCredentialsData;

}
class HostingDetailsViewObject {
  List<RolesData> rolesData;
  HostingDetailsViewObject(this.rolesData);
}
class CredentialsDetailsViewObject {
  List<CredentialsData> credentialsData;
  CredentialsDetailsViewObject(this.credentialsData);
}