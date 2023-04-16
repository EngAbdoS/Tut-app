import 'dart:async';
import 'package:flu_proj/domain/usecase/loginUseCase.dart';
import 'package:flu_proj/presentation/base/base_view_model.dart';
import 'package:flu_proj/presentation/common/state_renderer/state_renderer.dart';
import 'package:flu_proj/presentation/common/state_renderer/state_renderer_imp.dart';

import '../../common/freezedDataClass.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  LoginViewModel(this._loginUseCase);

  final StreamController _userNameStreamController =
      StreamController<String>.broadcast(); //has many listeners
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();
  final StreamController _isPasswordHiddenStreamController =
  StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;

  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();
bool? _isHidden;

  //login

  @override
  void dispose() {
    super.dispose();
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areAllInputsValidStreamController.close();
    _isPasswordHiddenStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      inputState.add(ContentState());
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

///////output

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputValidation.add(null); //
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputValidation.add(null); //
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  @override
  Sink get inputValidation => _areAllInputsValidStreamController.sink;

  @override
  Stream<bool> get outputAreAllDataValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _areAllInputsValid() {
    return _isUserNameValid(loginObject.userName) &&
        _isPasswordValid(loginObject.password);
  }

  @override
  Sink get inputPasswordHideState => _isPasswordHiddenStreamController.sink;

  @override
  Stream<bool> get outputIsPasswordHidden => _isPasswordHiddenStreamController.stream.map((hidden) => hidden);
  @override
  changePasswordState(){
    if(_isHidden==true){
      _isHidden=false;
      _isPasswordHiddenStreamController.add(false);
    }
    else
      {
        _isHidden=true;
        _isPasswordHiddenStreamController.add(true);
      }

  }



}

abstract class LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);
  changePasswordState();
  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputPasswordHideState;

  Sink get inputValidation;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsPasswordHidden;

  Stream<bool> get outputAreAllDataValid;
}
