import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';
import 'package:smaservicos/app/domain/enums/apontamento_hora/origem_atualizacao.dart';

part 'apontamento_hora.freezed.dart';

@freezed
sealed class ApontamentoHora with _$ApontamentoHora {

  const ApontamentoHora._();

  const factory ApontamentoHora.apontamentoCompleto({
    @Default(0) int id,
    required int cdEletricista,
    int? idSequencia,
    required DateTime dtApontamento,
    DateTime? dtHoraInicioApontamento,
    required EventoServico evento,
    required double vlCoordenadaXInicioApontamento,
    required double vlCoordenadaYInicioApontamento,
    double? vlCoordenadaXTerminoApontamento,
    double? vlCoordenadaYTerminoApontamento,
    required int idOrigem,
    int? nrServico,
    int? cdEnvio,
    int? cdMatMembro,
    int? cdEquipe,
    int? cdUnConsumidora,
    String? dsObservacao,
    DateTime? updatedAt,
  }) = ApontamentoCompleto;

  const factory ApontamentoHora.apontamentoHoraEvento({
    required int cdEletricista,
    int? idSequencia,
    required DateTime dtHrApontamento,
    required double vlCoordenadaXApontamento,
    required double vlCoordenadaYApontamento,
    required int cdEvento,
    required OrigemAtualizacao origem,
    int? nrServico,
    int? cdUnConsumidora,
    required int idInicioTermino,
    String? dsObservacao
  }) = ApontamentoHoraEvento;

  const factory ApontamentoHora.apontamentoHoraTurno({
    required int cdEletricista,
    required DateTime dtHrApontamento,
    required double vlCoordenadaXApontamento,
    required double vlCoordenadaYApontamento,
    required OrigemAtualizacao origem,
    required int idInicioTermino,
    String? dsObservacao
  }) = ApontamentoHoraTurno;

  Duration get duration{
    if(this is! ApontamentoCompleto) return Duration.zero;
    final apontamento = this as ApontamentoCompleto;
    final start = apontamento.dtHoraInicioApontamento ?? apontamento.dtApontamento;
    final end = apontamento.dtHoraInicioApontamento != null ? apontamento.dtApontamento : DateTime.now();
    return end.difference(start);
  }

}