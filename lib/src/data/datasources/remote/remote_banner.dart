import 'package:kulina_testapp/src/commons/config.dart';
import 'package:kulina_testapp/src/data/models/banner.dart';
import 'package:dio/dio.dart';

abstract class RemoteBanner {
  Future<List<Banner>> getBannerVariantTop();

  Future<List<Banner>> getBannerVariantSmall();
}

class RemoteBannerImpl extends RemoteBanner {
  final Dio dio;

  RemoteBannerImpl(this.dio);
  @override
  Future<List<Banner>> getBannerVariantSmall() async {
    dio.options.baseUrl = Config.baseUrl;
    var response = await dio.get("");
    return List.from(response.data['data'].where((x) => x['variant']['slug'] == "small").map((x) => Banner.fromJson(x)));
  }

  @override
  Future<List<Banner>> getBannerVariantTop() async {
    dio.options.baseUrl = Config.baseUrl;
    var response = await dio.get("");
    return List.from(response.data['data'].where((x) => x['variant']['slug'] == "top").map((x) => Banner.fromJson(x)));
  }
}
