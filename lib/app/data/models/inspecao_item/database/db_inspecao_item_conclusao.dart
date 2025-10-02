import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/conclusao/inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/database/db_inspecao_item.dart';

@Entity()
class DbInspecaoItemConclusao {
  int id;
  final inspecaoItem = ToOne<DbInspecaoItem>();
  final inspecao = ToOne<DbInspecaoConclusao>();
  int flProcedenteImprocedente;

  DbInspecaoItemConclusao({
    this.id = 0,
    required this.flProcedenteImprocedente
  });

  InspecaoItemConclusao toEntity(){
    final item = inspecaoItem.target!;
    return InspecaoItemConclusao(item.cdItemInspecionado.toInt(), flProcedenteImprocedente);
  }

}