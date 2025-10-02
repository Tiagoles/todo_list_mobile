import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';

part 'tipo_irregularidade_api_result.g.dart';

@JsonSerializable(createToJson: false)
class TipoIrregularidadeApiResult {
  final int cdTipoIrregularidade;
  final String dsTipoIrregularidade;

  TipoIrregularidadeApiResult({
    required this.cdTipoIrregularidade,
    required this.dsTipoIrregularidade,
  });

  factory TipoIrregularidadeApiResult.fromJson(Map<String, dynamic> json) =>
      _$TipoIrregularidadeApiResultFromJson(json);

  TipoIrregularidade toEntity() {
    return TipoIrregularidade(
      cdTipoIrregularidade: cdTipoIrregularidade,
      dsTipoIrregularidade: dsTipoIrregularidade,
    );
  }

}