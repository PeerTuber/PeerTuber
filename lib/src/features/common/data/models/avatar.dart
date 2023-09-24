import 'package:flutter_peertuber/src/features/common/domain/entities/entities.dart';

class AvatarModel extends AvatarEntity {
  const AvatarModel(
      {super.width,
      required super.path,
      super.url,
      required super.createdAt,
      required super.updatedAt});

  factory AvatarModel.fromJson(Map<String, dynamic> json) => AvatarModel(
        width: json["width"],
        path: json["path"],
        url: json["url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "path": path,
        "url": url,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
