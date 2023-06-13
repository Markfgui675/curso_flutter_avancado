import 'dart:async';
import 'package:curso_flutter_avancado/domain/usecase/login_usecase.dart';
import 'package:curso_flutter_avancado/presentation/base/baseviewmodel.dart';
import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_render_impl.dart';
import '../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs, LoginViewModelOutputs{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();

  StreamController _isAllInputValidStreamController = StreamController<void>.broadcast();

  var loginObject = LoginObject("","");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  //inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  void start() {
    // viw tells state renderer, please show the content of the screen
    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputValidStreamController.sink;

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
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }


  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid => _isAllInputValidStreamController.stream.map((_) => _isAllInputsValid());

  //private functions

  _validate(){
    inputIsAllInputsValid.add(null);
  }

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }
  
  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid(){
    return _isPasswordValid(loginObject.password) && _isUserNameValid(loginObject.userName);
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
  Sink get inputIsAllInputsValid;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
