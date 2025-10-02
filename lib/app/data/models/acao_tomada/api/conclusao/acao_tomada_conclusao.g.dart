// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acao_tomada_conclusao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcaoTomadaConclusao _$AcaoTomadaConclusaoFromJson(Map<String, dynamic> json) =>
    AcaoTomadaConclusao(
      cdAcaoTomada: (json['cdAcaoTomada'] as num).toInt(),
      dtEfetivacao: json['dtEfetivacao'] == null
          ? null
          : DateTime.parse(json['dtEfetivacao'] as String),
      dsObservacao: json['dsObservacao'] as String?,
    );

Map<String, dynamic> _$AcaoTomadaConclusaoToJson(
  AcaoTomadaConclusao instance,
) => <String, dynamic>{
  'cdAcaoTomada': instance.cdAcaoTomada,
  'dtEfetivacao': instance.dtEfetivacao?.toIso8601String(),
  'dsObservacao': instance.dsObservacao,
};
