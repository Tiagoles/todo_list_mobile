import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/configs/modules/acao_tomada_module.dart';
import 'package:smaservicos/app/configs/modules/anexo_module.dart';
import 'package:smaservicos/app/configs/modules/auth_module.dart';
import 'package:smaservicos/app/configs/modules/config_module.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/inspecao_item_module.dart';
import 'package:smaservicos/app/configs/modules/tipo_irregularidade_module.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_remote_repository.dart';
import 'package:smaservicos/app/data/services/inspecao/inspecao_client.dart';
import 'package:smaservicos/app/data/services/inspecao/inspecao_database_service.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/concluir_inspecao_api.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/remover_inspecao_anexos.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/remover_inspecao_local.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/retornar_inspecao_api.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/salvar_inspecao_anexos.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/salvar_inspecao_conclusao_local.dart';
import 'package:smaservicos/app/ui/inspecao/guards/inspecao_form_items_guard.dart';
import 'package:smaservicos/app/ui/inspecao/guards/inspecao_guard.dart';
import 'package:smaservicos/app/ui/inspecao/guards/inspection_has_already_started_guard.dart';
import 'package:smaservicos/app/ui/inspecao/inspecao_form_page.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_form_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/needs_release_notification_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/completing/inspecao_completing_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/from_remote/inspecao_from_remote_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/inspecao_lancamentos_page.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/returning/inspecao_returning_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/sync_viewmodels/started/inspecao_started_viewmodel.dart';
import 'package:smaservicos/app/utils/functions.dart';

class InspecaoModule extends Module {
  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule(),
    ConfigModule(),
    InspecaoItemModule(),
    TipoIrregularidadeModule(),
    AcaoTomadaModule(),
    AnexoModule()
  ];

  @override
  void binds(Injector i) {
    i.add(() => InspecaoClient(i.get(key: 'auth_client')));
    i.add(InspecaoDatabaseService.new);
    i.addSingleton(InspecaoRemoteRepository.new);
    i.addSingleton(InspecaoLocalRepository.new);
    i.add(SalvarInspecaoConclusaoLocal.new);
    i.add(RemoverInspecaoAnexos.new);
    i.add(SalvarInspecaoAnexos.new);
    i.add(RemoverInspecaoLocal.new);
    i.add(ConcluirInspecaoApi.new);
    i.add(RetornarInspecaoApi.new);
    i.add<InspecaoFormViewModel>(InspecaoFormViewModel.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(InspecaoCompletingViewModel.new);
    i.addSingleton(InspecaoFromRemoteViewModel.new);
    i.addSingleton(InspecaoStartedViewModel.new);
    i.addSingleton(InspecaoReturningViewModel.new);
    i.addSingleton(InspecaoViewModel.new);
    i.addSingleton(NeedsReleaseNotificationViewModel.new);
  }

  @override
  void routes(RouteManager r) {

    r.child('/:id', child: (_) => InspecaoFormPage(
      viewModel: Modular.get(),
      inspecaoId: toInt(r.args.params['id']) ?? 0,
    ),
      guards: [InspecaoFormItemsGuard(), InspecaoNotFoundGuard(), InspectionHasAlreadyStartedGuard()],
      transition: TransitionType.rightToLeft,
    );

    r.child('/lancamentos', child: (_) => InspecaoLancamentosPage(
      viewModel: Modular.get(),
    ), transition: TransitionType.rightToLeft);

  }
}
