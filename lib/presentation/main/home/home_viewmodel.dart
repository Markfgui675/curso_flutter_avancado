import 'dart:async';
import 'dart:ffi';
import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_render_impl.dart';
import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_renderer.dart';
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
    _getHome();
  }
  
  _getHome() async {
    inputState.add(LoadingState("", StateRendererType.FULL_SCREE_LOADING_STATE));

    (await _homeUseCase.execute(Void)).fold((failure){
      inputState.add(ErrorState(failure.message, StateRendererType.FULL_SCREEN_ERROR_STATE));
    }, (homeObject){
      inputState.add(ContentState());
      inputBanners.add(homeObject.data.banner);
      inputServices.add(homeObject.data.service);
      inputStores.add(homeObject.data.store);
    }
    );
    
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
