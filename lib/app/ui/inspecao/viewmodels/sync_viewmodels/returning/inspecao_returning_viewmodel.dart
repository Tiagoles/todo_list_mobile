import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/retornar_inspecao_api.dart';
import 'package:smaservicos/app/ui/core/viewmodels/sync_viewmodel.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

part 'inspecao_returning_viewmodel.g.dart';

class InspecaoReturningViewModel = InspecaoReturningViewModelBase with _$InspecaoReturningViewModel;

abstract class InspecaoReturningViewModelBase with Store implements Disposable {
  final InspecaoLocalRepository _localRepository;
  late final Command0<Unit> syncCommand;
  late final ReactionDisposer _disposer;
  late final StreamSubscription<List<Inspecao>> _subscription;
  final RetornarInspecaoApi _retornarInspecaoApi;

  InspecaoReturningViewModelBase(
      this._localRepository,
      this._retornarInspecaoApi,
  ){
    syncCommand = Command0(syncAll);
    _subscription = _localRepository.watch(SyncStatus.returning).listen((list) =>
      models = ObservableList.of(list.map((e) => SyncViewModel(model: e, isLoading: false)).toList()),
    );
    _disposer = reaction<int>((_) => models.length, (length) {
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
    return _retornarInspecaoApi(syncModel.model)
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
