import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/equipe/equipe_repository.dart';
import 'package:smaservicos/app/data/services/equipe/equipe_client.dart';
import 'package:smaservicos/app/ui/equipe/viewmodels/equipe_lov_viewmodel.dart';

class EquipeModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => EquipeClient(i.get(key: 'client_http')));
    i.add(EquipeRepository.new);
    i.add(EquipeLovViewModel.new);
  }
}