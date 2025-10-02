import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/repositories/acao_tomada/acao_tomada_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao_item/inspecao_item_repository.dart';
import 'package:smaservicos/app/data/repositories/tipo_irregularidade/tipo_irregularidade_repository.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/domain/exceptions/app_validation_exception.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_formgroup.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/salvar_inspecao_anexos.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/salvar_inspecao_conclusao_local.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/return_button/return_form.dart';
import 'package:smaservicos/app/utils/command.dart';

class InspecaoFormViewModel implements Disposable{

  final InspecaoItemRepository _inspecaoItemRepository;
  final TipoIrregularidadeRepository _tipoIrregularidadeRepository;
  final AcaoTomadaRepository _acaoTomadaRepository;
  final InspecaoLocalRepository _localRepository;
  final SalvarInspecaoConclusaoLocal _salvarInspecaoConclusaoLocal;
  final SalvarInspecaoAnexos _salvarInspecaoAnexos;
  InspecaoFormGroup? formGroup;
  final formKey = GlobalKey<FormState>();
  late final Command1<Inspecao, int> loadInspecaoCommand;
  late final Command0<Unit> loadFormCommand;
  Inspecao? inspecao;
  late final Command0<InspecaoConclusao> saveCommand;
  late final Command0<InspecaoConclusao> concludeCommand;
  late final Command2<Unit, ReturnFormGroup, GlobalKey<FormState>> returnCommand;
  Timer? _debounceTimer;

  InspecaoFormViewModel(
    this._inspecaoItemRepository,
    this._localRepository,
    this._tipoIrregularidadeRepository,
    this._acaoTomadaRepository,
    this._salvarInspecaoConclusaoLocal,
    this._salvarInspecaoAnexos
  ){
    loadInspecaoCommand = Command1(_loadInspecao);
    loadFormCommand = Command0(_loadForm);
    saveCommand = Command0(_save);
    concludeCommand = Command0(_conclude);
    returnCommand = Command2(_return);
  }

  AsyncResult<Inspecao> _loadInspecao(int id) async {
    return _localRepository.getById(id, true).onSuccess((item) => inspecao = item);
  }

  AsyncResult<Inspecao> initInspecao(Inspecao inspecao) async {
    if(inspecao.status == SyncStatus.started.code && inspecao.conclusao?.dtInicio != null) return Success(inspecao);
    return _localRepository.save(inspecao.copyWith(status: SyncStatus.started.code)).flatMap((inspecao){
      return _salvarInspecaoConclusaoLocal(InspecaoConclusao(
          dtInicio: DateTime.now(),
          inspecao: inspecao
      )).map((conclusao)=>inspecao.copyWith(conclusao: conclusao));
    }).onSuccess((insp) => this.inspecao = insp);
  }

  AsyncResult<Unit> _loadForm() async {
    if(inspecao?.conclusao?.dtInicio == null){
      return Failure(AppValidationException('Inspeção não iniciada. Por favor, inicie a inspeção antes de continuar.'));
    }
    formGroup = InspecaoFormGroup(
      initialValue: inspecao!.conclusao!,
      validators: InspecaoValidator(),
      items: _inspecaoItemRepository.items,
      tipoIrregularidades: _tipoIrregularidadeRepository.items,
      acoesTomadas: _acaoTomadaRepository.items,
    );
    await formGroup?.fromModel(inspecao!.conclusao!);
    formGroup?.listenControls();
    formGroup?.addListener(onControlChanged);
    return const Success(unit);
  }

  void onControlChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      if (formGroup != null) {
        saveCommand.execute();
      }
    });
  }

  AsyncResult<InspecaoConclusao> _save() async {
    final conclusao = await formGroup?.toModel();
    if(conclusao == null){
      return Failure(ProcessingException('Falha ao processar o formulário. Contate o suporte.'));
    }
    return _salvarInspecaoConclusaoLocal(inspecao!.conclusao!.copyFrom(conclusao))
      .flatMap((newConclusao) => _salvarAnexos(conclusao.anexos)
      .map((_) => newConclusao));
  }

  AsyncResult<InspecaoConclusao> _conclude() async {
    if(formGroup == null || !formGroup!.valid){
      formKey.currentState?.validate();
      return Failure(AppValidationException(formGroup?.error ?? 'Formulário inválido. Por favor, corrija os erros antes de concluir.'));
    }
    if(!formGroup!.lacresAdicionados.hasAnyValue()){
      return Failure(AppValidationException('Por favor, adicione ao menos um lacre.'));
    }
    final conclusao = await formGroup?.toModel();
    if(conclusao == null){
      return Failure(ProcessingException('Falha ao processar o formulário. Contate o suporte.'));
    }
    return _salvarInspecaoConclusaoLocal(inspecao!.conclusao!.copyFrom(conclusao.copyWith(dtFim: DateTime.now())))
      .flatMap((newConclusion){
        inspecao = inspecao!.copyWith(
            conclusao: newConclusion,
            status: SyncStatus.completing.code
        );
        return _localRepository.save(inspecao!).pure(newConclusion);
      });
  }

  AsyncResult<Unit> _return(ReturnFormGroup group, GlobalKey<FormState> form) async {
    if((form.currentState?.validate() ?? false) && group.valid){
      final model = group.toModel();
      return _localRepository.save(inspecao!.copyWith(
        status: SyncStatus.returning.code,
        cdTipoOcorrencia: model.cdTipoOcorrencia,
        dsComplementarOcorrencia: model.dsObservacao,
      )).pure(unit);
    }
    return Failure(AppValidationException(group.error ?? 'Formulário inválido. Por favor, corrija os erros antes de retornar.'));
  }

  AsyncResult<List<Anexo>> _salvarAnexos(List<File> files){
    return _salvarInspecaoAnexos(inspecao!.conclusao!, files).onSuccess((anexos) {
      formGroup?.removeListener(onControlChanged);
      formGroup?.group('observacoes')
        .control('anexos')
        .setValue(anexos.map((anexo) => File(anexo.path)).toList());
      formGroup?.addListener(onControlChanged);
    });
  }

  @override
  void dispose() {
    loadInspecaoCommand.dispose();
    loadFormCommand.dispose();
    concludeCommand.dispose();
    saveCommand.dispose();
    returnCommand.dispose();
    formGroup?.removeListener(onControlChanged);
    formGroup?.dispose();
    _debounceTimer?.cancel();
  }

}