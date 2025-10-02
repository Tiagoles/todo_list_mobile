import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/apontamento_hora_module.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/camera_module.dart';
import 'package:smaservicos/app/configs/modules/config_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/evento_servico_module.dart';
import 'package:smaservicos/app/configs/modules/home_module.dart';
import 'package:smaservicos/app/configs/modules/inspecao_module.dart';
import 'package:smaservicos/app/configs/modules/splash_module.dart';
import 'package:smaservicos/app/configs/modules/startup_module.dart';
import 'package:smaservicos/app/ui/auth/guards/admin_guard.dart';
import 'package:smaservicos/app/ui/auth/guards/auth_guard.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule(),
    ConfigModule(),
    EventoServicoModule(),
    ApontamentoHoraModule(),
  ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/startup', module: StartupModule(), guards: [AuthGuard()]);
    r.module('/home', module: HomeModule(), guards: [
      AuthGuard(),
    ]);
    r.module('/auth', module: AuthModule());
    r.module('/camera', module: CameraModule());
    r.module('/configs', module: ConfigModule(), guards: [
      AuthGuard(),
      AdminGuard()
    ]);
    r.module('/inspecao', module: InspecaoModule(), guards: [AuthGuard()]);
    r.module('/apontamentos-hora', module: ApontamentoHoraModule());
  }

}