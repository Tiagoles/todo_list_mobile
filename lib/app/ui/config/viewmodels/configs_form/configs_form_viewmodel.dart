import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/config/config_repository.dart';
import 'package:smaservicos/app/domain/entities/config/config_entity.dart';
import 'package:smaservicos/app/domain/models/config/configs_form.dart';
import 'package:smaservicos/app/utils/command.dart';

class ConfigsFormViewModel implements Disposable{
  final ConfigRepository _repository;
  late final StreamSubscription<Configs> _configsObserver;
  ConfigsForm configsForm = ConfigsForm();

  ConfigsFormViewModel(this._repository){
    _configsObserver = _repository.configsObserver.listen((data){
      _configs = data;
      configsForm.fromModel(data);
    });
    saveCommand = Command1<Unit, bool>(_submitForm);
  }

  Configs _configs = const Configs();

  late final Command1<Unit, bool> saveCommand;

  bool get pdaHasBeenChanged => _configs.numeroPda.toString() != configsForm.control('numeroPda').value;

  AsyncResult<Unit> _submitForm(bool canReset) async {
    return _repository.saveConfigs(configsForm).flatMap((_) async {
      if (canReset){
        return _repository.resetDatabase()
          .onSuccess((_) => Modular.to.pushNamed('/home/'));
      }
      Modular.to.pop();
      return const Success(unit);
    });
  }

  @override
  void dispose(){
    configsForm.dispose();
    _configsObserver.cancel();
    saveCommand.dispose();
  }
}