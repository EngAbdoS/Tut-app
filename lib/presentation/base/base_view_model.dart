import 'dart:async';

import 'package:flu_proj/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //shard variables and functions that will be used through any view model

  final StreamController _inputStreamController =
      BehaviorSubject<FlowState>();//مسؤل عن الحالة في الاب كله

  @override
  Sink get inputState => _inputStreamController.sink;
  @override
  Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); //start view model job

  void dispose(); //will be called when view model dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
