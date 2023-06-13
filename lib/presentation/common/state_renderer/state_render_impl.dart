import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_renderer.dart';

import '../../resources/strings_manager.dart';

abstract class FlowState{
  StateRendererType stateRendererType();
  String getMessage();
}

// loading state (POPUP, FULL SCREEN)

class LoadingState extends FlowState{

  StateRendererType stateType;
  String message;
  LoadingState(String? message, this.stateType):message = message ?? AppStrings.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType stateRendererType() => stateType;

}
