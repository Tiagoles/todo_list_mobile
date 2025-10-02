import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/equipe/equipe_repository.dart';
import 'package:smaservicos/app/domain/entities/core/lov_entity.dart';

class EquipeLovViewModel{

  final EquipeRepository _repository;

  EquipeLovViewModel(this._repository);

  AsyncResult<List<LovEntity>> findLov(String? filter) async {
    return _repository.findLov(filter)
      .map((r) => r
        .map((e) => LovEntity(
            value: e.cdEquipe,
            dataList: e.semanticMap,
            fieldText: e.textField
        )).toList()
      );
  }

}