import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';

class RegInspArquivoDTO{
  final int nrInspecao;
  final List<InspecaoAnexoDto> anexos;

  RegInspArquivoDTO({
    required this.nrInspecao,
    this.anexos = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'nrInspecao': nrInspecao,
      'anexos': anexos.map((e) => e.toJson()).toList(),
    };
  }

  factory RegInspArquivoDTO.fromEntity(int nrInspecao, List<Anexo> anexos){
    return RegInspArquivoDTO(
      nrInspecao: nrInspecao,
      anexos: anexos.map((e) => InspecaoAnexoDto.fromAnexo(e)).whereType<InspecaoAnexoDto>().toList(),
    );
  }

}

class InspecaoAnexoDto{
  final String dsFoto;
  final String flDados;
  final MultipartFile arquivo;

  InspecaoAnexoDto({
    required this.dsFoto,
    required this.flDados,
    required this.arquivo,
  });

  Map<String, dynamic> toJson() => {
    'dsFoto': dsFoto,
    'flDados': flDados,
    'arquivo': arquivo,
  };

  static AsyncResult<InspecaoAnexoDto> fromAnexo(Anexo anexo) async {
    return anexo.toMultipartFile().map((file) => InspecaoAnexoDto(
        dsFoto: anexo.name,
        flDados: jsonEncode(anexo.metadata),
        arquivo: file
    ));
  }

}