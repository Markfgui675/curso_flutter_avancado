import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:curso_flutter_avancado/data/request/request.dart';
import 'package:curso_flutter_avancado/domain/repository/repository.dart';

import 'package:dartz/dartz.dart';

import 'base_usecase.dart';
import 'package:curso_flutter_avancado/domain/model/model.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication>{

  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async {
    await _repository.login(LoginRequest(input.email!, input.password!, "imei", "deviceType"));
  }

}

class LoginUseCaseInput{

  String? email;
  String? password;
  LoginUseCaseInput(this.email,this.password);

}
