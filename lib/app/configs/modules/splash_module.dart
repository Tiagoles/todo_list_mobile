import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/config_module.dart';
import 'package:smaservicos/app/ui/splash/splash_page.dart';
import 'package:smaservicos/app/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:smaservicos/app/utils/auto_dispose.dart';

class SplashModule extends Module{

  @override
  List<Module> get imports => [
    ConfigModule(),
  ];

  @override
  void binds(Injector i) {
    i.add<SplashViewModel>(SplashViewModel.new, config: autoDisposeConfig());
  }
  
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => SplashPage(viewModel: Modular.get()));
  }

}