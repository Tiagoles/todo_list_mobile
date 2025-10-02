// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipe_login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipeLoginResult _$EquipeLoginResultFromJson(Map<String, dynamic> json) =>
    EquipeLoginResult(
      equipe: (json['equipe'] as num).toDouble(),
      nome: json['nome'] as String,
      empresa: (json['empresa'] as num).toDouble(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$EquipeLoginResultToJson(EquipeLoginResult instance) =>
    <String, dynamic>{
      'equipe': instance.equipe,
      'nome': instance.nome,
      'empresa': instance.empresa,
      'token': instance.token,
    };
