import 'package:dio/dio.dart';
import 'package:flu_proj/app/app_prefs.dart';
import 'package:flu_proj/data/data_source/remote_data_source.dart';
import 'package:flu_proj/data/network/app_api.dart';
import 'package:flu_proj/data/network/dio_factory.dart';
import 'package:flu_proj/data/network/network_info.dart';
import 'package:flu_proj/data/repository/repository_imp.dart';
import 'package:flu_proj/domain/repository/repository.dart';
import 'package:flu_proj/domain/usecase/forgot_bassword_use_case.dart';
import 'package:flu_proj/domain/usecase/loginUseCase.dart';
import 'package:flu_proj/domain/usecase/registerUseCase.dart';
import 'package:flu_proj/presentation/forgot_password/viewModel/forgotPasswordViewModel.dart';
import 'package:flu_proj/presentation/login/viewModel/login_viewModel.dart';
import 'package:flu_proj/presentation/register/registerViewModel/registerViewModel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceIml(instance()));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImp(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}
initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
            () => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
            () => RegisterViewModel(instance()));
  }
}
