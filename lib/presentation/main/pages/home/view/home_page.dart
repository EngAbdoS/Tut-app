import 'package:carousel_slider/carousel_slider.dart';
import 'package:flu_proj/app/di.dart';
import 'package:flu_proj/domain/models/models.dart';
import 'package:flu_proj/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:flu_proj/presentation/main/pages/home/viewModel/home_view_model.dart';
import 'package:flu_proj/presentation/resourses/color_manager.dart';
import 'package:flu_proj/presentation/resourses/router_manager.dart';
import 'package:flu_proj/presentation/resourses/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/strings_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.start();
                  }) ??
                  _getContentWidget();
            }),
      ),
    );
  }

  Widget _getContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBannersCarousel(),
        _getSection(AppStrings.services),
        _getServices(),
        _getSection(AppStrings.stores),
        _getStores(),
      ],
    );
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p8 / 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  Widget _getBannersCarousel() {
    return StreamBuilder<List<Banners>>(
      stream: _viewModel.outputBanners,
      builder: (context, snapshot) {
        return _getBannerWidget(snapshot.data);
      },
    );
  }

  Widget _getBannerWidget(List<Banners>? banners) {
    if (banners != null) {
      return CarouselSlider(
        items: banners
            .map(
              (banner) => SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: AppSize.s1_5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: ColorManager.primary, width: AppSize.s1_5),
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    child: Image.network(
                      banner.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: AppSize.s100*1.9,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getServices() {
    return StreamBuilder<List<Service>>(
      stream: _viewModel.outputServices,
      builder: (context, snapshot) {
        return _getServicesWidget(snapshot.data);
      },
    );
  }

  Widget _getServicesWidget(List<Service>? services) {
    if (services != null) {
      return Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s80*2,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: services
                .map(
                  (service) => Card(
                    elevation: AppSize.s4,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: ColorManager.white, width: AppSize.s1_5),
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          child: Image.network(
                            service.image,
                            fit: BoxFit.cover,
                            width: AppSize.s100*1.2,
                            height: AppSize.s100*1.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: AppPadding.p8),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              service.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getStores() {
    return StreamBuilder<List<Stores>>(
      stream: _viewModel.outputStores,
      builder: (context, snapshot) {
        return _getStoresWidget(snapshot.data);
      },
    );
  }

  Widget _getStoresWidget(List<Stores>? stores) {
    if (stores != null) {
      return Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p12),
        child: Flex(
          direction: Axis.vertical,
          children: [
            GridView.count(
                crossAxisCount: AppSize.s2.toInt(),
                crossAxisSpacing: AppSize.s8,
                mainAxisSpacing: AppSize.s8,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(stores.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.storeDetailsRoute);
                    },
                    child: Card(
                      elevation: AppSize.s4,
                      child: Image.network(
                        stores[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }))
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
