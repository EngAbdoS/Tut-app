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
  final StreamController _bannersStreamController =
      BehaviorSubject<List<Banners>>();
  final StreamController _servicesStreamController =
      BehaviorSubject<List<Service>>();
  final StreamController _storesStreamController =
      BehaviorSubject<List<Stores>>();
  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHomeData();
  }



  @override
  void dispose() {
    _bannersStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }

  //////*****inputs****************
  @override
  Sink get inputBanners => _bannersStreamController.sink;

  @override
  Sink get inputServices => _servicesStreamController.sink;

  @override
  Sink get inputStores => _storesStreamController.sink;

  ///////********outputs***********

  @override
  Stream<List<Banners>> get outputBanners =>
      _bannersStreamController.stream.map((banners) => banners);

  @override
  Stream<List<Service>> get outputServices =>
      _servicesStreamController.stream.map((services) => services);

  @override
  Stream<List<Stores>> get outputStores =>
      _storesStreamController.stream.map((stores) => stores);

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
      inputBanners.add(homeObject.data?.banners);
      inputServices.add(homeObject.data?.services);
      inputStores.add(homeObject.data?.stores);
    });
  }
}

abstract class HomeViewModelInputs {
  Sink get inputStores;

  Sink get inputBanners;

  Sink get inputServices;
}

abstract class HomeViewModelOutputs {
  Stream<List<Stores>> get outputStores;

  Stream<List<Service>> get outputServices;

  Stream<List<Banners>> get outputBanners;
}
