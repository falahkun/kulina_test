import 'package:kulina_testapp/src/domain/entities/banner_entity.dart';

class Banner {
  final int id;
  final String name;
  final String media;
  final String pageUrl;

  Banner(
      {required this.id,
      required this.media,
      required this.name,
      required this.pageUrl});

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
      id: json['id'],
      media: json['media'],
      name: json['variant']['slug'],
      pageUrl: json['page_url']);

  BannerEntity toEntity() =>
      BannerEntity(id: id, media: media, name: name, pageUrl: pageUrl);
}
