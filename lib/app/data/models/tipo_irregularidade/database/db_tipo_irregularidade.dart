import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';

@Entity()
class DbTipoIrregularidade {
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  int cdTipoIrregularidade;
  String dsTipoIrregularidade;

  DbTipoIrregularidade({
    this.id = 0,
    required this.cdTipoIrregularidade,
    required this.dsTipoIrregularidade,
  });

  factory DbTipoIrregularidade.fromEntity(TipoIrregularidade item, {int? id}) {
    return DbTipoIrregularidade(
      id: id ?? 0,
      cdTipoIrregularidade: item.cdTipoIrregularidade.toInt(),
      dsTipoIrregularidade: item.dsTipoIrregularidade,
    );
  }

  TipoIrregularidade toEntity() {
    return TipoIrregularidade(
      cdTipoIrregularidade: cdTipoIrregularidade,
      dsTipoIrregularidade: dsTipoIrregularidade,
    );
  }

}