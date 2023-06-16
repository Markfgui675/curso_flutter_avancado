import 'dart:async';
import 'dart:html';
import '../../domain/usecase/register_usecase.dart';
import '../base/baseviewmodel.dart';

class RegisterViewModel extends BaseViewModel{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _mobileNumberStreamController = StreamController<String>.broadcast();
  StreamController _emailStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  StreamController _profilePictureStreamController = StreamController<String>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<String>.broadcast();

  RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);

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
  Stream<String> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;
  Stream<String> get outputErrorMobileNumber;

  Stream<bool> get outputIsEmailValid;
  Stream<String> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;
  Stream<String> get outputErrorPassword;

  Stream<File> get outputIsProfilePictureValid;
  Stream<String> get outputErrorProfilePicture;

}