import 'dart:async';

import 'package:flu_proj/domain/usecase/loginUseCase.dart';
import 'package:flu_proj/presentation/base/base_view_model.dart';

import '../../common/freezedDataClass.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // LoginViewModel(this._loginUseCase);
  LoginViewModel();

  final StreamController _userNameStreamController =
      StreamController<String>.broadcast(); //has many listeners
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");

  // final LoginUseCase _loginUseCase;

  //login

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {
    // (await _loginUseCase.execute(
    //         LoginUseCaseInput(loginObject.userName, loginObject.password)))
    //     .fold((failure) => {print(failure.message)},
    //         (data) => {print(data.customer?.name)});
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
    return password.isNotEmpty;
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
}

abstract class LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputValidation;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputAreAllDataValid;
}
