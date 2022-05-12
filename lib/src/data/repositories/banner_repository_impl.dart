import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kulina_testapp/src/commons/failure.dart';
import 'package:kulina_testapp/src/data/datasources/remote/remote_banner.dart';
import 'package:kulina_testapp/src/domain/entities/banner_entity.dart';
import 'package:kulina_testapp/src/domain/repositories/banner_repository.dart';

class BannerRepositoryImpl extends BannerRepository {
  final RemoteBanner remoteBanner;

  BannerRepositoryImpl(this.remoteBanner);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBannerVariantSmall() async {
    try {
      final _results = await remoteBanner.getBannerVariantSmall();
      return Right(List<BannerEntity>.from(_results.map((e) => e.toEntity())));
    } on SocketException {
      return Left(ConnectionFailure("Connection error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BannerEntity>>> getBannerVariantTop() async {
    try {
      final _results = await remoteBanner.getBannerVariantTop();
      return Right(List<BannerEntity>.from(_results.map((e) => e.toEntity())));
    } on SocketException {
      return Left(ConnectionFailure("Connection error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
