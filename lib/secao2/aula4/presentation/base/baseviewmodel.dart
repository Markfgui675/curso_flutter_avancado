abstract class BaseViewModel extends BaseViewModelInput with BaseViewModelOutput{

  // shared variables and functions that will be used through any view model.

}

abstract class BaseViewModelInput{
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.
}

abstract class BaseViewModelOutput{

}
