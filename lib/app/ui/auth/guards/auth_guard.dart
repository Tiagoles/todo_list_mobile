import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/auth_viewmodel/auth_viewmodel.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/logout');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final authViewModel = Modular.get<AuthViewModel>();
    if(!(authViewModel.isLogged)){
      return false;
    }
    if(authViewModel.isSessionExpired){
      Future.microtask(() => Modular.to.navigate('${redirectTo!}?expired=true'));
      return false;
    }
    return true;
  }

}
