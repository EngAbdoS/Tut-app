import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flu_proj/app/di.dart';
import 'package:flu_proj/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:flu_proj/presentation/register/registerViewModel/registerViewModel.dart';
import 'package:flu_proj/presentation/resourses/color_manager.dart';
import 'package:flu_proj/presentation/resourses/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/app_prefs.dart';
import '../../../app/constants.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/router_manager.dart';
import '../../resourses/strings_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final ImagePicker _imagePicker = instance<ImagePicker>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _mobileNumberEditingController =
      TextEditingController();

  _bind() {
    _viewModel.start();
    _userNameEditingController.addListener(() {
      _viewModel.setUserName(_userNameEditingController.text);
    });
    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });
    _emailEditingController.addListener(() {
      _viewModel.setEmail(_emailEditingController.text);
    });
    _mobileNumberEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberEditingController.text);
    });

    _viewModel.isUserRegisteredSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {

        //TODO study ...
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        iconTheme: IconThemeData(color: ColorManager.primary),
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.register();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p28),
      //color: ColorManager.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                child: Image(
                  image: AssetImage(ImageAssets.splashLogo),
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outputErrorUserName,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _userNameEditingController,
                      decoration: InputDecoration(
                          hintText: AppStrings.username,
                          labelText: AppStrings.username,
                          errorText: snapshot.data),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CountryCodePicker(
                          onInit: (country){ _viewModel
                              .setCountryCode(country!.dialCode??Constants.token);},
                          onChanged: (country) => _viewModel
                              .setCountryCode(country.dialCode ?? Constants.token),
                          initialSelection: '+20',
                          favorite: const ['+20','+39', 'FR', '+966'],
                          showOnlyCountryWhenClosed: true,
                          showCountryOnly: true,
                          hideMainText: true,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: StreamBuilder<String?>(
                          stream: _viewModel.outputErrorMobileNumber,
                          builder: (context, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _mobileNumberEditingController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.mobileNumber,
                                  labelText: AppStrings.mobileNumber,
                                  errorText: snapshot.data),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailEditingController,
                      decoration: InputDecoration(
                          hintText: AppStrings.emailHint,
                          labelText: AppStrings.emailHint,
                          errorText: snapshot.data),
                    );
                  },
                  stream: _viewModel.outputErrorEmail,
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordEditingController,
                      decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: snapshot.data),
                    );
                  },
                  stream: _viewModel.outputErrorPassword,
                ),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: GestureDetector(onTap: () {
                  _showPicker(context);
                },
                  child: SizedBox(
                    height: AppSize.s40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
                          border: Border.all(color: ColorManager.gray)),
                      child: _getMediaWidget(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () => _viewModel.register()
                            : null,
                        child: const Text(AppStrings.registerButton),
                      ),
                    );
                  },
                  stream: _viewModel.outputAreAllInputsValid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                    top: AppPadding.p8),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppStrings.alreadyHaveAcCount,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.photo),
                title: const Text(AppStrings.photoGallery),
                onTap: () {
                  _imageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(AppStrings.photoCamera),
                onTap: () {
                  _imageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        });
  }

  _imageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  _imageFromCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    _viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  Widget _getMediaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            child: Text(AppStrings.profilePicture),
          ),
          Flexible(
            child: StreamBuilder<File>(
              stream: _viewModel.outputIsProfilePictureValid,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p8*0.2,bottom:  AppPadding.p8*0.2),
                  child: _pickedImage(snapshot.data),
                );
              },
            ),
          ),
          Flexible(
            child: SvgPicture.asset(ImageAssets.camera),
          ),
        ],
      ),
    );
  }

  Widget _pickedImage(File? image) {
    if (image != null && image.path.isNotEmpty) {
      return Image.file(image);
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
