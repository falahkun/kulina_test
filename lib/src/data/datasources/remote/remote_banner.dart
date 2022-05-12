import 'package:kulina_testapp/src/data/models/banner.dart';

abstract class RemoteBanner {
  Future<List<Banner>> getBannerVariantTop();

  Future<List<Banner>> getBannerVariantSmall();
}

class
