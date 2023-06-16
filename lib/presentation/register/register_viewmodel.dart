import 'dart:async';
import 'dart:html';
import 'package:curso_flutter_avancado/presentation/common/freezed_data_classes.dart';

import '../../domain/usecase/register_usecase.dart';
import '../base/baseviewmodel.dart';

class RegisterViewModel extends BaseViewModel with RegisterViewModelInput,
RegisterViewModelOutput{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _mobileNumberStreamController = StreamController<String>.broadcast();
  StreamController _emailStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  StreamController _profilePictureStreamController = StreamController<String>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<String>.broadcast();

  RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);

  var registerViewObject = RegisterObject("", "", "", "", "", "");

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _isAllInputsValidStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;




  @override
  Stream<String?> get outputErrorEmail =>
      outputIsEmailValid.map((isEmailValid) => isEmailValid ? null:"Email invalid");

  @override
  Stream<String?> get outputErrorMobileNumber =>
      outputIsMobileNumberValid.map((isMobileNumberValid) => isMobileNumberValid ? null:"Mobile number invalid");

  @override
  Stream<String?> get outputErrorPassword =>
      outputIsPasswordValid.map((isPasswordValid) => isPasswordValid ? null:"Password invalid");

  @override
  Stream<String?> get outputErrorProfilePicture =>
      outputIsProfilePictureValid.map((isProfilePictureValid) => isProfilePictureValid ? null:"Profile Picture invalid");

  @override
  Stream<String?> get outputErrorUserName =>
      outputIsUserNameValid.map((isUserNameValid) => isUserNameValid ? null:"Invalid username");



  @override
  Stream<bool> get outputIsEmailValid => _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsMobileNumberValid => _mobileNumberStreamController.stream.map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<File> get outputIsProfilePictureValid => _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  bool _isEmailValid(String email) => email.contains("@")&&email.contains(".com");

  bool _isMobileNumberValid(String mobileNumber) => mobileNumber.isNotEmpty;

  bool _isPasswordValid(String password) => password.isNotEmpty;

  bool _isUserNameValid(String userName) => userName.length >= 8;

}

abstract class RegisterViewModelInput{
  register();

  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
}
abstract class RegisterViewModelOutput{
  Stream<bool> get outputIsUserNameValid;
  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;
  Stream<String?> get outputErrorMobileNumber;

  Stream<bool> get outputIsEmailValid;
  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;
  Stream<String?> get outputErrorPassword;

  Stream<File> get outputIsProfilePictureValid;
  Stream<String?> get outputErrorProfilePicture;

}