import 'package:freezed_annotation/freezed_annotation.dart';

part 'tipo_irregularidade_conclusao.g.dart';

@JsonSerializable()
class TipoIrregularidadeConclusao {
  final int cdTipoIrregularidade;
  final String? dsObservacao;

  TipoIrregularidadeConclusao(this.cdTipoIrregularidade, this.dsObservacao);

  factory TipoIrregularidadeConclusao.fromJson(Map<String, dynamic> json) =>
      _$TipoIrregularidadeConclusaoFromJson(json);

  Map<String, dynamic> toJson() => _$TipoIrregularidadeConclusaoToJson(this);

}