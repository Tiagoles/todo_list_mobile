import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/data/models/acao_tomada/api/conclusao/acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/acao_tomada/database/db_acao_tomada.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';

@Entity()
class DbAcaoTomadaConclusao{
  int id;
  final acaoTomada = ToOne<DbAcaoTomada>();
  final inspecao = ToOne<DbInspecaoConclusao>();
  @Property(type: PropertyType.date)
  DateTime? dtEfetivacao;
  String? dsObservacao;

  DbAcaoTomadaConclusao({
    this.id = 0,
    this.dtEfetivacao,
    this.dsObservacao,
  });

  AcaoTomadaConclusao toEntity(){
    final entity = acaoTomada.target!;
    return AcaoTomadaConclusao(
      cdAcaoTomada: entity.cdAcaoTomada,
      dsObservacao: dsObservacao,
      dtEfetivacao: dtEfetivacao,
    );
  }

}