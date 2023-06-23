import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:curso_flutter_avancado/data/repository/repository_impl.dart';
import 'package:curso_flutter_avancado/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../model/model.dart';
import '../repository/repository.dart';

class HomeUseCase extends BaseUseCase<void, HomeObject>{

  Repository _repository;
  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) {
    return _repository.getHome();
  }

}