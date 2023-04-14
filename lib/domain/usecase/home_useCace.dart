import 'package:dartz/dartz.dart';
import 'package:flu_proj/domain/models/models.dart';
import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_use_case.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
