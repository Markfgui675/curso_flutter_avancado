import 'package:curso_flutter_avancado/data/request/request.dart';
import 'package:curso_flutter_avancado/data/responses/responses.dart';

import '../network/app_api.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<HomeResponse> getHome();
}

class RemoteDataSourceImplementer implements RemoteDataSource{ // experimentar colocar extends no lugar de implements para testes
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email,
        loginRequest.password,
        "",
        ""
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.email,
        registerRequest.password,
        registerRequest.mobileNumber,
        registerRequest.profilePicture,
        registerRequest.userName,
        registerRequest.countryMobileCode
    );
  }

  @override
  Future<HomeResponse> getHome() async {
    return await _appServiceClient.getHome();
  }

}
