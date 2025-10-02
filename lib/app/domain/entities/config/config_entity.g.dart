// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Configs _$ConfigsFromJson(Map<String, dynamic> json) => _Configs(
  numeroPda: (json['numeroPda'] as num?)?.toInt(),
  timer: (json['timer'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$ConfigsToJson(_Configs instance) => <String, dynamic>{
  'numeroPda': instance.numeroPda,
  'timer': instance.timer,
};
