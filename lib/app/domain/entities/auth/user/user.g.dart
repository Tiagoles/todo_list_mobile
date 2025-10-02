// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotLoggedUser _$NotLoggedUserFromJson(Map<String, dynamic> json) =>
    NotLoggedUser(
      usuario: json['usuario'] as String? ?? '',
      nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$NotLoggedUserToJson(NotLoggedUser instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'nmUsuario': instance.nmUsuario,
      'runtimeType': instance.$type,
    };

LoggedUser _$LoggedUserFromJson(Map<String, dynamic> json) => LoggedUser(
  usuario: json['usuario'] as String,
  nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
  token: json['token'] as String,
  empresa: (json['empresa'] as num?)?.toDouble() ?? Constants.empresa,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoggedUserToJson(LoggedUser instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'nmUsuario': instance.nmUsuario,
      'token': instance.token,
      'empresa': instance.empresa,
      'runtimeType': instance.$type,
    };

NotLoggedEletricista _$NotLoggedEletricistaFromJson(
  Map<String, dynamic> json,
) => NotLoggedEletricista(
  usuario: json['usuario'] as String? ?? '',
  nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
  escritorio: (json['escritorio'] as num?)?.toDouble(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$NotLoggedEletricistaToJson(
  NotLoggedEletricista instance,
) => <String, dynamic>{
  'usuario': instance.usuario,
  'nmUsuario': instance.nmUsuario,
  'escritorio': instance.escritorio,
  'runtimeType': instance.$type,
};

LoggedEletricista _$LoggedEletricistaFromJson(Map<String, dynamic> json) =>
    LoggedEletricista(
      usuario: json['usuario'] as String,
      nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
      escritorio: (json['escritorio'] as num).toDouble(),
      token: json['token'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LoggedEletricistaToJson(LoggedEletricista instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'nmUsuario': instance.nmUsuario,
      'escritorio': instance.escritorio,
      'token': instance.token,
      'runtimeType': instance.$type,
    };

NotLoggedEquipe _$NotLoggedEquipeFromJson(Map<String, dynamic> json) =>
    NotLoggedEquipe(
      usuario: json['usuario'] as String? ?? '',
      nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
      empresa: (json['empresa'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$NotLoggedEquipeToJson(NotLoggedEquipe instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'nmUsuario': instance.nmUsuario,
      'empresa': instance.empresa,
      'runtimeType': instance.$type,
    };

LoggedEquipe _$LoggedEquipeFromJson(Map<String, dynamic> json) => LoggedEquipe(
  usuario: json['usuario'] as String,
  nmUsuario: json['nmUsuario'] as String? ?? 'Usuário',
  empresa: (json['empresa'] as num).toDouble(),
  token: json['token'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoggedEquipeToJson(LoggedEquipe instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'nmUsuario': instance.nmUsuario,
      'empresa': instance.empresa,
      'token': instance.token,
      'runtimeType': instance.$type,
    };
