import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/data/repositories/anexo/anexo_repository.dart';
import 'package:smaservicos/app/data/services/anexo/anexo_service.dart';
import 'package:smaservicos/app/domain/usecases/anexo/remover_anexos.dart';
import 'package:smaservicos/app/domain/usecases/anexo/salvar_anexos.dart';

class AnexoModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(AnexoRepository.new);
    i.add(RemoverAnexos.new);
    i.add(SalvarAnexos.new);
  }

  @override
  void binds(Injector i) {
    i.add(AnexoService.new);
  }

}