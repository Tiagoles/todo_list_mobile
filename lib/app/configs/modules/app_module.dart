import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/camera_module.dart';
import 'package:smaservicos/app/configs/modules/config_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/home_module.dart';
import 'package:smaservicos/app/configs/modules/splash_module.dart';
import 'package:smaservicos/app/configs/modules/todo_module.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    ConfigModule(),
  ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/home', module: HomeModule());
    r.module('/todo', module: TodoModule());
    r.module('/camera', module: CameraModule());
    r.module('/configs', module: ConfigModule());
  }

}