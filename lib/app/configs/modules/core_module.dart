import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/data/services/core/geolocator_service.dart';
import 'package:smaservicos/app/data/services/core/local_storage/secure_storage.dart';
import 'package:smaservicos/app/data/services/core/local_storage/shared_preferences_storage.dart';
import 'package:smaservicos/app/plugins/notification_service.dart';
import 'package:smaservicos/env/env.dart';
import 'package:uuid/uuid.dart';

class CoreModule extends Module {

  @override
  void exportedBinds(Injector i) {
    i.add(Uuid.new);
    i.addSingleton(Env.new);
    i.addSingleton(DatabaseService.new);
    i.add(FlutterLocalNotificationsPlugin.new);
    i.addSingleton(NotificationService.new);
    i.add(FlutterSecureStorage.new);
    i.add(SharedPreferencesStorage.new);
    i.add(SecureStorage.new);
    i.addSingleton(Connectivity.new);
    i.addSingleton(ConnectivityService.new);
    i.addSingleton(Geolocator.new);
    i.addSingleton<GeolocatorService>(GeolocatorService.new);
    i.addSingleton(HttpClient.new);
    i.addSingleton(BaseOptions.new);
    i.addSingleton(() => Dio(i.get<BaseOptions>()));
    i.addSingleton<ClientHttp>(ClientHttp.new, key: 'client_http');
  }

}