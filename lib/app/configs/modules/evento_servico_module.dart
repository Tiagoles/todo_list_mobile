import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/evento_servico/evento_servico_repository.dart';
import 'package:smaservicos/app/data/services/evento_servico/evento_servico_client.dart';
import 'package:smaservicos/app/data/services/evento_servico/evento_servico_database_service.dart';
import 'package:smaservicos/app/ui/evento_servico/viewmodel/evento_servico_viewmodel.dart';

class EventoServicoModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => EventoServicoClient(i.get(key: 'auth_client')));
    i.add(EventoServicoDatabaseService.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(EventoServicoRepository.new);
    i.addSingleton(EventoServicoViewModel.new);
  }

}