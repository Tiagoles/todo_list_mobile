import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/config/config_repository.dart';
import 'package:smaservicos/app/domain/entities/config/config_entity.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/completing/inspecao_completing_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/from_remote/inspecao_from_remote_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/returning/inspecao_returning_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/started/inspecao_started_viewmodel.dart';
import 'package:smaservicos/app/utils/command.dart';

class InspecaoViewModel implements Disposable{

  final ConfigRepository _configRepository;
  final InspecaoFromRemoteViewModel fromRemoteViewModel;
  final InspecaoCompletingViewModel completingViewModel;
  final InspecaoStartedViewModel startedViewModel;
  final InspecaoReturningViewModel returningViewModel;
  late final StreamSubscription<Configs> _configsObserver;
  Configs configs = const Configs();
  late final Command0<Unit> syncAllCommand;
  late final Command0<Unit> syncAllReleasesCommand;

  InspecaoViewModel(
    this._configRepository,
    this.fromRemoteViewModel,
    this.completingViewModel,
    this.startedViewModel,
    this.returningViewModel,
  ){
    syncAllCommand = Command0(_syncAll);
    syncAllReleasesCommand = Command0(_syncReleases);
    _configsObserver = _configRepository.configsObserver.listen(resyncIfNrPdaChanged);
  }

  @computed
  int get countReleases => completingViewModel.models.length + startedViewModel.models.length + returningViewModel.models.length;

  AsyncResult<Unit> _syncReleases() async {
    await completingViewModel.syncCommand.execute();
    await returningViewModel.syncCommand.execute();
    return const Success(unit);
  }

  AsyncResult<Unit> _syncAll() async {
    await fromRemoteViewModel.syncCommand.execute();
    await returningViewModel.syncCommand.execute();
    await completingViewModel.syncCommand.execute();
    return const Success(unit);
  }

  void resyncIfNrPdaChanged(Configs configs){
    if(this.configs.numeroPda != null && configs.numeroPda != null && this.configs.numeroPda != configs.numeroPda){
      syncAllCommand.execute();
    }
    this.configs = configs;
  }

  @override
  void dispose() {
    _configsObserver.cancel();
  }

}