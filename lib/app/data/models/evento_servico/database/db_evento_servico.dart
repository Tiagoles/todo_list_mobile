import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';

@Entity()
class DbEventoServico{

  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  int cdEvento;
  String? dsEvento;
  double? cdTipoEvento;
  String? idUsuario;
  String? flAtivoInativo;

  DbEventoServico({
    this.id = 0,
    required this.cdEvento,
    this.dsEvento,
    this.cdTipoEvento,
    this.idUsuario,
    this.flAtivoInativo,
  });

  factory DbEventoServico.fromEntity(EventoServico item, {int? id}) {
    return DbEventoServico(
      id: id ?? 0,
      cdEvento: item.cdEvento.toInt(),
      dsEvento: item.dsEvento,
      cdTipoEvento: item.cdTipoEvento,
      idUsuario: item.idUsuario,
      flAtivoInativo: item.flAtivoInativo,
    );
  }

  EventoServico toEntity() {
    return EventoServico(
      cdEvento: cdEvento,
      dsEvento: dsEvento,
      cdTipoEvento: cdTipoEvento,
      idUsuario: idUsuario,
      flAtivoInativo: flAtivoInativo,
    );
  }

}