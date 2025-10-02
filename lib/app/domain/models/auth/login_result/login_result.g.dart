// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
  nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
  token: json['token'] as String,
);

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{'nmUsuario': instance.nmUsuario, 'token': instance.token};
