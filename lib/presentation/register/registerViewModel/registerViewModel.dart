import 'dart:async';
import 'dart:io';
import 'package:flu_proj/domain/usecase/registerUseCase.dart';
import 'package:flu_proj/presentation/base/base_view_model.dart';
import 'package:flu_proj/presentation/common/freezedDataClass.dart';
import 'package:flu_proj/presentation/resourses/strings_manager.dart';

import '../../../app/functions.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_imp.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController profilePictureStreamController =
      StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase);

  var registerObject = RegisterObject("", "", "", "", "", "");

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  register() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));

    (await _registerUseCase.execute(RegisterUseCaseInput(
            registerObject.userName,
            registerObject.mobileNumber,
            registerObject.countryMobileCode,
            registerObject.password,
            registerObject.profilePicture,
            registerObject.email)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      inputState.add(ContentState());
      //  isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  @override
  void dispose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsValidStreamController.close();
    super.dispose();
  }

  /////****inputs******

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => profilePictureStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  setUserName(String userName) {
    _isUserNameValid(userName)
        ? registerObject = registerObject.copyWith(userName: userName)
        : registerObject = registerObject.copyWith(userName: "");
    validate();
  }

  @override
  setCountryCode(String countryCode) {
    countryCode.isNotEmpty
        ? registerObject =
            registerObject.copyWith(countryMobileCode: countryCode)
        : registerObject = registerObject.copyWith(countryMobileCode: "");
    validate();
  }

  @override
  setEmail(String email) {
    isEmailValid(email)
        ? registerObject = registerObject.copyWith(email: email)
        : registerObject = registerObject.copyWith(email: "");
    validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    _isMobileNumberValid(mobileNumber)
        ? registerObject = registerObject.copyWith(mobileNumber: mobileNumber)
        : registerObject = registerObject.copyWith(mobileNumber: "");
    validate();
  }

  @override
  setPassword(String password) {
    _isPasswordValid(password)
        ? registerObject = registerObject.copyWith(password: password)
        : registerObject = registerObject.copyWith(password: "");
    validate();
  }

  @override
  setProfilePicture(File profilePicture) {
    profilePicture.path.isNotEmpty
        ? registerObject =
            registerObject.copyWith(profilePicture: profilePicture.path)
        : registerObject = registerObject.copyWith(profilePicture: "");
    validate();
  }

  //*****************outputs*******************

  @override
  Stream<bool> get outputIsUserNameValid => userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<String?> get outputErrorUserName =>
      outputIsUserNameValid.map((isUserNameValid) =>
          isUserNameValid ? null : AppStrings.userNameValidation);

  @override
  Stream<bool> get outputIsEmailValid =>
      emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.emailValidation);

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber =>
      outputIsMobileNumberValid.map((isMobileNumberValid) =>
          isMobileNumberValid ? null : AppStrings.mobileNumberValidation);

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword =>
      outputIsPasswordValid.map((isPasswordValid) =>
          isPasswordValid ? null : AppStrings.passwordValidationValidation);

  @override
  Stream<File> get outputIsProfilePictureValid =>
      profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  ////*****private fun*******

  bool _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length == 11;
  }

  bool _isPasswordValid(String password) {
    return password.length <= 6;
  }

  bool _areAllInputsValid() {
    return registerObject.userName.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
        registerObject.countryMobileCode.isNotEmpty &&
        registerObject.countryMobileCode.isNotEmpty;
  }

  validate() {
    inputAreAllInputsValid.add(null);
    //بنده علي الاستريم و بمشي قيمة فيه
  }
}

abstract class RegisterViewModelInputs {
  Sink get inputUserName;

  Sink get inputMobileNumber;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputProfilePicture;

  Sink get inputAreAllInputsValid;

  register();

  setUserName(String userName);

  setMobileNumber(String mobileNumber);

  setCountryCode(String countryCode);

  setPassword(String password);

  setEmail(String email);

  setProfilePicture(File profilePicture);
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;

  Stream<String?> get outputErrorMobileNumber;

  Stream<bool> get outputIsEmailValid;

  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;

  Stream<String?> get outputErrorPassword;

  Stream<File> get outputIsProfilePictureValid;

  Stream<bool> get outputAreAllInputsValid;
}
