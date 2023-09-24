import 'package:equatable/equatable.dart';

class AvatarEntity extends Equatable {
  final int? width;
  final String path;
  final String? url;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AvatarEntity({
    this.width,
    required this.path,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        width,
        path,
        url,
        createdAt,
        updatedAt,
      ];
}
