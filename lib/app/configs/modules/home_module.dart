import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/inspecao_module.dart';
import 'package:smaservicos/app/ui/home/home_page.dart';

class HomeModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule(),
    InspecaoModule()
  ];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => HomePage(
      queryParams: Modular.args.queryParams,
      viewModel: Modular.get(),
      fromRemoteViewModel: Modular.get(),
    ), transition: TransitionType.leftToRight);
  }

}