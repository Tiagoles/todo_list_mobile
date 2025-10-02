import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/evento_servico_module.dart';
import 'package:smaservicos/app/ui/apontamento_hora/apontamento_day_page.dart';
import 'package:smaservicos/app/ui/apontamento_hora/apontamento_week_page.dart';
import 'package:smaservicos/app/ui/apontamento_hora/viewmodels/apontamento_hora_viewmodel.dart';

class ApontamentoHoraModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule(),
    EventoServicoModule()
  ];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(ApontamentoHoraViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => ApontamentoWeekPage(viewModel: Modular.get()));
    r.child('/dia', child: (context){
      return ApontamentoDayPage(apontamentos: r.args.data);
    });
  }

}