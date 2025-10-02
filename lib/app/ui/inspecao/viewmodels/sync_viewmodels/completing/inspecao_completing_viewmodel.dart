import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/concluir_inspecao_api.dart';
import 'package:smaservicos/app/ui/core/viewmodels/sync_viewmodel.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

part 'inspecao_completing_viewmodel.g.dart';

class InspecaoCompletingViewModel = InspecaoCompletingViewModelBase with _$InspecaoCompletingViewModel;

abstract class InspecaoCompletingViewModelBase with Store implements Disposable {
  final InspecaoLocalRepository _localRepository;
  final ConnectivityService _connectivityService;
  final ConcluirInspecaoApi _concluirInspecaoApi;
  late final Command0<Unit> syncCommand;
  late final ReactionDisposer _disposer;
  late final StreamSubscription<List<Inspecao>> _subscription;

  InspecaoCompletingViewModelBase(
    this._localRepository,
    this._connectivityService,
    this._concluirInspecaoApi,
  ){
    syncCommand = Command0(syncAll);
    _subscription = _localRepository.watch(SyncStatus.completing, true).listen((list) =>
      models = ObservableList.of(list.map((e) => SyncViewModel(model: e, isLoading: false)).toList()),
    );
    _disposer = reaction<int>((_) => models.length,
(length) {
        if (length > 0) syncCommand.execute();
      },
    );
  }

  @observable
  ObservableList<SyncViewModel<Inspecao>> models = ObservableList.of([]);

  AsyncResult<Unit> syncAll()async{
    models.forEach(sync);
    return const Success(unit);
  }

  AsyncResult<Unit> sync(SyncViewModel<Inspecao> syncModel) async {
    syncModel.isLoading = true;
    final isConnected = await _connectivityService.isConnected().getOrDefault(false);
    if(!isConnected) syncModel.error = AppSocketException().message;
    return _concluirInspecaoApi(syncModel.model.id!)
      .onFailure((f){
        syncModel.error = f.message;
        syncModel.isLoading = false;
      });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _disposer();
  }

}
