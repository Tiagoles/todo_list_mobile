import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/data/repositories/todo_repository.dart';
import 'package:smaservicos/app/data/services/todo_service.dart';
import 'package:smaservicos/app/ui/todo_list/get_list.dart';
import 'package:smaservicos/app/ui/todo_list/viewmodels/todo_viewmodel.dart';

import 'core_module.dart';

class TodoModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(TodoViewmodel.new);
    i.addSingleton(TodoService.new);
    i.addSingleton(TodoRepository.new);
  }
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const GetList());
  }
}
