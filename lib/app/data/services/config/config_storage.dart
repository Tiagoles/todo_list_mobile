import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/local_storage/local_storage.dart';
import 'package:smaservicos/app/domain/entities/config/config_entity.dart';

const _configKey = 'configs';
class ConfigStorage {
  final LocalStorage _localStorage;

  ConfigStorage(this._localStorage);

  AsyncResult<Configs> saveConfigs(Configs configs){
    return _localStorage.write(
        key: _configKey,
        value: jsonEncode(configs.toJson())
    ).map((s) => Configs.fromJson(jsonDecode(s)));
  }

  AsyncResult<Configs> getConfigs() {
    return _localStorage.read(key: _configKey)
        .flatMap((s) => Success(
        Configs.fromJson(jsonDecode(s))
    ));
  }

  AsyncResult<String> clearConfigs() {
    return _localStorage.delete(key: _configKey);
  }

}