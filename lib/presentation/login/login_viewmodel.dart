import 'dart:async';

import 'package:curso_flutter_avancado/domain/usecase/login_usecase.dart';
import 'package:curso_flutter_avancado/presentation/base/baseviewmodel.dart';

import '../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs, LoginViewModelOutputs{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();

  var loginObject = LoginObject("","");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  //inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {

  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(
        LoginUseCaseInput(loginObject.userName, loginObject.password)
    )).fold((failure){
      // left -> failure
      print(failure.message);
    }, (data) {
      // right -> success (data)
      print(data.customer!.name);
    });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password:  password); // data class operation same as kotlin
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }


  // outputs
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  //private functions

  _isPasswordValid(String password){
    return password.isNotEmpty;
  }
  
  _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }
}

abstract class LoginViewModelInputs{
  // three functions for actions
  setUserName(String userName);
  setPassword(String password);
  login();

  // two sinks for streams
  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
}
