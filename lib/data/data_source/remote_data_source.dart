import 'package:flu_proj/data/network/app_api.dart';
import 'package:flu_proj/data/network/requests.dart';
import 'package:flu_proj/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgotPasswordResponse> forgotPassword(String email);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<StoreDetailsResponse> getStoreDetails();

  Future<HomeResponse> getHomeData();



}

class RemoteDataSourceIml implements RemoteDataSource {
  RemoteDataSourceIml(this._appServiceClient);

  AppServiceClient _appServiceClient;

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password,
    ""//using mock API
    //    registerRequest.profilePicture

    );
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appServiceClient.getStoreDetails();
  }
  @override
  Future<HomeResponse> getHomeData()async {
  return await _appServiceClient.getHomeData();
  }
}
