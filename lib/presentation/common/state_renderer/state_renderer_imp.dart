import 'package:easy_localization/easy_localization.dart';
import 'package:flu_proj/app/constants.dart';
import 'package:flu_proj/presentation/common/state_renderer/state_renderer.dart';
import 'package:flu_proj/presentation/resourses/strings_manager.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState(
      {required this.stateRendererType, String message = AppStrings.loading});

  @override
  String getMessage() => message??AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

class SuccessState extends FlowState{
  String message;
SuccessState(this.message);
  @override
  String getMessage() =>message;

  @override
  StateRendererType getStateRendererType() =>StateRendererType.popupSuccessState;

}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtention on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            showPopUp(context, getStateRendererType(), getMessage());

            return contentScreenWidget;
          } else {
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ErrorState:
        {
          dismissDialog(context);

          if (getStateRendererType() == StateRendererType.popupErrorState) {
            showPopUp(context, getStateRendererType(), getMessage());

            return contentScreenWidget;
          } else {
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case ContentState:
        {
          dismissDialog(context);

          return contentScreenWidget;
        }

      case SuccessState:
        {
          dismissDialog(context);
          showPopUp(context, StateRendererType.popupSuccessState, getMessage(),title:AppStrings.success);
          return contentScreenWidget;
        }

      case EmptyState:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  showPopUp(BuildContext context, StateRendererType stateRendererType,
      String message,{String title =Constants.empty}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
          stateRendererType: stateRendererType,
          message: message.tr(),
          title: title.tr(),
          retryActionFunction: () {},
        ),
      ),
    );
  }

  bool _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true); //TODO learn ?????
    }
  }
}
