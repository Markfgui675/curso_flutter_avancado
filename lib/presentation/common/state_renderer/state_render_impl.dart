import 'package:curso_flutter_avancado/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/mapper/mapper.dart';
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

// error state (POPUP, FULL LOADING)

class ErrorState extends FlowState{

  StateRendererType stateType;
  String message;
  ErrorState(this.message, this.stateType);

  @override
  String getMessage() => message;

  @override
  StateRendererType stateRendererType() => stateType;

}

// content state
class ContentState extends FlowState{

  ContentState();

  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType stateRendererType() => StateRendererType.CONTENT_SCREEN_STATE;

}

// empty state
class EmptyState extends FlowState{

  String message;
  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType stateRendererType() => StateRendererType.EMPTY_SCREEN_STATE;

}

extension FlowStateExtension on FlowState{
  Widget getScreenWidget(BuildContext context, Widget contentScreen, Function retryActionFunction){
    switch(this.runtimeType){
      case LoadingState:
        if(stateRendererType() == StateRendererType.POPUP_LOADING_STATE){
          // showing popup dialog
          showPopUp(context, stateRendererType(), getMessage());
          //return the content ui of the screen
          return contentScreen;
        }else{
          return StateRenderer(
              stateRendererType: stateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction
          );
        }
      case ErrorState:
        if(stateRendererType() == StateRendererType.POPUP_ERROR_STATE){
          // showing popup dialog
          showPopUp(context, stateRendererType(), getMessage());
          //return the content ui of the screen
          return contentScreen;
        }else{
          return StateRenderer(
              stateRendererType: stateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction
          );
        }
      case ContentState:
        return contentScreen;
      case EmptyState:
        return StateRenderer(
            stateRendererType: stateRendererType(),
            retryActionFunction: retryActionFunction,
            message: getMessage(),
        );
      default:
        return contentScreen;

    }
  }

  showPopUp(BuildContext context, StateRendererType stateRendererType, String message){
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      showDialog(context: context, builder: (BuildContext context) =>
          StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            retryActionFunction: (){},
          )
      );
    });
    
  }

}
