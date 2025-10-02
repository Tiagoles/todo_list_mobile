import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/acao_tomada_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/evento_servico_module.dart';
import 'package:smaservicos/app/configs/modules/inspecao_item_module.dart';
import 'package:smaservicos/app/configs/modules/inspecao_module.dart';
import 'package:smaservicos/app/configs/modules/tipo_irregularidade_module.dart';
import 'package:smaservicos/app/ui/auth/guards/auth_guard.dart';
import 'package:smaservicos/app/ui/startup/startup_page.dart';
import 'package:smaservicos/app/ui/startup/viewmodels/startup_viewmodel.dart';
import 'package:smaservicos/app/utils/auto_dispose.dart';

class StartupModule extends Module {
  @override
  List<Module> get imports => [
    CoreModule(),
    InspecaoModule(),
    InspecaoItemModule(),
    TipoIrregularidadeModule(),
    AcaoTomadaModule(),
    EventoServicoModule()
  ];

  @override
  void binds(Injector i) {
    i.add<StartupViewModel>(StartupViewModel.new, config: autoDisposeConfig());
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => StartupPage(viewModel: Modular.get()),
      guards: [AuthGuard()],
    );
  }
}
