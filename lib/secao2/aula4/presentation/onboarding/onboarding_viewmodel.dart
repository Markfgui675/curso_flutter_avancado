import 'package:curso_flutter_avancado/secao2/aula4/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput, OnBoardingViewModelOutput{
  // stream controllers


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

}


// inputs mean the orders that our view model will recieve from our view
abstract class OnBoardingViewModelInput{

  void goNext(); // when user clicks on right arrow
  void goPrevious(); // when user clicks on left arrow
  void onPageChanged(int index);

}

// outputs mean data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutput{

  // will be implement it later

}

