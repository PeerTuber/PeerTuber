import 'package:json_annotation/json_annotation.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

part 'avatar.g.dart';

@JsonSerializable()
class AvatarModel extends AvatarEntity {
  const AvatarModel(
      {super.width,
      required super.path,
      super.url,
      required super.createdAt,
      required super.updatedAt});

  AvatarEntity toEntity() {
    return AvatarEntity(
      path: path,
      width: width,
      url: url,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory AvatarModel.fromEntity(AvatarEntity entity) {
    return AvatarModel(
      width: entity.width,
      path: entity.path,
      url: entity.url,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarModelToJson(this);
}
