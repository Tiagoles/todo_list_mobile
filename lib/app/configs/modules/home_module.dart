import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/ui/home/home_page.dart';

class HomeModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
  ];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => HomePage(
      queryParams: Modular.args.queryParams), transition: TransitionType.leftToRight);
  }

}