


import 'package:project_bank/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/model/model.dart';
import '../../domain/usecase/credentials_usecase.dart';
import '../../domain/usecase/deletecredential_usecase.dart';
import '../common/freezed_data_classes.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';

class CredentialsViewModel extends BaseViewModel with HostingDetailsViewModelInputs, HostingDetailsViewModelOutputs{
  var credentialsObject = CredentialsObject("","");
  List<RolesData> rolesData =[];
  List<CredentialsData> credentialsData =[];
  CredentialsUseCase _credentialsUseCase;
  DeleteCredentialsUseCase _deleteCredentialsUseCase;
  final _credeTialStreamController = BehaviorSubject<CredentialsDetailsViewObject>();
  CredentialsViewModel(this._credentialsUseCase,this._deleteCredentialsUseCase);
  @override
  void start() {
    // TODO: implement start
    _getCredentials();
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
    });

  }
  @override
  deleteCredential(String hostingId) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _deleteCredentialsUseCase.execute(DeleteCredentialsCaseInput(hostingId))).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (CredentialsDetailsObject) {
      print("Deleted...");
      //inputState.add(SuccessState("Deleted Successfully !"));
      _getCredentials();
     // _getCredentials();
      //inputState.add(ContentState());
      //  print(CredentialsDetailsObject.credentialsData.length);
    });

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
    _credeTialStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCredentialsData => _credeTialStreamController.sink;

  // outputs
  @override
  // TODO: implement outputCredentialsData
  Stream<CredentialsDetailsViewObject> get outputCredentialsData =>  _credeTialStreamController.stream.map((data) => data);

}

abstract class HostingDetailsViewModelInputs {
  setRequestDataForCredential(String projectIdPass,String hostingId);
  Sink get inputCredentialsData;
}

abstract class HostingDetailsViewModelOutputs {
  Stream<CredentialsDetailsViewObject> get outputCredentialsData;

}
class CredentialsDetailsViewObject {
  List<CredentialsData> credentialsData;
  CredentialsDetailsViewObject(this.credentialsData);
}