import 'dart:async';

import 'package:project_bank/presentation/base/baseviewmodel.dart';

import '../../app/function.dart';
import '../../domain/usecase/forgotpassword_usecase.dart';
import '../common/freezed_data_classes.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';

class ForgotPasswordViewModel extends BaseViewModel with ForgotPasswordViewModelInput,ForgotPasswordViewModelOutput{
  final StreamController _emailStreamController =
  StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
  StreamController<void>.broadcast();
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  var forgotPasswordObject = ForgotPasswordObject("","","");

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _forgotPasswordUseCase.execute(
        ForgotPasswordUseCaseInput(forgotPasswordObject.userName, forgotPasswordObject.password,forgotPasswordObject.token)))
        .fold(
            (failure) =>
        {
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.POPUP_ERROR_STATE, failure.message))
        },
            (data) async {
          // right -> success (data)
              inputState.add(SuccessState("We have emailed your password reset link!"));

          // navigate to main screen after the login
        });
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    forgotPasswordObject = forgotPasswordObject.copyWith(
        userName: email); // data class operation same as kotlin
    _validate();
  }
  @override
  setToken(String token) {
    // TODO: implement setPassword
    forgotPasswordObject = forgotPasswordObject.copyWith(
        token: token); // data class operation same as kotlin
    _validate();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  // output
  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  _isAllInputValid() {
    return isEmailValid(forgotPasswordObject.userName);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

}
abstract class ForgotPasswordViewModelInput {
  forgotPassword();
  setEmail(String email);
  setToken(String token);
  Sink get inputEmail;

  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsAllInputValid;
}