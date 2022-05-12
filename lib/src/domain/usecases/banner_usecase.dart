import 'package:kulina_testapp/src/commons/failure.dart';
import 'package:kulina_testapp/src/domain/entities/banner_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:kulina_testapp/src/domain/repositories/banner_repository.dart';

abstract class BannerUseCase {
  Future<Either<Failure, List<BannerEntity>>> getBannerVariantSmall();

  Future<Either<Failure, List<BannerEntity>>> getBannerVariantTop();
}

class BannerUseCaseImpl extends BannerUseCase {
  final BannerRepository repository;

  BannerUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBannerVariantSmall() async =>
      await repository.getBannerVariantSmall();

  @override
  Future<Either<Failure, List<BannerEntity>>> getBannerVariantTop() async =>
      await repository.getBannerVariantTop();
}
