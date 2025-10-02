// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspecao_anexo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspecaoAnexo _$InspecaoAnexoFromJson(Map<String, dynamic> json) =>
    InspecaoAnexo(
      id: (json['id'] as num?)?.toInt(),
      anexo: Anexo.fromJson(json['anexo'] as Map<String, dynamic>),
      idConclusao: (json['idConclusao'] as num).toInt(),
    );
