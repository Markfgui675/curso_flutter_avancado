import 'package:curso_flutter_avancado/data/mapper/mapper.dart';
import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:curso_flutter_avancado/data/request/request.dart';
import 'package:curso_flutter_avancado/domain/model.dart';
import 'package:curso_flutter_avancado/domain/repository.dart';
import 'package:dartz/dartz.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository{

  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest)async {
    if(await _networkInfo.isConnected){
      // its safe to call the api
      final response = await _remoteDataSource.login(loginRequest);
      if(response.status == 0){ // success
        // return data
        return Right(response.toDomain());
      } else {
        //return biz logic error
        return Left(Failure(409, response.message?? "we have biz error logic form API side"));
      }
    } else{
      // return connection error
      return Left(Failure(501,"Please check your internet connection"));
    }
  }
  
}