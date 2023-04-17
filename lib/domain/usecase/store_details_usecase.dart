

import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/models.dart';
import '../repository/repository.dart';
import 'base_use_case.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}