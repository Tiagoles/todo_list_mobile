import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/eletricista/eletricista_client.dart';
import 'package:smaservicos/app/domain/entities/auth/user/user.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:smaservicos/app/domain/models/eletricista/eletricista_lov/eletricista_lov.dart';

class EletricistaRepository{

  final EletricistaClient _client;

  EletricistaRepository(this._client);

  AsyncResult<User> login(Credentials credencials){
    return _client.login(credencials)
        .map((r) => r.toUser());
  }

  AsyncResult<List<EletricistaLov>> findLov(String? filter) async {
    return _client.findLov(filter);
  }

}