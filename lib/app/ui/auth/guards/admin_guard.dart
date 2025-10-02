import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/auth_viewmodel/auth_viewmodel.dart';

class AdminGuard extends RouteGuard {
  AdminGuard() : super(redirectTo: '/home/?error=unauthorized');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return Modular.get<AuthViewModel>().isAdmin;
  }

}