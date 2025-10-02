import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/started/inspecao_started_viewmodel.dart';
import 'package:smaservicos/app/utils/functions.dart';

class InspectionHasAlreadyStartedGuard extends RouteGuard{

  InspectionHasAlreadyStartedGuard() : super(redirectTo: '/home/?error=inspection_already_started');

  @override
  bool canActivate(String path, ParallelRoute route) {
    final models = Modular.get<InspecaoStartedViewModel>().models;
    final id = toInt(Modular.args.params['id']);
    return models.isEmpty || models.first.model.id == id;
  }

}