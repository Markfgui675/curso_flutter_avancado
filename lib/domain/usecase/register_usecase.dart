import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:curso_flutter_avancado/data/request/request.dart';
import 'package:curso_flutter_avancado/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import '../model/model.dart';
import 'base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, Authentication>{

  Repository _repository;
  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(input) async {
    return await _repository.register(RegisterRequest(
        input.email,
        input.password,
        input.mobileNumber,
        input.userName,
        input.profilePicture,
        input.countryMobileCode)
    );

  }

}

class RegisterUseCaseInput{
  String email;
  String password;
  String mobileNumber;
  String userName;
  String profilePicture;
  String countryMobileCode;

  RegisterUseCaseInput(this.email, this.password, this.mobileNumber,this.userName, this.profilePicture, this.countryMobileCode);
}
