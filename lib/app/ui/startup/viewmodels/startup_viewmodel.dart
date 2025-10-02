import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/acao_tomada/acao_tomada_repository.dart';
import 'package:smaservicos/app/data/repositories/evento_servico/evento_servico_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao_item/inspecao_item_repository.dart';
import 'package:smaservicos/app/data/repositories/tipo_irregularidade/tipo_irregularidade_repository.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/needs_release_notification_viewmodel.dart';
import 'package:smaservicos/app/utils/command.dart';

class StartupViewModel implements Disposable {

  final InspecaoItemRepository _inspecaoItemRepository;
  final TipoIrregularidadeRepository _tipoIrregularidadeRepository;
  final AcaoTomadaRepository _acaoTomadaRepository;
  final InspecaoLocalRepository _inspecaoLocalRepository;
  final EventoServicoRepository _eventoServicoRepository;
  final InspecaoViewModel _inspecaoViewModel;
  final NeedsReleaseNotificationViewModel _notificationViewModel;

  late final Command0<Unit> loadCommand;

  StartupViewModel(
    this._inspecaoItemRepository,
    this._tipoIrregularidadeRepository,
    this._acaoTomadaRepository,
    this._inspecaoLocalRepository,
    this._eventoServicoRepository,
    this._inspecaoViewModel,
    this._notificationViewModel,
  ) {
    loadCommand = Command0(_loadFeatures);
    loadCommand.execute();
  }

  @override
  void dispose() {
    loadCommand.dispose();
  }

  AsyncResult<Unit> _loadFeatures() async {
    return _inspecaoItemRepository.sync()
        .flatMap((_) => _tipoIrregularidadeRepository.sync())
        .flatMap((_) => _acaoTomadaRepository.sync())
        .flatMap((_) => _inspecaoLocalRepository.getAll())
        .flatMap((_) => _eventoServicoRepository.sync())
        .onSuccess((_) => _inspecaoViewModel.syncAllCommand.execute())
        .onSuccess((_) => _notificationViewModel.init())
        .pure(unit);
  }

}