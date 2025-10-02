import 'dart:io';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/anexo/anexo_repository.dart';
import 'package:smaservicos/app/data/services/core/geolocator_service.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';
import 'package:smaservicos/app/domain/usecases/core/copy_to_app_dir.dart';

class SalvarAnexos {
  final AnexoRepository _anexoRepository;
  final GeolocatorService _geolocator;
  final CopyToAppDir _coppyToAppDir = CopyToAppDir('anexos');

  SalvarAnexos(
    this._anexoRepository,
    this._geolocator,
  );

  AsyncResult<Anexo> _buildAnexoFromFile(File file, String geo) async {
    final size = await file.length();
    final type = mime(file.path) ?? 'application/octet-stream';

    return Success(Anexo(
      id: null,
      path: file.path,
      name: p.basename(file.path),
      type: type,
      size: size,
      geolocation: geo,
      createdAt: DateTime.now(),
    ));
  }

  AsyncResult<List<Anexo>> call(List<File> toSave) async {

    final pos = await _geolocator.getCurrentLocation().getOrNull();
    final geo = pos != null ? '${pos.latitude},${pos.longitude}' : '';

    final anexos = <Anexo>[];
    await Future.wait(toSave.map((file) async {
      await _coppyToAppDir(file).flatMap((f) => _buildAnexoFromFile(f, geo)).onSuccess(anexos.add);
    }));
    return _anexoRepository.putAndGetMany(anexos);
  }
}
