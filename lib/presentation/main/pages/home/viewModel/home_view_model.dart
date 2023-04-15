import 'dart:async';
import 'dart:ffi';
import 'package:flu_proj/domain/models/models.dart';
import 'package:flu_proj/domain/usecase/home_useCace.dart';
import 'package:flu_proj/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_imp.dart'; // TODO study....

class HomeViewModel extends BaseViewModel
    with HomeViewModelInputs, HomeViewModelOutputs {
  final StreamController _homeDataStreamController =
      BehaviorSubject<HomeObject>();

  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }

  @override
  void dispose() {
    _homeDataStreamController.close();

    super.dispose();
  }

  //////*****inputs****************

  @override
  Sink get inputHomeData => _homeDataStreamController.sink;

  ///////********outputs***********

  @override
  Stream<HomeObject> get outputHomeData =>
      _homeDataStreamController.stream.map((homeData) => homeData);

  ////******private functions***********

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _homeUseCase.execute(Void)).fold(
        (failure) => {
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      inputState.add(ContentState());
      inputHomeData.add(homeObject);
    });
  }
}

abstract class HomeViewModelInputs {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutputs {
  Stream<HomeObject> get outputHomeData;
}
