import 'dart:async';
import 'dart:convert';

import 'package:project_bank/data/mapper/mapper.dart';
import 'package:project_bank/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../app/function.dart';
import '../../domain/model/model.dart';
import '../../domain/usecase/addcredential_usecase.dart';
import '../../domain/usecase/roles_usecase.dart';
import '../common/freezed_data_classes.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';

class EditCredentialViewModel extends BaseViewModel with HostingDetailsViewModelInputs, HostingDetailsViewModelOutputs{

  final StreamController _userNameController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _roleController = StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();

  AddCredentialPost addCredentialPostObj = AddCredentialPost(id: "", projectDetailId: "", hostingId: "", isActive: "", password: "", projectRoleId: "", username: "");

  var rolesObject = RolesObject("");
  //var addCrediantalObject = AddCredentialsObject("");
  String addCredentialArray = "";
  List<RolesData> rolesData =[];
  final RolesUseCase _rolesUseCase;

  final AddCredentialUseCase _addCredentialUseCase;
  final _dataStreamController = BehaviorSubject<HostingDetailsViewObject>();
  EditCredentialViewModel(this._rolesUseCase,this._addCredentialUseCase);
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
    });
  }

  @override
  setProjectId(String projectIdPass) {
    // TODO: implement setPassword
    rolesObject = rolesObject.copyWith(
        projectId: projectIdPass); // data class operation same as kotlin
  }
  setAddCredentialPara(List<AddCredentialPost> addCredentialPost) {
    addCredentialArray= addCredentialPostToJson(addCredentialPost);
  }

  @override
  void dispose() {
    _userNameController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    _roleController.close();
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHostingDetailsData => _dataStreamController.sink;

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputRollName => _roleController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;



  // outputs
  Stream<HostingDetailsViewObject> get outputHostingDetailsData =>
      _dataStreamController.stream.map((data) => data);

  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => _userNameController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsRollNameValid => _roleController.stream
      .map((rollName) => _isRoleNameValid(rollName));

  @override
  Stream<bool?> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  validate() {
    inputIsAllInputValid.add(null);
    //_isAllInputsValid();
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(addCredentialPostObj.password) &&
        _isUserNameValid(addCredentialPostObj.username) &&
        _isRoleNameValid(addCredentialPostObj.projectRoleId);

  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return isEmailValid(userName);
  }
  bool _isRoleNameValid(String rollName) {
    return rollName.isNotEmpty;
  }



  @override
  addCredential() async {
    List<AddCredentialPost> addCredentialPostArray =[];
    addCredentialPostArray.add(addCredentialPostObj);
    setAddCredentialPara(addCredentialPostArray);
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _addCredentialUseCase.execute(
        AddCredentialUseCaseInput(addCredentialArray)))
        .fold(
            (failure) =>
        {
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.POPUP_ERROR_STATE, failure.message))
        },
            (data) async {
          // right -> success (data)
              inputState.add(SuccessState("Credential Saved!"));

          // navigate to main screen after the login
        });
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    inputPassword.add(password);
    addCredentialPostObj.password = password; // data class operation same as kotlin
    validate();
  }
  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    inputUserName.add(userName);
    addCredentialPostObj.username = userName; // data class operation same as kotlin
    validate();
  }
  @override
  setRollName(String? rollId) {
    // TODO: implement setUserName
    inputRollName.add(rollId);
    addCredentialPostObj.projectRoleId = rollId ?? ""; // data class operation same as kotlin
    validate();
  }
}

abstract class HostingDetailsViewModelInputs {
  setProjectId(String projectIdPass);
  setUserName(String userName);
  setPassword(String password);
  setRollName(String rollId);
  addCredential();
  Sink get inputHostingDetailsData;
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputRollName;
  Sink get inputIsAllInputValid;
}

abstract class HostingDetailsViewModelOutputs {
  Stream<HostingDetailsViewObject> get outputHostingDetailsData;
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsRollNameValid;
  Stream<bool?> get outputIsAllInputsValid;

}
class HostingDetailsViewObject {
  List<RolesData> rolesData;
  HostingDetailsViewObject(this.rolesData);
}
