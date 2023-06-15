import 'dart:async';

import 'package:curso_flutter_avancado/domain/usecase/forgot_password_usecase.dart';
import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_render_impl.dart';
import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_renderer.dart';

import '../base/baseviewmodel.dart';

class ForgotPasswordViewModel extends BaseViewModel with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput{

  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  var email = "";

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() async {
    inputState.add(
      LoadingState(null, StateRendererType.POPUP_LOADING_STATE)
    );
    (await _forgotPasswordUseCase.execute(email)).
    fold((failure){
      inputState.add(
        ErrorState(failure.message, StateRendererType.POPUP_ERROR_STATE)
      );
    }, (authObject){
      inputState.add(ContentState());
    });
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputsValidStreamController.close();
  }

  @override
  Stream<bool> get outputIsAllInputValid => _emailStreamController.stream.map((email) => _isAllInputValid(email));

  @override
  Stream<bool> get outputIsEmailValid => _isAllInputsValidStreamController.stream.map((email) => _isAllInputValid(email));

  _validate(){
    inputIsAllInputValid.add(null);
  }

  bool _isAllInputValid(String email){
    return email.contains("@") && email.contains(".com");
  }

}

abstract class ForgotPasswordViewModelInput{
  forgotPassword();

  setEmail(String email);

  Sink get inputEmail;
  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput{
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsAllInputValid;
}