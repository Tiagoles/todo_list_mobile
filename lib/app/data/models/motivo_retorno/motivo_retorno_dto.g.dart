// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivo_retorno_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotivoRetornoDTO _$MotivoRetornoDTOFromJson(Map<String, dynamic> json) =>
    MotivoRetornoDTO(
      nrInspecao: (json['nrInspecao'] as num).toInt(),
      cdTipoOcorrencia: (json['cdTipoOcorrencia'] as num).toInt(),
      dsObservacao: json['dsObservacao'] as String?,
    );

Map<String, dynamic> _$MotivoRetornoDTOToJson(MotivoRetornoDTO instance) =>
    <String, dynamic>{
      'nrInspecao': instance.nrInspecao,
      'cdTipoOcorrencia': instance.cdTipoOcorrencia,
      'dsObservacao': ?instance.dsObservacao,
    };
