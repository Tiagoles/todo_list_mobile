import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:more/more.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/evento_servico/evento_servico_repository.dart';
import 'package:smaservicos/app/domain/entities/core/lov_entity.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';
import 'package:smaservicos/app/utils/extensions/string_extension.dart';

class EventoServicoViewModel implements Disposable{

  final EventoServicoRepository _repository;
  late final StreamSubscription _subscription;

  final eventos = ValueNotifier<List<EventoServico>>([]);
  String? error;

  EventoServicoViewModel(this._repository){
    _subscription = _repository.watch().listen((data){
      eventos.value = data;
      error = null;
    });
    _subscription.onError((error){
      eventos.value = [];
      this.error = error.toString();
    });
  }

  AsyncResult<List<LovEntity>> findLov(String filter) async {
    return Success(eventos.value
      .where((e) => e.dsEvento!.normalizeToUpperCase().contains(filter.normalizeToUpperCase()) || e.cdEvento.toString().contains(filter))
      .map((e) => LovEntity(
        value: e,
        fieldText: '${e.cdEvento} - ${e.dsEvento}',
        dataList: {
          'Código': e.cdEvento.toString(),
          'Descrição': e.dsEvento!.toUpperCaseFirstCharacter(),
        }
      )).toList());
  }

  @override
  void dispose() {
    _subscription.cancel();
  }

}