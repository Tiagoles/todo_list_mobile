import 'package:freezed_annotation/freezed_annotation.dart';

part 'acao_tomada_conclusao.g.dart';

@JsonSerializable()
class AcaoTomadaConclusao{
  final int cdAcaoTomada;
  final DateTime? dtEfetivacao;
  final String? dsObservacao;

  AcaoTomadaConclusao({
    required this.cdAcaoTomada,
    this.dtEfetivacao,
    this.dsObservacao,
  });

  factory AcaoTomadaConclusao.fromJson(Map<String, dynamic> json) =>
      _$AcaoTomadaConclusaoFromJson(json);

  Map<String, dynamic> toJson() => _$AcaoTomadaConclusaoToJson(this);

}