import 'dart:async';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:objectbox/objectbox.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smaservicos/app/configs/database/objectbox/objectbox.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/acao_tomada/database/db_acao_tomada.dart';
import 'package:smaservicos/app/data/models/acao_tomada/database/db_acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/db_inspecao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/database/db_inspecao_item.dart';
import 'package:smaservicos/app/data/models/inspecao_item/database/db_inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/database/db_tipo_irregularidade.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/database/db_tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/utils/directory_utils.dart';

class DatabaseService{

  final BehaviorSubject<ObjectBox> _objectBox = BehaviorSubject<ObjectBox>();

  Future<void> init() async {
    _objectBox.add(await ObjectBox.create());
  }

  AsyncResult<Unit> close() async {
    try{
      if(admin != null) admin!.close();
      store.close();
      await Future.delayed(const Duration(milliseconds: 100));
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<T> put<T extends Object>(T object) async {
    try{
      return Success(await getBox<T>().putAndGetAsync(object));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<int>> putMany<T>(List<T> objects) async {
    try{
      return Success(await getBox<T>().putManyAsync(objects));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<T>> putAndGetMany<T>(List<T> objects) async {
    try{
      return Success(await getBox<T>().putAndGetManyAsync(objects));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<bool> remove<T>(int id) async {
    try{
      return Success(await getBox<T>().removeAsync(id));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<Unit> removeMany<T>(List<int> ids) async {
    if(ids.isEmpty) return const Success(unit);
    try{
      await getBox<T>().removeManyAsync(ids);
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<T>> getAll<T>() async {
    try{
      return Success(await getBox<T>().getAllAsync());
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<T?>> getMany<T>(List<int> ids) async {
    try{
      final results = await getBox<T>().getManyAsync(ids);
      if(results.isEmpty){
        return Failure(LocalDatabaseException('Nenhum registro encontrado para os IDs fornecidos', StackTrace.current));
      }
      return Success(results);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<T> getById<T extends Object>(int id) async {
    try{
      final result = await getBox<T>().getAsync(id);
      if(result == null){
        return Failure(LocalDatabaseException('Registro não encontrado', StackTrace.current));
      }
      return Success(result);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<Query<T>> query<T>(Condition<T> conditions) async {
    try{
      return Success(getBox<T>().query(conditions).build());
    } on ObjectBoxException catch (e,s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  Stream<Query<T>> watchQuery<T>({Condition<T>? conditions, bool triggerImmediately = true}) {
    try{
      return objectBox.flatMap((ObjectBox ob) {
        final box = ob.store.box<T>();
        final queryBuilder = box.query(conditions);
        return queryBuilder.watch(triggerImmediately: triggerImmediately);
      });
    } on ObjectBoxException catch (e,s){
      return Stream.error(LocalDatabaseException(e.message, s));
    }
  }

  Result<Unit> reset<T>() {
    try{
      getBox<T>().removeAll();
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<Unit> dropDatabase() async {
    try{
      await Future.wait([
        getBox<DbAcaoTomada>().removeAllAsync(),
        getBox<DbAcaoTomadaConclusao>().removeAllAsync(),
        getBox<DbTipoIrregularidade>().removeAllAsync(),
        getBox<DbTipoIrregularidadeConclusao>().removeAllAsync(),
        getBox<DbInspecaoItem>().removeAllAsync(),
        getBox<DbInspecaoItemConclusao>().removeAllAsync(),
        getBox<DbInspecao>().removeAllAsync(),
        getBox<DbInspecaoConclusao>().removeAllAsync(),
      ]);
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<File> export() async {
    try{
      return close().flatMap((_) async {
        final path = store.directoryPath;
        if(!(await Directory(path).exists())) return Failure(LocalDatabaseException('Arquivo de banco de dados não encontrado', StackTrace.current));
        final packageInfo = await PackageInfo.fromPlatform();
        return DirectoryUtils.zipDirectory(sourceDirPath: path, zipFileName: 'db_${packageInfo.appName}_${DateTime.now()}.zip')
          .flatMap((file) async {
            if(store.isClosed()) await init();
            return Success(file);
          });
      });
    } catch(e, s){
      return Failure(LocalDatabaseException(e.toString(), s));
    }
  }

  AsyncResult<Unit> import(File backupZipFile) async {
    try {
      final closeResult = await close();
      if (closeResult.isError()) {
        return Failure(AppFileSystemException('Erro ao fechar o banco antes da importação'));
      }

      final storeDir = Directory(store.directoryPath);

      if (await storeDir.exists()) {
        await storeDir.delete(recursive: true);
      }
      await storeDir.create(recursive: true);

      final inputStream = InputFileStream(backupZipFile.path);
      final archive = ZipDecoder().decodeStream(inputStream);

      for (final file in archive) {
        final filePath = '${storeDir.path}/${file.name}';
        if (file.isFile) {
          final outFile = File(filePath);
          await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content as List<int>);
        } else {
          await Directory(filePath).create(recursive: true);
        }
      }
      inputStream.close();

      await init();

      return const Success(unit);
    } catch (e, s) {
      return Failure(AppFileSystemException('Erro ao importar backup ZIP: $e', s));
    }
  }

  Stream<ObjectBox> get objectBox => _objectBox.stream;
  Store get store => _objectBox.value.store;
  Admin? get admin => _objectBox.value.admin;
  Box<T> getBox<T>() => _objectBox.value.store.box<T>();

}