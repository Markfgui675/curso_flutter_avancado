import 'dart:async';
import 'package:curso_flutter_avancado/presentation/common/freezed_data_classes.dart';
import 'dart:io';
import '../../domain/usecase/register_usecase.dart';
import '../base/baseviewmodel.dart';
import '../common/state_renderer/state_render_impl.dart';
import '../common/state_renderer/state_renderer.dart';

class RegisterViewModel extends BaseViewModel with RegisterViewModelInput,
RegisterViewModelOutput{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _mobileNumberStreamController = StreamController<String>.broadcast();
  StreamController _emailStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  StreamController _profilePictureStreamController = StreamController<File>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<String>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController = StreamController<bool>();

  RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);

  var registerViewObject = RegisterObject("", "", "", "", "", "");

  int _errorTimes = 0;

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  register() async {
    inputState.add(LoadingState(null,StateRendererType.POPUP_LOADING_STATE));
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        registerViewObject.email,
        registerViewObject.password,
        registerViewObject.mobileNumber,
        registerViewObject.userName,
        registerViewObject.profilePicture,
        registerViewObject.countryMobileCode
      )
    )).fold((failure){
    // left -> failure
    _errorTimes++;

    if(_errorTimes > 1){
      // navigate to main screen after the login --forced
      isUserLoggedInSuccessfullyStreamController.add(true);
    } else {
      inputState.add(ErrorState(failure.message, StateRendererType.POPUP_ERROR_STATE));
    }

    print(failure.message);
    }, (data) {
    // right -> success (data)
      inputState.add(ContentState());
      print(data.customer!.name);

      //navigate to mais screen after the login
      //isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _isAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
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
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;




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
  Stream<String?> get outputErrorUserName =>
      outputIsUserNameValid.map((isUserNameValid) => isUserNameValid ? null:"Invalid username");



  @override
  Stream<bool> get outputIsEmailValid => _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsMobileNumberValid => _mobileNumberStreamController.stream.map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<File> get outputProfilePicture => _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid => _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  bool _validateAllInputs(){
   return registerViewObject.profilePicture.isNotEmpty &&
    registerViewObject.email.isNotEmpty &&
    registerViewObject.userName.isNotEmpty &&
    registerViewObject.password.isNotEmpty &&
    registerViewObject.mobileNumber.isNotEmpty &&
    registerViewObject.countryMobileCode.isNotEmpty;
  }

  bool _isEmailValid(String email) => email.contains("@")&&email.contains(".com");

  bool _isMobileNumberValid(String mobileNumber) => mobileNumber.length >= 10;

  bool _isPasswordValid(String password) => password.length >= 8;

  bool _isUserNameValid(String userName) => userName.length >= 8;

  _validate(){
    _isAllInputsValidStreamController.add(null);
  }

  @override
  setCountryCode(String countryCode) {
    if(countryCode.isNotEmpty){
      // update register view object with username value
      registerViewObject = registerViewObject.copyWith(countryMobileCode: countryCode);
    } else {
      // reset username value in register view object
      registerViewObject = registerViewObject.copyWith(userName: "");
    }
    _validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if(_isEmailValid(email)){
      // update email view object with username value
      registerViewObject = registerViewObject.copyWith(email: email);
    } else {
      // reset email value in register view object
      registerViewObject = registerViewObject.copyWith(email: "");
    }
    _validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if(_isMobileNumberValid(mobileNumber)){
      // update userName view object with username value
      registerViewObject = registerViewObject.copyWith(mobileNumber: mobileNumber);
    } else {
      // reset username value in register view object
      registerViewObject = registerViewObject.copyWith(mobileNumber: "");
    }
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if(_isPasswordValid(password)){
      // update password view object with username value
      registerViewObject = registerViewObject.copyWith(password: password);
    } else {
      // reset password value in register view object
      registerViewObject = registerViewObject.copyWith(password: "");
    }
    _validate();
  }

  @override
  setProfilePicture(File profilePicture) {
    inputProfilePicture.add(profilePicture);
    if(profilePicture.path.isNotEmpty){
      // update register view object with username value
      registerViewObject = registerViewObject.copyWith(profilePicture: profilePicture.path);
    } else {
      // reset username value in register view object
      registerViewObject = registerViewObject.copyWith(profilePicture: "");
    }
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if(_isUserNameValid(userName)){
      // update register view object with username value
      registerViewObject = registerViewObject.copyWith(userName: userName);
    } else {
      // reset username value in register view object
      registerViewObject = registerViewObject.copyWith(userName: "");
    }
    _validate();
  }

}

abstract class RegisterViewModelInput{
  setUserName(String userName);
  setMobileNumber(String mobileNumber);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(File profilePicture);
  setCountryCode(String countryCode);
  register();

  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
  Sink get inputAllInputsValid;
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

  Stream<File> get outputProfilePicture;

  Stream<bool> get outputIsAllInputsValid;

}
