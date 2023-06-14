import 'package:curso_flutter_avancado/data/request/request.dart';
import 'package:curso_flutter_avancado/data/responses/responses.dart';

import '../network/app_api.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
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

}
