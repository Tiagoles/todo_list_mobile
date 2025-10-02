// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_irregularidade_conclusao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoIrregularidadeConclusao _$TipoIrregularidadeConclusaoFromJson(
  Map<String, dynamic> json,
) => TipoIrregularidadeConclusao(
  (json['cdTipoIrregularidade'] as num).toInt(),
  json['dsObservacao'] as String?,
);

Map<String, dynamic> _$TipoIrregularidadeConclusaoToJson(
  TipoIrregularidadeConclusao instance,
) => <String, dynamic>{
  'cdTipoIrregularidade': instance.cdTipoIrregularidade,
  'dsObservacao': instance.dsObservacao,
};
