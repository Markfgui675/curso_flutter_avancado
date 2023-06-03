import 'dart:async';

import 'package:curso_flutter_avancado/secao2/aula4/presentation/base/baseviewmodel.dart';

import '../../domain/model.dart';


class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput, OnBoardingViewModelOutput{
  // stream controllers
  final StreamController _streamController = StreamController<SlideViewObject>();


  //inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject => throw UnimplementedError();

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

