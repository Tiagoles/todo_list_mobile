import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/eletricista/eletricista_repository.dart';
import 'package:smaservicos/app/data/services/eletricista/eletricista_client.dart';
import 'package:smaservicos/app/ui/eletricista/viewmodels/eletricista_lov_viewmodel.dart';

class EletricistaModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => EletricistaClient(i.get(key: 'client_http')));
    i.add(EletricistaRepository.new);
    i.add(EletricistaLovViewModel.new);
  }
}