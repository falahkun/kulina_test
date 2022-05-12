import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:kulina_testapp/src/commons/config.dart';
import 'package:kulina_testapp/src/commons/dio.dart';
import 'package:kulina_testapp/src/data/datasources/remote/remote_banner.dart';
import 'package:kulina_testapp/src/data/repositories/banner_repository_impl.dart';
import 'package:kulina_testapp/src/domain/repositories/banner_repository.dart';
import 'package:kulina_testapp/src/domain/usecases/banner_usecase.dart';
import 'package:kulina_testapp/src/presentation/blocs/banner_vsmall_bloc.dart';
import 'package:kulina_testapp/src/presentation/blocs/banner_vtop_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory<Dio>(() => DioClient(apiBaseUrl: Config.baseUrl).dio);

  locator.registerFactory<RemoteBanner>(
      () => RemoteBannerImpl(locator.get<Dio>()));
  locator.registerFactory<BannerRepository>(
      () => BannerRepositoryImpl(locator.get<RemoteBanner>()));
  locator.registerFactory<BannerUseCase>(
      () => BannerUseCaseImpl(locator.get<BannerRepository>()));
}
