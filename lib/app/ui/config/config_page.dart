import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/plugins/snackbar_service.dart';
import 'package:smaservicos/app/ui/config/viewmodels/config_viewmodel.dart';
import 'package:smaservicos/app/ui/config/viewmodels/configs_form/configs_form_viewmodel.dart';
import 'package:smaservicos/app/ui/config/widgets/config_form_widget.dart';
import 'package:smaservicos/app/plugins/block_ui.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';
import 'package:smaservicos/app/utils/functions.dart';
import 'widgets/config_layout/config_layout.dart';

class ConfigPage extends StatefulWidget {

  final ConfigsFormViewModel formViewmodel;
  final ConfigViewModel viewModel;

  const ConfigPage({
    super.key,
    required this.formViewmodel,
    required this.viewModel,
  });

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.formViewmodel.saveCommand.addListener(_onSaveConfigChanged);
    widget.viewModel.exportDatabaseCommand.addListener(_onExportDatabaseChanged);
    widget.viewModel.importDatabaseCommand.addListener(_onImportDatabaseChanged);
  }

  @override
  void dispose() {
    widget.viewModel.importDatabaseCommand.removeListener(_onImportDatabaseChanged);
    widget.viewModel.exportDatabaseCommand.removeListener(_onExportDatabaseChanged);
    widget.formViewmodel.saveCommand.removeListener(_onSaveConfigChanged);
    widget.formViewmodel.dispose();
    super.dispose();
  }

  void _onExportDatabaseChanged() {
    final command = widget.viewModel.exportDatabaseCommand;
    final result = command.result;

    if (command.error) {
      ToastrService.error(
        context: context,
        message: result?.exceptionOrNull()?.message ?? 'Erro ao exportar banco de dados',
      );
      return;
    }

  }

  void _onImportDatabaseChanged() {
    final command = widget.viewModel.importDatabaseCommand;
    final result = command.result;

    if(command.running) {
      if(!context.mounted) return;
      BlockUi.show(context);
      return;
    }
    BlockUi.hide();
    if (command.error) {
      if(!context.mounted) return;
      ToastrService.error(
        context: context,
        message: result?.exceptionOrNull()?.message ?? 'Erro ao exportar banco de dados',
      );
      return;
    }

    if (command.completed) {
      if(!context.mounted) return;
      SnackBarService.success(context: context, message: 'Banco de dados importado com sucesso');
    }

  }

  void _onSaveConfigChanged() {
    final command = widget.formViewmodel.saveCommand;
    final result = command.result;

    if (command.running) {
      if(context.mounted) BlockUi.show(context);
      return;
    }

    BlockUi.hide();

    if (command.error) {
      if(!context.mounted) return;
      ToastrService.error(
        context: context,
        message: result?.exceptionOrNull()?.message ?? 'Erro ao salvar configurações',
      );
      return;
    }

    if (command.completed) {
      if(!context.mounted) return;
      SnackBarService.success(
        context: context,
        message: 'Configurações salvas com sucesso',
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return ConfigLayout(
      onCancel: Modular.to.pop,
      onSave: () async {
        if(!_formKey.currentState!.validate()) return;
        if(!widget.formViewmodel.pdaHasBeenChanged || !context.mounted){
          widget.formViewmodel.saveCommand.execute(false);
          return;
        }

        ModalActions.showTimerBottomSheet(
          context,
          title: 'Tem certeza que deseja efetuar a alteração do n° do PDA?',
          message: 'Lembre-se que ao alterar o n° do PDA todos os dados locais serão perdidos.',
          onConfirm: () {
            closeKeyboard();
            widget.formViewmodel.saveCommand.execute(true);
          },
        );
      },
      onReturn: Modular.to.pop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: Listenable.merge([widget.viewModel.exportDatabaseCommand, widget.viewModel.importDatabaseCommand]),
              builder: (context, _){
                final (importCommand, exportCommand) = (widget.viewModel.importDatabaseCommand, widget.viewModel.exportDatabaseCommand);
                return ConfigFormWidget(
                  formKey: _formKey,
                  viewModel: widget.formViewmodel,
                  onImportDatabase: importCommand.running ? null : (){
                    ToastrService.warning(
                      context: context,
                      message: 'Importar um banco de dados irá apagar todos os dados locais. Tenha certeza do que está fazendo.',
                      title: 'Atenção',
                      cancelText: 'Cancelar',
                      confirmText: 'Continuar',
                      onConfirm: importCommand.execute,
                      hasIcon: true,
                    );
                  },
                  onExportDatabase: exportCommand.running ? null : exportCommand.execute
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
