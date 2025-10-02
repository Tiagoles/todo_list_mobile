import 'package:freezed_annotation/freezed_annotation.dart';

part 'evento_servico.g.dart';

@JsonSerializable(createToJson: false)
class EventoServico {
    final int cdEvento;
    final String? dsEvento;
    final double? cdTipoEvento;
    final String? idUsuario;
    final String? flAtivoInativo;

    EventoServico({
      required this.cdEvento,
      this.dsEvento,
      this.cdTipoEvento,
      this.idUsuario,
      this.flAtivoInativo,
    });

    factory EventoServico.fromJson(Map<String, dynamic> json) => _$EventoServicoFromJson(json);

  }