import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/config/config_repository.dart';
import 'package:smaservicos/app/domain/entities/config/config_entity.dart';
import 'package:smaservicos/app/utils/command.dart';

class ConfigViewModel implements Disposable {

  final ConfigRepository _repository;
  late final StreamSubscription<Configs> _configsObserver;
  late final Command0<Unit> importDatabaseCommand;
  late final Command0<File> exportDatabaseCommand;

  ValueNotifier<Configs> configs = ValueNotifier(const Configs());

  ConfigViewModel(this._repository){
    _configsObserver = _repository.configsObserver.listen((data){
      configs.value = data;
    });
    exportDatabaseCommand = Command0<File>(_repository.exportDatabase);
    importDatabaseCommand = Command0<Unit>(_repository.importDatabase);
  }

  @override
  void dispose(){
    _configsObserver.cancel();
    importDatabaseCommand.dispose();
    exportDatabaseCommand.dispose();
    configs.dispose();
  }

  AsyncResult<Unit> resetDatabase() async {
    return _repository.resetDatabase();
  }

}