import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:curso_flutter_avancado/presentation/base/baseviewmodel.dart';
import '../../../domain/model/model.dart';
import '../../../domain/usecase/home_usecase.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput, HomeViewModelOutput{

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
  }

  @override
  Sink get inputBanners => _bannerStreamController.sink;

  @override
  Sink get inputServices => _servicesStreamController.sink;

  @override
  Sink get inputStores => _storeStreamController.sink;

  @override
  Stream<List<Banner>> get outputBanners => _bannerStreamController.stream.map((banners) => banners);

  @override
  Stream<List<Service>> get outputServices => _servicesStreamController.stream.map((services) => services);

  @override
  Stream<List<Store>> get outputStores => _storeStreamController.stream.map((stores) => stores);

}

abstract class HomeViewModelInput{
  Sink get inputStores;
  Sink get inputServices;
  Sink get inputBanners;
}

abstract class HomeViewModelOutput{
  Stream<List<Store>> get outputStores;
  Stream<List<Service>> get outputServices;
  Stream<List<Banner>> get outputBanners;
}
