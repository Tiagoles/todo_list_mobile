import 'package:json_annotation/json_annotation.dart';

part 'motivo_retorno_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class MotivoRetornoDTO{

  final int nrInspecao;
  final int cdTipoOcorrencia;
  final String? dsObservacao;

  const MotivoRetornoDTO({
    required this.nrInspecao,
    required this.cdTipoOcorrencia,
    this.dsObservacao,
  });

  factory MotivoRetornoDTO.fromJson(Map<String, dynamic> json) =>
      _$MotivoRetornoDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MotivoRetornoDTOToJson(this);

}