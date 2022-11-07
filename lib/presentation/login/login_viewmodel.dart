import 'dart:async';
import 'dart:ffi';

import 'package:project_bank/app/app_prefs.dart';
import 'package:project_bank/domain/model/model.dart';
import 'package:project_bank/domain/usecase/token_usecase.dart';
import 'package:project_bank/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../app/function.dart';
import '../../domain/usecase/login_usecase.dart';
import '../common/freezed_data_classes.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController = StreamController<
      bool>();
  // inputs

  var loginObject = LoginObject("","","");
  LoginUseCase _loginUseCase;
  TokenUseCase _tokenUseCase;
  final _dataStreamController = BehaviorSubject<TokenObject>();
  AppPreferences _appPreferences;
  LoginViewModel(this._loginUseCase,this._tokenUseCase,this._appPreferences);


  @override
  void dispose() {
    _userNameStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
    _dataStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
    _getToken();
    // TODO: implement start
  }

  _getToken() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _tokenUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (homeObject) {
      inputState.add(ContentState());
      String? tempAge = homeObject.tokenData?.token.toString();
      setToken(tempAge!);
    });
  }
  @override
  Sink get inputHomeData => _dataStreamController.sink;

  // outputs
  Stream<TokenObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _loginUseCase.execute(
        LoginUseCaseInput(loginObject.userName, loginObject.password,loginObject.token)))
        .fold(
            (failure) =>
        {
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.POPUP_ERROR_STATE, failure.message))
        },
            (data) async {
              _appPreferences.setAuthenticationToken("Bearer "+data.token);
          // right -> success (data)
          inputState.add(ContentState());

          // navigate to main screen after the login
          isUserLoggedInSuccessfullyStreamController.add(true);
        });
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); // data class operation same as kotlin
    _validate();
  }


  @override
  setToken(String token) {
    // TODO: implement setPassword
    loginObject = loginObject.copyWith(
        token: token); // data class operation same as kotlin
    _validate();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(
        userName: userName); // data class operation same as kotlin
    _validate();
  }

  // outputs
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return isEmailValid(userName);
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
}

abstract class LoginViewModelInputs {
  // three functions for actions
  setUserName(String userName);
  setPassword(String password);
  setToken(String token);
  login();
  Sink get inputHomeData;
// two sinks for streams
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
  Stream<TokenObject> get outputHomeData;
}

class TokenObject {
  TokenData tokenData;
  TokenObject(this.tokenData);
}