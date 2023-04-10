import 'package:dartz/dartz.dart';
import 'package:flu_proj/data/network/failure.dart';
import 'package:flu_proj/domain/usecase/base_use_case.dart';

import '../repository/repository.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }
}
