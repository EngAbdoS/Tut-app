import 'package:dartz/dartz.dart';
import 'package:flu_proj/data/network/failure.dart';

abstract class BaseUseCase<In,Out>
{
  Future<Either<Failure,Out>>execute(In input);


}