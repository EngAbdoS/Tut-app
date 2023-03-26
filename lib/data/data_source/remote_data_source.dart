import 'package:flu_proj/data/network/app_api.dart';
import 'package:flu_proj/data/network/requests.dart';
import 'package:flu_proj/data/response/responses.dart';

abstract class RemoteDataSource
{

Future<AuthenticationResponse>login(LoginRequest loginRequest);



}


class RemoteDataSourceIml implements RemoteDataSource{
  RemoteDataSourceIml(this._appServiceClient);


  AppServiceClient _appServiceClient;

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
   return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }




}