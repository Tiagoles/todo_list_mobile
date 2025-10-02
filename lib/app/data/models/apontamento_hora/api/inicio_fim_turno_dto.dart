import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';

part 'inicio_fim_turno_dto.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class InicioFimTurnoDto{

  final int cdEletricista;
  final DateTime dtHrApontamento;
  final double vlCoordenadaXApontamento;
  final double vlCoordenadaYApontamento;
  final int idOrigem;
  final int idInicioTerminoTurno;

  InicioFimTurnoDto({
    required this.cdEletricista,
    required this.dtHrApontamento,
    required this.vlCoordenadaXApontamento,
    required this.vlCoordenadaYApontamento,
    required this.idOrigem,
    required this.idInicioTerminoTurno
  });

  Map<String, dynamic> toJson() => _$InicioFimTurnoDtoToJson(this);

  InicioFimTurnoDto fromEntity(ApontamentoHoraTurno apontamento){
    return InicioFimTurnoDto(
      cdEletricista: apontamento.cdEletricista,
      dtHrApontamento: apontamento.dtHrApontamento,
      vlCoordenadaXApontamento: apontamento.vlCoordenadaXApontamento,
      vlCoordenadaYApontamento: apontamento.vlCoordenadaYApontamento,
      idInicioTerminoTurno: apontamento.idInicioTermino,
      idOrigem: apontamento.origem.id
    );
  }

}