import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/repositories/auth/auth_repository.dart';
import 'package:smaservicos/app/data/repositories/auth/credentials_repository.dart';
import 'package:smaservicos/app/data/repositories/config/config_repository.dart';
import 'package:smaservicos/app/data/repositories/config/theme_repository.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/data/services/core/geolocator_service.dart';
import 'package:smaservicos/app/plugins/notification_service.dart';
import 'package:smaservicos/app/utils/command.dart';

class SplashViewModel implements Disposable {
  final ConfigRepository _configRepository;
  final AuthRepository _authRepository;
  final CredentialsRepository _credentialsRepository;
  final ThemeRepository _themeRepository;
  final DatabaseService _databaseService;
  final NotificationService _notificationService;
  final GeolocatorService _geolocatorService;

  SplashViewModel(
    this._configRepository,
    this._authRepository,
    this._credentialsRepository,
    this._themeRepository,
    this._databaseService,
    this._notificationService,
    this._geolocatorService,
  ) {
    loadCommand = Command0(_loadInitialDependencies);
    loadCommand.execute();
  }

  late final Command0<Unit> loadCommand;

  AsyncResult<Unit> _loadInitialDependencies() async {
    try{
      await _databaseService.init();
      await _notificationService.init();
      await _geolocatorService.init();
      await _configRepository.init();
      await _authRepository.init();
      await _credentialsRepository.init();
      await _themeRepository.init();
      return const Success(unit);
    } on Exception catch(e){
      return Failure(LocalDatabaseException(e.toString()));
    }
  }

  @override
  void dispose() {
    loadCommand.dispose();
  }

}