// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eletricista_login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EletricistaLoginResult _$EletricistaLoginResultFromJson(
  Map<String, dynamic> json,
) => EletricistaLoginResult(
  eletricista: (json['eletricista'] as num).toDouble(),
  nome: json['nome'] as String,
  escritorio: (json['escritorio'] as num).toDouble(),
  token: json['token'] as String,
);

Map<String, dynamic> _$EletricistaLoginResultToJson(
  EletricistaLoginResult instance,
) => <String, dynamic>{
  'eletricista': instance.eletricista,
  'nome': instance.nome,
  'escritorio': instance.escritorio,
  'token': instance.token,
};
