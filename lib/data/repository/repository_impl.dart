import 'package:curso_flutter_avancado/data/mapper/mapper.dart';
import 'package:curso_flutter_avancado/data/network/failure.dart';
import 'package:curso_flutter_avancado/data/request/request.dart';
import 'package:curso_flutter_avancado/domain/model/model.dart';
import 'package:curso_flutter_avancado/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';
import 'error_handler.dart';

class RepositoryImpl extends Repository{

  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest)async {
    if(await _networkInfo.isConnected){

      try{
        // its safe to call the api
        final response = await _remoteDataSource.login(loginRequest);
        if(response.status == ApiInternalStatus.SUCCESS){ // success
          // return data
          return Right(response.toDomain());
        } else {
          //return biz logic error
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE, response.message?? ResponseMessage.UNKOWN)
          );
        }
      }catch(error){
        return Left(ErrorHandler.handler(error).failure);
      }
    } else{
      // return connection error
      return Left(DataSource.NI_INTERNNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if(await _networkInfo.isConnected){
      try{
        // its safe to call the api
        final response = await _remoteDataSource.forgotPassword(email);
        if(response.status == ApiInternalStatus.SUCCESS){ // success
          // return data
          return Right(response.toDomain());
        } else {
          //return biz logic error
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE, response.message?? ResponseMessage.UNKOWN)
          );
        }
      }catch(error){
        return Left(ErrorHandler.handler(error).failure);
      }
    } else{
      // return connection error
      return Left(DataSource.NI_INTERNNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) async {
    if(await _networkInfo.isConnected){
      try{
        // its safe to call the api
        final response = await _remoteDataSource.register(registerRequest);
        if(response.status == ApiInternalStatus.SUCCESS){ // success
          // return data
          return Right(response.toDomain());
        } else {
          //return biz logic error
          return Left(
              Failure(response.status ?? ApiInternalStatus.FAILURE, response.message?? ResponseMessage.UNKOWN)
          );
        }
      }catch(error){
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NI_INTERNNET_CONNECTION.getFailure());
    }
  }
  
}