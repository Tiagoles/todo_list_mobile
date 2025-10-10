
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/todo_form.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

import '../../../todo_list/viewmodels/todo_viewmodel.dart';

class BodyCard extends StatefulWidget {
  final IconData? icon;
  final Widget? title;
  final Widget _child;
  final bool expanded;
  final bool hasDivider;

  const BodyCard({
    super.key,
    this.icon,
    this.title,
    required Widget child,
    this.expanded = true,
    this.hasDivider = false,
  }) : _child = child;

  @override
  State<BodyCard> createState() => _BodyCardState();
}

class _BodyCardState extends State<BodyCard> {
  final _formKey = GlobalKey<FormState>();
  final viewModel = Modular.get<TodoViewmodel>();

  @override
  void initState() {
    super.initState();
    viewModel.saveCommand.addListener(() {
      viewModel.saveCommand.error
          ? ToastrService.error(context: context, message: 'Erro ao salvar')
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return Card(
      elevation: 8,
      color: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.primary.withAlpha(50)),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (widget.title != null) ...[
              Row(
                spacing: 8,
                children: [
                  if (widget.icon != null)
                    Icon(
                      widget.icon,
                      color: colors.primary,
                      size: textTheme.titleLarge!.fontSize,
                    ),
                  Expanded(child: widget.title!),
                  BootstrapButtonWidget(
                    onPressed: (){
                      final formGroup = TodoFormGroup();
                      ModalActions.showAlertBottomSheet(
                        context,
                        title: 'Adicionar',
                        content: TodoForm(
                          formKey: _formKey,
                          formGroup: formGroup,
                          viewmodel: viewModel,
                        ),
                        actions: [
                          BootstrapButtonWidget(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            icon: TablerIcons.x,
                            color: ButtonColor.defaultColor,
                            type: ButtonType.textButton,
                            text: 'Fechar',
                          ),
                          BootstrapButtonWidget(
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await viewModel.saveCommand.execute(formGroup.toModel());
                                Modular.to.pop();
                              }
                            },
                            icon: TablerIcons.device_floppy,
                            color: ButtonColor.success,
                            text: 'Salvar',
                          ),
                        ],
                      );
                    },
                    icon: TablerIcons.plus,
                    color: ButtonColor.primary,
                    size: ButtonSize.normal,
                    paddingHorizontal: 10,
                    paddingVertical: 8,
                  ),
                ],
              ),
              Divider(color: colors.secondary.withAlpha(50)),
            ],
            child,
          ],
        ),
      ),
    );
  }

  Widget get child {
    if (widget.expanded) return Expanded(child: widget._child);
    return widget._child;
  }
}
