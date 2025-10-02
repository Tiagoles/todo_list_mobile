import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';

class DirectoryUtils{

  static AsyncResult<File> saveToDownloads(File file) async {
    try {

      final bytes = await file.readAsBytes();
      await FilePicker.platform.saveFile(
        dialogTitle: 'Salvar backup em',
        fileName: basename(file.path),
        bytes: bytes
      );

      return Success(file);
    } catch (e, s) {
      return Failure(AppFileSystemException(e.toString(), s));
    }
  }

  static AsyncResult<File> zipDirectory({
    required String sourceDirPath,
    String? zipFileName,
  }) async {
    try {
      final sourceDir = Directory(sourceDirPath);
      if (!await sourceDir.exists()) {
        return Failure(AppFileSystemException('Diretório não encontrado: $sourceDirPath'));
      }

      final name = zipFileName ??
          '${basename(sourceDirPath)}_${DateTime.now().millisecondsSinceEpoch}.zip';
      final tempDir = await getTemporaryDirectory();
      final zipFile = File('${tempDir.path}/$name');

      final encoder = ZipFileEncoder();
      encoder.create(zipFile.path);

      // Lista todos os arquivos recursivamente
      final allFiles = await sourceDir
          .list(recursive: true, followLinks: false)
          .where((entity) => entity is File)
          .cast<File>()
          .toList();

      for (var file in allFiles) {
        // Caminho relativo para manter a estrutura do diretório no ZIP
        final relativePath = file.path.replaceFirst('${sourceDir.path}/', '');
        await encoder.addFile(file, relativePath);
      }

      encoder.close();
      return Success(zipFile);
    } catch (e, s) {
      return Failure(AppFileSystemException('Erro ao criar ZIP: $e', s));
    }
  }

}