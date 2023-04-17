import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/di.dart';
import '../../../domain/models/models.dart';
import '../../common/state_renderer/state_renderer_imp.dart';
import '../../resourses/color_manager.dart';
import '../../resourses/strings_manager.dart';
import '../../resourses/values_manager.dart';
import '../viewModel/store_details_viewModel.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({Key? key}) : super(key: key);

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  final StoreDetailsViewModel _viewModel = instance<StoreDetailsViewModel>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        return Container(
          child:
              snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.start();
                  }) ??
                  Container(),
        );
      },
    ));
  }

  Widget _getContentWidget() {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: const Text(AppStrings.storeDetails).tr(),
          elevation: AppSize.s0,
          iconTheme: IconThemeData(
            //back button
            color: ColorManager.white,
          ),
          backgroundColor: ColorManager.primary,
          centerTitle: true,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: ColorManager.white,
          child: SingleChildScrollView(
            child: StreamBuilder<StoreDetails>(
              stream: _viewModel.outputStoreDetails,
              builder: (context, snapshot) {
                return _getItems(snapshot.data);
              },
            ),
          ),
        ));
  }

  Widget _getItems(StoreDetails? storeDetails) {
    if (storeDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.network(
            storeDetails.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          )),
          _getSection(AppStrings.details),
          _getInfoText(storeDetails.details),
          _getSection(AppStrings.services),
          _getInfoText(storeDetails.services),
          _getSection(AppStrings.about),
          _getInfoText(storeDetails.about)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p14 / 7),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium).tr());
  }

  Widget _getInfoText(String info) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Text(info, style: Theme.of(context).textTheme.bodySmall).tr(),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
