import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/plugins/block_ui.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';
import 'return_form.dart';

class ReturnButton extends StatefulWidget {

  final Command2<Unit, ReturnFormGroup, GlobalKey<FormState>> returnCommand;
  final Inspecao inspecao;

  const ReturnButton({super.key, required this.returnCommand, required this.inspecao});

  @override
  State<ReturnButton> createState() => _ReturnButtonState();
}

class _ReturnButtonState extends State<ReturnButton> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final ReturnFormGroup formGroup;

  @override
  void initState() {
    super.initState();
    formGroup = ReturnFormGroup(widget.inspecao);
    widget.returnCommand.addListener(onCommandChange);
  }

  @override
  void dispose() {
    widget.returnCommand.removeListener(onCommandChange);
    formGroup.dispose();
    super.dispose();
  }

  void onCommandChange() {
    final command = widget.returnCommand;
    if (command.running) {
      BlockUi.show(context);
      return;
    }
    BlockUi.hide();
    final error = command.result?.exceptionOrNull();
    if (error != null) {
      ToastrService.error(context: context, message: error.message);
      return;
    }
    Modular.to.pushNamed('/inspecao/lancamentos');
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapButtonWidget(
      text: 'Retornar Inspeção',
      color: ButtonColor.danger,
      size: ButtonSize.small,
      icon: TablerIcons.arrow_back,
      onPressed: () async {
        ModalActions.showAlertBottomSheet(
          context,
          title: 'Retornar Inspeção',
          content: ReturnForm(formKey: _formKey, formGroup: formGroup),
          actions: [
            BootstrapButtonWidget(
              icon: TablerIcons.x,
              type: ButtonType.textButton,
              color: ButtonColor.dark,
              text: 'Cancelar',
              onPressed: () {
                Modular.to.pop();
              },
            ),
            BootstrapButtonWidget(
              icon: TablerIcons.send,
              text: 'Enviar',
              onPressed: (){
                widget.returnCommand.execute(formGroup, _formKey);
              },
            )
          ]
        );
      },
    );
  }
}
