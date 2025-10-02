import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/acao_tomada/acao_tomada_repository.dart';
import 'package:smaservicos/app/data/services/acao_tomada/acao_tomada_client.dart';
import 'package:smaservicos/app/data/services/acao_tomada/acao_tomada_database_service.dart';

class AcaoTomadaModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => AcaoTomadaClient(i.get(key: 'auth_client')));
    i.add(AcaoTomadaDatabaseService.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(AcaoTomadaRepository.new);
  }

}