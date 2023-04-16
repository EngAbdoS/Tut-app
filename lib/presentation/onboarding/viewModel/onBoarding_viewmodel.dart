import 'dart:async';

import 'package:flu_proj/domain/models/models.dart';
import 'package:flu_proj/presentation/base/base_view_model.dart';

import '../../resourses/assets_manager.dart';
import '../../resourses/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers outputs

  final StreamController _streamController = StreamController<SliderViewOblect>();
  late final List<SliderObject> _list;

  int _currentPageIndex = 0;

  //onBoarding ViewModel inputs

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }
  @override
  void dispose() {
    _streamController.close();
  }

// inputs
  @override
  int goNext() {
    return _currentPageIndex ==( _list.length - 1) ? 0 : ++_currentPageIndex;
  }

  @override
  int goPrevious() {
    return _currentPageIndex == 0 ?( _list.length - 1) : --_currentPageIndex;  }

  @override
  void onPageChanged(int index) {
_currentPageIndex=index;
_postDataToView();

  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewOblect> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //onboarding private function

  void _postDataToView() {
    inputSliderViewObject.add(SliderViewOblect(
        _list[_currentPageIndex], _currentPageIndex, _list.length));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
      ];
}

// inputs => orders that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  //stream controller input

  Sink get inputSliderViewObject; //getter ,must be override
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewOblect> get outputSliderViewObject;
}
