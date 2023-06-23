import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:curso_flutter_avancado/presentation/base/baseviewmodel.dart';
import '../../../domain/model/model.dart';
import '../../../domain/usecase/home_usecase.dart';

class HomeViewModel extends BaseViewModel{

  StreamController _bannerStreamController = BehaviorSubject<List<Banner>>();
  StreamController _servicesStreamController = BehaviorSubject<List<Service>>();
  StreamController _storeStreamController = BehaviorSubject<List<Store>>();

  HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _bannerStreamController.close();
    _servicesStreamController.close();
    _storeStreamController.close();
    super.dispose();
  }

}