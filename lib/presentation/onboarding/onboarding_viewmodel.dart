import 'dart:async';

import 'package:curso_flutter_avancado/presentation/base/baseviewmodel.dart';

import '../../domain/model.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';


class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput, OnBoardingViewModelOutput{
  // stream controllers
  final StreamController _streamController = StreamController<SlideViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    // send this slider data to our view
    _postDataToView();
  }

  @override
  void goNext() {
    int nextIndex = _currentIndex++; // -1
    if(nextIndex >= _list.length){
      _currentIndex = 0; //infinite loop to go to the lenght of slider list
    }
    _postDataToView();
  }

  @override
  void goPrevious() {
    int previousIndex = _currentIndex--; // -1
    if(previousIndex== -1){
      _currentIndex = _list.length - 1; //infinite loop to go to the lenght of slider list
    }
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);

  // private function
  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
  ];

  _postDataToView(){
    inputSliderViewObject.add(SlideViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

}


// inputs mean the orders that our view model will recieve from our view
abstract class OnBoardingViewModelInput{

  void goNext(); // when user clicks on right arrow
  void goPrevious(); // when user clicks on left arrow
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // this is the way to add data to the stream... stream input

}

// outputs mean data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutput{

  Stream<SlideViewObject> get outputSliderViewObject;

}

class SlideViewObject{

  SliderObject? sliderObject;
  int? numOfSlides;
  int? currentIndex;

  SlideViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

