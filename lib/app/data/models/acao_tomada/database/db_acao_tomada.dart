import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/domain/entities/acao_tomada/acao_tomada.dart';

@Entity()
class DbAcaoTomada {
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  int cdAcaoTomada;
  String dsAcaoTomada;

  DbAcaoTomada({
    this.id = 0,
    required this.cdAcaoTomada,
    required this.dsAcaoTomada,
  });

  factory DbAcaoTomada.fromEntity(AcaoTomada item, {int? id}) {
    return DbAcaoTomada(
      id: id ?? 0,
      cdAcaoTomada: item.cdAcaoTomada.toInt(),
      dsAcaoTomada: item.dsAcaoTomada,
    );
  }

  AcaoTomada toEntity() {
    return AcaoTomada(
      cdAcaoTomada: cdAcaoTomada,
      dsAcaoTomada: dsAcaoTomada,
    );
  }

}