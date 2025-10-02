import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/ui/core/viewmodels/sync_viewmodel.dart';

part 'inspecao_started_viewmodel.g.dart';

class InspecaoStartedViewModel = InspecaoStartedViewModelBase with _$InspecaoStartedViewModel;

abstract class InspecaoStartedViewModelBase with Store implements Disposable{

  final InspecaoLocalRepository _localRepository;

  late final StreamSubscription _subscription;

  InspecaoStartedViewModelBase(this._localRepository) {
    _subscription = _localRepository.watch(SyncStatus.started).listen((list) =>
        models = ObservableList.of(list.map((e) =>
            SyncViewModel<Inspecao>(model: e, isLoading: false)).toList()
        )
    );
  }

  @observable
  ObservableList<SyncViewModel<Inspecao>> models = ObservableList.of([]);

  @override
  void dispose() {
    _subscription.cancel();
  }

}