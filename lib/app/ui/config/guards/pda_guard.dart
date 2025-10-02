import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/config/viewmodels/config_viewmodel.dart';

class PdaGuard extends RouteGuard {

  String? error;

  PdaGuard() : super(redirectTo: '/configs/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final numeroPda = Modular.get<ConfigViewModel>().configs.value.numeroPda;

    if(numeroPda == null || numeroPda > 0){
      return false;
    }
    return true;
  }

}
