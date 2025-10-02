import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/data/repositories/acao_tomada/acao_tomada_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao_item/inspecao_item_repository.dart';
import 'package:smaservicos/app/data/repositories/tipo_irregularidade/tipo_irregularidade_repository.dart';

class InspecaoFormItemsGuard extends RouteGuard{
  InspecaoFormItemsGuard() : super(redirectTo: '/home/?error=no_sync_form_items');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    if(Modular.get<InspecaoItemRepository>().items.isEmpty){
      return false;
    }
    if(Modular.get<TipoIrregularidadeRepository>().items.isEmpty){
      return false;
    }
    if(Modular.get<AcaoTomadaRepository>().items.isEmpty){
      return false;
    }
    return true;
  }

}