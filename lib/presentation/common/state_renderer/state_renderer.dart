import 'package:flutter/material.dart';

import '../../../data/mapper/mapper.dart';
import '../../../data/network/failure.dart';
import '../../resources/strings_manager.dart';

enum StateRendererType{
  // PopUp states
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  //Full Screen States
  FULL_SCREE_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE, // THE UI OF THE SCREEN
  EMPTY_SCREEN_STATE, // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

class StateRenderer extends StatelessWidget {

  StateRendererType stateRendererType;
  Failure failure;
  String message;
  String title;
  Function retryActionFunction;

  StateRenderer({Key? key,
    required this.stateRendererType,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction
  }):
    message = message ?? AppStrings.loading,
    title = title ?? EMPTY,
    failure = failure ?? DefaultFailure(),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _getStateWidget(){

    switch(stateRendererType){
      case StateRendererType.POPUP_LOADING_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.POPUP_ERROR_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.FULL_SCREE_LOADING_STATE:
        _getItemsInColumn(children);
        break;
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.CONTENT_SCREEN_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.EMPTY_SCREEN_STATE:
        // TODO: Handle this case.
        break;
      default:
        Container();
    }

  }

  Widget _getItemsInColumn(List<Widget> children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

