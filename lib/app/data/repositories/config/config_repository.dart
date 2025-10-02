import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/services/config/config_storage.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/domain/entities/config/config_entity.dart';
import 'package:smaservicos/app/domain/models/config/configs_form.dart';
import 'package:smaservicos/app/utils/directory_utils.dart';

class ConfigRepository implements Disposable {

  final ConfigStorage _localStorage;
  final DatabaseService _databaseService;
  final _subject = BehaviorSubject<Configs>.seeded(const Configs());

  ConfigRepository(this._localStorage, this._databaseService);

  AsyncResult<String> clearConfigs() {
    return _localStorage.clearConfigs();
  }

  AsyncResult<Configs> getConfigs() async {
    return _localStorage.getConfigs();
  }

  AsyncResult<Configs> saveConfigs(ConfigsForm form) async {
    return form.validateResult()
        .map((f) => f.toModel())
        .flatMap((_localStorage.saveConfigs))
        .onSuccess(_subject.add);
  }

  Stream<Configs> get configsObserver => _subject.stream;

  FutureOr<void> init() async {
    await _localStorage.getConfigs().onSuccess(_subject.add);
  }

  AsyncResult<Unit> resetDatabase() async {
    return _databaseService.dropDatabase();
  }

  AsyncResult<File> exportDatabase() async {
    return _databaseService.export()
      .flatMap(DirectoryUtils.saveToDownloads)
      .flatMap((file) async {
        final params = ShareParams(
          text: basename(file.path),
          subject: 'Backup do banco de dados S.M.A. Inspeção',
          files: [XFile(file.path)],
        );
        await SharePlus.instance.share(params);
        return Success(file);
      });
  }

  AsyncResult<Unit> importDatabase() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );

    if (result == null || result.files.isEmpty) {
      return Failure(AppFileSystemException('Nenhum arquivo selecionado'));
    }

    final backupFile = File(result.files.single.path!);

    if (!(await backupFile.exists())) {
      return Failure(AppFileSystemException('Arquivo selecionado não existe'));
    }

    return _databaseService.import(backupFile);

  }

  @override
  void dispose() {
    _subject.close();
  }

}