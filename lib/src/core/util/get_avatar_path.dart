import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

typedef AvatarTypes = ({ChannelEntity channel, AccountEntity account});

class GetAvatarPath {
  static String avatarPath({
    required AvatarTypes types,
    required AvatarTarget target,
    required InstanceEntity instance,
  }) {
    if (target == AvatarTarget.channel) {
      if (types.channel.avatar == null && types.account.avatar != null) {
        return types.account.avatar!.url == null
            ? '${instance.host}${types.account.avatar!.path}'
            : types.account.avatar!.url!;
      } else if (types.channel.avatar != null) {
        return types.channel.avatar!.url == null
            ? '${instance.host}${types.channel.avatar!.path}'
            : types.channel.avatar!.url!;
      }
    } else if (target == AvatarTarget.account) {
      if (types.account.avatar == null && types.channel.avatar != null) {
        return types.channel.avatar!.url == null
            ? '${instance.host}${types.channel.avatar!.path}'
            : types.channel.avatar!.url!;
      } else if (types.account.avatar != null) {
        return types.account.avatar!.url == null
            ? '${instance.host}${types.account.avatar!.path}'
            : types.account.avatar!.url!;
      }
    }

    return '';
  }
}
