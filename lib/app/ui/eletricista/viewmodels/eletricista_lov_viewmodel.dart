import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/eletricista/eletricista_repository.dart';
import 'package:smaservicos/app/domain/entities/core/lov_entity.dart';

class EletricistaLovViewModel{

  final EletricistaRepository _repository;

  EletricistaLovViewModel(this._repository);

  AsyncResult<List<LovEntity>> findLov(String? filter) async {
    return _repository.findLov(filter)
      .map((r) => r
        .map((e) => LovEntity(
          value: e.cdEletricista,
          dataList: e.semanticMap,
          fieldText: e.textField
        )).toList()
      );
  }

}