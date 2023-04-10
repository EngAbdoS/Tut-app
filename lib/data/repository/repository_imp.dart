import 'package:dartz/dartz.dart';
import 'package:flu_proj/data/mapper/mapper.dart';
import 'package:flu_proj/data/network/error_handler.dart';
import 'package:flu_proj/data/network/failure.dart';
import 'package:flu_proj/data/network/requests.dart';
import 'package:flu_proj/domain/models/models.dart';
import 'package:flu_proj/domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImp implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImp(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return left(Failure(response.message ?? ResponceMessage.DEFAULT,
              ApiInternalStatus.FAILURE));
        }
      } catch (error) {

        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async{


    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgotPassword(email);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return left(Failure(response.message ?? ResponceMessage.DEFAULT,
              ApiInternalStatus.FAILURE));
        }
      } catch (error) {

        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
    
    
  }
}
