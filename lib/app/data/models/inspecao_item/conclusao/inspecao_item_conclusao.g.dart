// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspecao_item_conclusao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspecaoItemConclusao _$InspecaoItemConclusaoFromJson(
  Map<String, dynamic> json,
) => InspecaoItemConclusao(
  (json['cdItemInspecionado'] as num).toInt(),
  (json['flProcedenteImprocedente'] as num).toInt(),
);

Map<String, dynamic> _$InspecaoItemConclusaoToJson(
  InspecaoItemConclusao instance,
) => <String, dynamic>{
  'cdItemInspecionado': instance.cdItemInspecionado,
  'flProcedenteImprocedente': instance.flProcedenteImprocedente,
};
