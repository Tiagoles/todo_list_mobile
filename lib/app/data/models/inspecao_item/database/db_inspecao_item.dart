import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';

@Entity()
class DbInspecaoItem {
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  int cdItemInspecionado;
  String dsItemInspecionado;

  DbInspecaoItem({
    this.id = 0,
    required this.cdItemInspecionado,
    required this.dsItemInspecionado,
  });

  factory DbInspecaoItem.fromEntity(InspecaoItem item, {int? id}) {
    return DbInspecaoItem(
      id: id ?? 0,
      cdItemInspecionado: item.cdItemInspecionado.toInt(),
      dsItemInspecionado: item.dsItemInspecionado,
    );
  }

  InspecaoItem toEntity() {
    return InspecaoItem(
      cdItemInspecionado: cdItemInspecionado,
      dsItemInspecionado: dsItemInspecionado,
    );
  }

}