import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImplement implements NetworkInfo{

  DataConnectionChecker _dataConnectionChecker;

  NetworkInfoImplement(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;

}
