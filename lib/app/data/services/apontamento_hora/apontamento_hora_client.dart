import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/apontamento_hora/api/inicio_fim_turno_dto.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';

class ApontamentoHoraClient {

  final ClientHttp _clientHttp;

  ApontamentoHoraClient(this._clientHttp);

  AsyncResult<Unit> inicioFimTurno(InicioFimTurnoDto dto) async {
    return _clientHttp.post('/apontamento-hora/inicio-fim-turno', dto.toJson()).pure(unit);
  }

}