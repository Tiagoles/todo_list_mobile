import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'package:smaservicos/app/domain/exceptions/app_validation_exception.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/form_layout/form_layout.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_form_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/inspecao_form_protected_view.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/placeholder/inspecao_form_placeholder.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

class InspecaoFormPage extends StatefulWidget {
  final InspecaoFormViewModel viewModel;
  final int inspecaoId;

  const InspecaoFormPage({super.key, required this.viewModel, required this.inspecaoId});

  @override
  State<InspecaoFormPage> createState() => _InspecaoFormPageState();
}

class _InspecaoFormPageState extends State<InspecaoFormPage> {

  final protection = ValueNotifier(true);
  late final Command0<Inspecao> loadCommand;

  @override
  void initState() {
    super.initState();
    loadCommand = Command0(_load);
    loadCommand.addListener(_onLoad);
    loadCommand.execute();
  }

  AsyncResult<Inspecao> _load() async {
    if(widget.inspecaoId <= 0){
      return Failure(AppValidationException('ID da inspeção inválido.'));
    }
    await widget.viewModel.loadInspecaoCommand.execute(widget.inspecaoId);
    if(widget.viewModel.loadInspecaoCommand.error){
      final errorMessage = widget.viewModel.loadInspecaoCommand.result?.exceptionOrNull()?.message;
      if(errorMessage != null){
        return Failure(LocalDatabaseException(errorMessage));
      }
    }
    return Success(widget.viewModel.inspecao!);
  }

  void _onLoad(){
    loadCommand.result?.fold((inspecao){
      if(inspecao.status == SyncStatus.fromRemote.code){
        _showConfirmModal(inspecao);
        return;
      }
      protection.value = false;
      return;
    },(f){
      Modular.to.pop();
      ToastrService.error(
        context: context,
        message: f.message
      );
    });
  }

  Future<void> _showConfirmModal(Inspecao inspecao) async {
    if(!context.mounted) return;
    ModalActions.showTimerBottomSheet(
      context,
      title: 'Deseja iniciar a inspeção?',
      message: 'Por favor, note que, uma vez iniciada, esta ação não poderá ser desfeita. A inspeção deverá ser concluída ou devolvida para revisão.',
      confirmText: 'Iniciar Inspeção',
      onConfirm: (){
        widget.viewModel.initInspecao(inspecao).fold((s){
          protection.value = false;
        }, (f){
          Modular.to.pop();
          ToastrService.error(
            context: context,
            message: f.message
          );
        });
      },
      onCancel: () => Modular.to.pop()
    );
  }


  @override
  void dispose() {
    loadCommand.removeListener(_onLoad);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: protection,
      builder: (context, running, child){
        if(running) return const InspecaoFormPlaceholder();
        if(widget.viewModel.inspecao == null){
          return const FormLayout(
            title: 'Registro não encontrado',
            footerItems: [],
            body: EmptyWidget(),
          );
        }
        return InspecaoFormProtectedView(
          viewmodel: widget.viewModel,
          inspecao: widget.viewModel.inspecao!,
        );
      },
    );
  }
}
