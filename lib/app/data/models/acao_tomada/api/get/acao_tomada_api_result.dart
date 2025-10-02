import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/acao_tomada/acao_tomada.dart';

part 'acao_tomada_api_result.g.dart';

@JsonSerializable(createToJson: false)
class AcaoTomadaApiResult {
  final int cdAcaoTomada;
  final String dsAcaoTomada;

  AcaoTomadaApiResult({
    required this.cdAcaoTomada,
    required this.dsAcaoTomada,
  });

  factory AcaoTomadaApiResult.fromJson(Map<String, dynamic> json) =>
      _$AcaoTomadaApiResultFromJson(json);

  AcaoTomada toEntity() {
    return AcaoTomada(
      cdAcaoTomada: cdAcaoTomada,
      dsAcaoTomada: dsAcaoTomada,
    );
  }

}