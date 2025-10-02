import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/inspecao_item/inspecao_item_repository.dart';
import 'package:smaservicos/app/data/services/inspecao_item/inspecao_item_client.dart';
import 'package:smaservicos/app/data/services/inspecao_item/inspecao_item_database_service.dart';

class InspecaoItemModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => InspecaoItemClient(i.get(key: 'auth_client')));
    i.add(InspecaoItemDatabaseService.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(InspecaoItemRepository.new);
  }

}