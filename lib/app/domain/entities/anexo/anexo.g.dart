// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anexo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anexo _$AnexoFromJson(Map<String, dynamic> json) => Anexo(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  path: json['path'] as String,
  type: json['type'] as String,
  size: (json['size'] as num).toInt(),
  geolocation: json['geolocation'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);
