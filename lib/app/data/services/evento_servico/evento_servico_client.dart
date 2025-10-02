import 'dart:isolate';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';

class EventoServicoClient{

  final ClientHttp _client;
  EventoServicoClient(this._client);

  AsyncResult<List<EventoServico>> getAll() async {
    final result = await _client.get('/eventos-servicos');
    return Isolate.run(
          () => result.map(
            (resp) =>
            (resp.data as List).map((e) => EventoServico.fromJson(e)).toList(),
      ),
    );
  }

}