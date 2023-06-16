import 'dart:async';

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