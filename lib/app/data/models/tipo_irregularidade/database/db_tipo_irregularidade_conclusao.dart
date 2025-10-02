import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/api/conclusao/tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/database/db_tipo_irregularidade.dart';

@Entity()
class DbTipoIrregularidadeConclusao{
  int id;
  final tipoIrregularidade = ToOne<DbTipoIrregularidade>();
  final inspecao = ToOne<DbInspecaoConclusao>();
  String? dsObservacao;

  DbTipoIrregularidadeConclusao({
    this.id = 0,
    this.dsObservacao,
  });

  TipoIrregularidadeConclusao toEntity(){
    final entity = tipoIrregularidade.target!;
    return TipoIrregularidadeConclusao(entity.cdTipoIrregularidade.toInt(), dsObservacao);
  }

}