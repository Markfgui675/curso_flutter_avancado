import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../common/state_renderer/state_render_impl.dart';

abstract class BaseViewModel extends BaseViewModelInput with BaseViewModelOutput{

  // shared variables and functions that will be used through any view model.
  //StreamController _inputStateStreamController = StreamController<FlowState>.broadcast();
  StreamController _inputStateStreamController = BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }

}

abstract class BaseViewModelInput{
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.

  Sink get inputState;
}

abstract class BaseViewModelOutput{
  Stream<FlowState> get outputState;
}
