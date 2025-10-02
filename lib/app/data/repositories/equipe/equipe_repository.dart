import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/equipe/equipe_client.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:smaservicos/app/domain/models/equipe/equipe_lov/equipe_lov.dart';

class EquipeRepository{

  final EquipeClient _client;

  EquipeRepository(this._client);

  AsyncResult<User> login(Credentials credencials){
    return _client.login(credencials)
        .map((r) => r.toUser());
  }

  AsyncResult<List<EquipeLov>> findLov(String? filter) async {
    return _client.findLov(filter);
  }

}