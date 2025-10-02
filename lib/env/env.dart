import 'package:envied/envied.dart';
import 'package:flutter/foundation.dart';

part 'env.g.dart';

@Envied(path: '.env', name: 'ProductionEnv')
@Envied(path: '.env_debug', name: 'DebugEnv')
final class Env {

  factory Env() => _instance;

  static final Env _instance = switch (kDebugMode) {
    true => _DebugEnv(),
    false => _ProductionEnv(),
  };

  @EnviedField(varName: 'API_URL')
  final String apiUrl = _instance.apiUrl;
}