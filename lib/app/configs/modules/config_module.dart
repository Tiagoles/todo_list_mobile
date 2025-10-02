import 'package:animations/animations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/data/repositories/config/config_repository.dart';
import 'package:smaservicos/app/data/repositories/config/theme_repository.dart';
import 'package:smaservicos/app/data/services/config/config_storage.dart';
import 'package:smaservicos/app/data/services/config/theme_storage.dart';
import 'package:smaservicos/app/data/services/core/local_storage/shared_preferences_storage.dart';
import 'package:smaservicos/app/ui/config/config_page.dart';
import 'package:smaservicos/app/ui/config/viewmodels/config_viewmodel.dart';
import 'package:smaservicos/app/ui/config/viewmodels/configs_form/configs_form_viewmodel.dart';
import 'package:smaservicos/app/ui/core/viewmodels/theme_viewmodel.dart';
import 'package:smaservicos/app/utils/auto_dispose.dart';

import 'core_module.dart';

class ConfigModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(ConfigRepository.new);
    i.addSingleton(ConfigViewModel.new);
    i.addSingleton(ThemeRepository.new);
    i.addSingleton(ThemeViewmodel.new);
    i.add<ConfigsFormViewModel>(ConfigsFormViewModel.new, config: autoDisposeConfig());
  }

  @override
  void binds(Injector i) {
    i.addSingleton(() => ThemeStorage(i.get<SharedPreferencesStorage>()));
    i.add(() => ConfigStorage(i.get<SharedPreferencesStorage>()));
  }

  @override
  void routes(RouteManager r) {
    r.child(
        Modular.initialRoute,
        child: (_) => ConfigPage(formViewmodel: Modular.get(), viewModel: Modular.get()),
        transition: TransitionType.custom,
        customTransition: CustomTransition(
            transitionBuilder: (context, animation, secondaryAnimation, child){
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            }
        )
    );
  }

}