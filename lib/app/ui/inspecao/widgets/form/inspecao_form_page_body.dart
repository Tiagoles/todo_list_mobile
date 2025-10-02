import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/inspecao_form_steps.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_formgroup.dart';
import 'package:smaservicos/app/plugins/block_ui.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/map_launcher_button/map_launcher_button.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/form_layout/form_layout.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/form_steps/inspecao_form_steps_view.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/return_button/return_button.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/return_button/return_form.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/save_command_loader.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/select/inspecao_form_select.dart';
import 'package:smaservicos/app/utils/command.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/functions.dart';

class InspecaoFormPageBody extends StatefulWidget {

  final Inspecao inspecao;
  final Command saveCommand;
  final Command0 concludeCommand;
  final Command2<Unit, ReturnFormGroup, GlobalKey<FormState>> returnCommand;
  final InspecaoFormGroup formGroup;
  final GlobalKey<FormState> formKey;

  const InspecaoFormPageBody({
    super.key,
    required this.inspecao,
    required this.formGroup,
    required this.saveCommand,
    required this.concludeCommand,
    required this.returnCommand,
    required this.formKey,
  });

  @override
  State<InspecaoFormPageBody> createState() => _InspecaoFormPageBodyState();
}

class _InspecaoFormPageBodyState extends State<InspecaoFormPageBody> {

  late final PageController _pageController;
  final stepControl = FormControl.create(initialValue: 0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: stepControl.value,
    );
    stepControl.addListener(changeStep);
    widget.concludeCommand.addListener(onConcludeChange);
  }

  void onConcludeChange() async {
    final command = widget.concludeCommand;
    if(command.running){
      closeKeyboard();
      if(context.mounted) BlockUi.show(context);
      return;
    }
    if(context.mounted) BlockUi.hide();
    if(command.completed){
      Modular.to.pushNamed('/inspecao/lancamentos');
      return;
    }
  }

  void changeStep() {
    final int target = stepControl.value;
    final int current = _pageController.page?.round() ?? 0;

    if (!_pageController.hasClients || current == target) return;

    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void nextStep() => stepControl.setValue(stepControl.value+1);
  void previousStep() {
    if(stepControl.value == 0) return;
    stepControl.setValue(stepControl.value-1);
  }
  void resetStep() => stepControl.setValue(0);

  @override
  void dispose() {
    _pageController.dispose();
    stepControl.dispose();
    widget.concludeCommand.removeListener(onConcludeChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        FocusScope.of(context).hasPrimaryFocus;
        final keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
        if (keyboardOpen) {
          closeKeyboard();
          return;
        }
        if (_pageController.page == 0) {
          return;
        }
        previousStep();
      },
      canPop: false,
      child: FormLayout(
        title: 'Registro de Inspeção',
        body: Column(
          children: [
            InspecaoFormSelect(
              options:
              InspecaoFormSteps.values
                  .map((e) => Option(e.step, e.description))
                  .toList(),
              control: stepControl,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                  spacing: 8,
                  children: [
                    Expanded(child: MapLauncherButton(coords: Coords(widget.inspecao.latitude, widget.inspecao.longitude))),
                    Expanded(child: ReturnButton(
                        returnCommand: widget.returnCommand,
                        key: const Key('return_inspecao_button'),
                        inspecao: widget.inspecao
                    )),
                  ]
              ),
            ),
            Expanded(child: Card(
              color: context.colors.surfaceContainerLow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: InspecaoFormStepsView(
                  formKey: widget.formKey,
                  returnCommand: widget.returnCommand,
                  inspecao: widget.inspecao,
                  pageController: _pageController,
                  formGroup: widget.formGroup,
                  stepControl: stepControl
              ),
            ))
          ],
        ),
        footerItems: [
          ListenableBuilder(
            listenable: Listenable.merge([widget.saveCommand, widget.concludeCommand]),
            builder: (context, child){
              return BootstrapButtonWidget(
                  icon: TablerIcons.arrow_back_up,
                  text: 'Voltar',
                  type: ButtonType.textButton,
                  color: ButtonColor.dark,
                  onPressed: widget.saveCommand.running || widget.concludeCommand.running ? null : () {
                    Modular.to.pop();
                  }
              );
            },
          ),
          const Expanded(child: SizedBox()),
          SaveCommandLoader(saveCommand: widget.saveCommand),
          const SizedBox(width: 16),
          ListenableBuilder(
            listenable: Listenable.merge([widget.saveCommand, widget.concludeCommand]),
            builder: (context, child){
              return BootstrapButtonWidget(
                icon: TablerIcons.check,
                text: 'Concluir inspeção',
                onPressed: widget.saveCommand.running || widget.concludeCommand.running ? null : () => showConcludeModal(context),
              );
            }
          )
        ],
      ),
    );
  }

  void showConcludeModal(BuildContext context){
    if(!context.mounted) return;
    ModalActions.showTimerBottomSheet(
      context,
      title: 'Deseja concluir a inspeção?',
      message: 'Por favor, note que, uma vez concluída, esta inspeção não poderá ser editada.',
      confirmText: 'Concluir Inspeção',
      onConfirm: (){
        widget.concludeCommand.execute();
      },
    );
  }

}
