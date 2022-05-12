import 'package:kulina_testapp/src/commons/failure.dart';
import 'package:kulina_testapp/src/domain/entities/banner_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerEntity>>> getBannerVariantSmall();

  Future<Either<Failure, List<BannerEntity>>> getBannerVariantTop();
}
