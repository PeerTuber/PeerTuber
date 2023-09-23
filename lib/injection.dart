import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:miniplayer/miniplayer.dart';
import 'injection.config.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @Named("Configuration")
  VideoControllerConfiguration get vcConfig =>
      const VideoControllerConfiguration();

  @lazySingleton
  VideoController vc(
          @Named('Configuration') VideoControllerConfiguration vcConfig) =>
      VideoController(Player(), configuration: vcConfig);

  @Named("Configuration")
  PlayerConfiguration get pConfig => const PlayerConfiguration();

  @lazySingleton
  Player p(@Named('Configuration') PlayerConfiguration pConfig) =>
      Player(configuration: pConfig);

  @singleton
  MiniplayerController get miniPlayerController;

  @lazySingleton
  InternetConnection get internetConnection;

  @lazySingleton // or @singleton
  http.Client get httpClient => http.Client();
}
