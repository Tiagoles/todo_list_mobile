import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/utils/functions.dart';

class InspecaoNotFoundGuard extends RouteGuard{
  InspecaoNotFoundGuard() : super(redirectTo: '/home/?error=unfound_inspecao');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final id = toInt(Modular.args.params['id']);
    if (id == null || id <= 0) return false;
    return true;
  }

}