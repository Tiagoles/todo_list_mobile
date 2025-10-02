import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/data/models/anexo/database/db_anexo.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_anexo.dart';

@Entity()
class DbInspecaoAnexo{
  int id;
  final inspecao = ToOne<DbInspecaoConclusao>();
  final anexo = ToOne<DbAnexo>();

  DbInspecaoAnexo([this.id = 0]);

  factory DbInspecaoAnexo.link({
    int id = 0,
    required DbAnexo anexo,
    required DbInspecaoConclusao inspecao,
  }) {
    final dbInspecaoAnexo = DbInspecaoAnexo(id);
    dbInspecaoAnexo.anexo.target = anexo;
    dbInspecaoAnexo.inspecao.target = inspecao;
    return dbInspecaoAnexo;
  }

  InspecaoAnexo? toEntity(){
    final anexo = this.anexo.target?.toEntity();
    if(anexo == null || inspecao.targetId == 0 ) return null;
    return InspecaoAnexo(anexo: anexo, idConclusao: inspecao.targetId);
  }

  File? toFile(){
    final anexo = this.anexo.target?.toEntity();
    if(anexo == null) return null;
    return File(anexo.path);
  }

}