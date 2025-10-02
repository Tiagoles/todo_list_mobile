import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/tipo_irregularidade/tipo_irregularidade_repository.dart';
import 'package:smaservicos/app/data/services/tipo_irregularidade/tipo_irregularidade_client.dart';
import 'package:smaservicos/app/data/services/tipo_irregularidade/tipo_irregularidade_database_service.dart';

class TipoIrregularidadeModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => TipoIrregularidadeClient(i.get(key: 'auth_client')));
    i.add(TipoIrregularidadeDatabaseService.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(TipoIrregularidadeRepository.new);
  }

}