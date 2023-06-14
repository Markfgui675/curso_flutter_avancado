import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:curso_flutter_avancado/domain/repository/repository.dart';
import 'package:curso_flutter_avancado/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String>{
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }

}