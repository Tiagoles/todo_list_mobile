import 'package:objectbox/objectbox.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/evento_servico/database/db_evento_servico.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';
import 'package:smaservicos/app/domain/enums/apontamento_hora/inicio_termino_evento.dart';
import 'package:smaservicos/app/domain/enums/apontamento_hora/origem_atualizacao.dart';

@Entity()
class DbApontamentoHora{
  int id;
  int cdEletricista;
  int? idSequencia;
  @Property(type: PropertyType.date)
  DateTime dtApontamento;
  @Property(type: PropertyType.date)
  DateTime? dtHoraInicioApontamento;
  final evento = ToOne<DbEventoServico>();
  double vlCoordenadaXInicioApontamento;
  double vlCoordenadaYInicioApontamento;
  double? vlCoordenadaXTerminoApontamento;
  double? vlCoordenadaYTerminoApontamento;
  int idOrigem;
  int? nrServico;
  int? cdEnvio;
  int? cdMatMembro;
  int? cdEquipe;
  int? cdUnConsumidora;
  String? dsObservacao;
  @Property(type: PropertyType.date)
  DateTime updatedAt;

  DbApontamentoHora({
    this.id = 0,
    required this.cdEletricista,
    this.idSequencia,
    required this.dtApontamento,
    this.dtHoraInicioApontamento,
    required this.vlCoordenadaXInicioApontamento,
    required this.vlCoordenadaYInicioApontamento,
    this.vlCoordenadaXTerminoApontamento,
    this.vlCoordenadaYTerminoApontamento,
    required this.idOrigem,
    this.nrServico,
    this.cdEnvio,
    this.cdMatMembro,
    this.cdEquipe,
    this.cdUnConsumidora,
    this.dsObservacao,
    DateTime? updatedAt,
  }) :  updatedAt = updatedAt ?? DateTime.now();

  Duration get duracaoApontamento{
    if(dtHoraInicioApontamento == null) return Duration.zero;
    final duracao = dtApontamento.difference(dtHoraInicioApontamento!) ;
    return duracao.isNegative ? Duration.zero : duracao;
  }

  Result<ApontamentoHora> toEntity(){
    if(evento.target == null) return Failure(LocalDatabaseException('Evento do apontamento não carregado'));
    final cdEvento = evento.target!.cdEvento;
    if([53,54].contains(cdEvento)) {
      return Success(ApontamentoHoraTurno(
        cdEletricista: cdEletricista,
        dtHrApontamento: dtApontamento,
        idInicioTermino: cdEvento == 53 ? InicioTerminoEvento.inicio.index : InicioTerminoEvento.termino.index,
        origem: OrigemAtualizacao.fromId(idOrigem),
        vlCoordenadaXApontamento: vlCoordenadaXInicioApontamento,
        vlCoordenadaYApontamento: vlCoordenadaYInicioApontamento,
        dsObservacao: dsObservacao,
      ));
    }
    return Success(ApontamentoHoraEvento(
      cdEletricista: cdEletricista,
      dtHrApontamento: dtApontamento,
      cdEvento: cdEvento,
      idInicioTermino: idSequencia != null ? InicioTerminoEvento.termino.index : InicioTerminoEvento.inicio.index,
      idSequencia: idSequencia,
      origem: OrigemAtualizacao.fromId(idOrigem),
      nrServico: nrServico,
      cdUnConsumidora: cdUnConsumidora,
      dsObservacao: dsObservacao,
      vlCoordenadaXApontamento: idSequencia != null ? (vlCoordenadaXTerminoApontamento ?? vlCoordenadaXInicioApontamento) : vlCoordenadaXInicioApontamento,
      vlCoordenadaYApontamento: idSequencia != null ? (vlCoordenadaYTerminoApontamento ?? vlCoordenadaYInicioApontamento) : vlCoordenadaYInicioApontamento,
    ));
  }

}