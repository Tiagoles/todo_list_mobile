import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:uuid/uuid.dart';

class CopyToAppDir {
  final Uuid _uuid = Modular.get<Uuid>();
  final String _subdir;

  CopyToAppDir(this._subdir);

  AsyncResult<File> call(File original) async {
    try {
      if (!await original.exists()) {
        return Failure(AppFileSystemException('Arquivo não encontrado: ${original.path}'));
      }

      final base = await getApplicationSupportDirectory();
      final baseDir = Directory(p.join(base.path, _subdir));
      if (!await baseDir.exists()) await baseDir.create(recursive: true);

      final id = _uuid.v4().replaceAll('-', '').substring(0, 12);
      final ext = p.extension(original.path).toLowerCase();

      final shardDir = Directory(p.join(baseDir.path, id.substring(0, 2)));
      if (!await shardDir.exists()) await shardDir.create(recursive: true);

      var destName = '$id$ext';
      var destPath = p.join(shardDir.path, destName);
      var destFile = File(destPath);

      var attempt = 0;
      while (await destFile.exists() && attempt < 3) {
        attempt++;
        destName = '${id}_$attempt$ext';
        destPath = p.join(shardDir.path, destName);
        destFile = File(destPath);
      }

      try {
        final moved = await original.rename(destPath);
        return Success(moved);
      } on AppFileSystemException {
        final copied = await original.copy(destPath);
        try { await original.delete(); } catch (_) {}
        return Success(copied);
      }
    } catch (e) {
      return Failure(AppFileSystemException('Erro ao copiar arquivo: $e'));
    }
  }
}