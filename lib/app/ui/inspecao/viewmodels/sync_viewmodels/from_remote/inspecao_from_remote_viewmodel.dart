import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/repositories/config/config_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_remote_repository.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/domain/exceptions/business_rule_exception.dart';
import 'package:smaservicos/app/ui/core/viewmodels/sync_viewmodel.dart';
import 'package:smaservicos/app/utils/command.dart';

part 'inspecao_from_remote_viewmodel.g.dart';

class InspecaoFromRemoteViewModel = InspecaoFromRemoteViewModelBase with _$InspecaoFromRemoteViewModel;

abstract class InspecaoFromRemoteViewModelBase with Store implements Disposable {
  final InspecaoRemoteRepository _remoteRepository;
  final InspecaoLocalRepository _localRepository;
  final ConnectivityService _connectivityService;
  final ConfigRepository _configRepository;
  late final StreamSubscription<List<Inspecao>> _subscription;
  late final Command0<List<Inspecao>> syncCommand;

  InspecaoFromRemoteViewModelBase(
    this._remoteRepository,
    this._localRepository,
    this._connectivityService,
    this._configRepository
  ){
    syncCommand = Command0(sync);
    _subscription = _localRepository.watch(SyncStatus.fromRemote).listen((list) =>
      models = ObservableList.of(list.map((e) =>
        SyncViewModel<Inspecao>(model: e, isLoading: false)).toList()
      )
    );
  }

  @observable
  ObservableList<SyncViewModel<Inspecao>> models = ObservableList.of([]);

  AsyncResult<List<Inspecao>> sync() async {
    return _connectivityService.isConnected().flatMap((isConnected) async {
      if (isConnected) {
        final nrPda = (await _configRepository.configsObserver.first).numeroPda;
        return _remoteRepository.getAll(nrPda).flatMap(_setAsReceivedAndSave);
      }
      return Failure(AppSocketException());
    });
  }

  AsyncResult<Inspecao> _save(Inspecao inspecao) async {
    final result = await _localRepository.getByNrInspecao(inspecao.nrInspecao.toInt()).getOrNull();
    if([null, SyncStatus.fromRemote.code].contains(result?.status)) return _localRepository.save(inspecao);
    return Failure(BusinessRuleException('Inspeção já está em andamento.'));
  }

  AsyncResult<List<Inspecao>> _setAsReceivedAndSave(List<Inspecao> inspecoes) async {
    for (var inspecao in inspecoes) {
      if (inspecao.flCarregadoPda.toUpperCase() == 'N') {
        await _remoteRepository.setAsReceived(inspecao.nrInspecao)
          .onSuccess((_) => _save(inspecao));
        continue;
      }
      await _save(inspecao);
    }
    return Success(inspecoes);
  }

  @override
  void dispose() {
    _subscription.cancel();
  }

}
