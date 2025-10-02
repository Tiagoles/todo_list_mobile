// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_servico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventoServico _$EventoServicoFromJson(Map<String, dynamic> json) =>
    EventoServico(
      cdEvento: (json['cdEvento'] as num).toInt(),
      dsEvento: json['dsEvento'] as String?,
      cdTipoEvento: (json['cdTipoEvento'] as num?)?.toDouble(),
      idUsuario: json['idUsuario'] as String?,
      flAtivoInativo: json['flAtivoInativo'] as String?,
    );
