import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/checkboxs/styled_checkbox_widget.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/info_card_details.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/todo_form.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import '../../../domain/entities/todo/todo.dart';
import '../../../domain/enums/prioridade_enum.dart';
import '../../../plugins/modal_actions.dart';
import '../../core/widgets/buttons/bootstrap_button/bootstrap_button_style.dart';
import '../../core/widgets/buttons/bootstrap_button/bootstrap_button_widget.dart';
import '../viewmodels/todo_viewmodel.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  final TodoViewmodel todoViewmodel;

  const TodoCard({super.key, required this.todo, required this.todoViewmodel});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  late final FormControl<bool, bool> formCheckbox;
  final formKey = GlobalKey<FormState>();
  final formGroup = TodoFormGroup();

  @override
  void initState() {
    super.initState();
    formCheckbox = FormControl.create(initialValue: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncCheckboxFromModel();
    });
  }

  void _syncCheckboxFromModel() {
    final checked = widget.todo.endedAt != null;
    if (formCheckbox.value != checked) {
      formCheckbox.setValue(checked);
    }
  }

  @override
  void dispose() {
    formCheckbox.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);

    final Color priorityColor = PrioridadeEnum.values
        .firstWhere((e) => e.code == widget.todo.priority,
        orElse: () => PrioridadeEnum.muitoBaixa).color(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Dismissible(
          key: Key(widget.todo.id.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: Colors.red.withAlpha(200),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            final vm = widget.todoViewmodel;
            vm.todos.value = List.from(vm.todos.value)..remove(widget.todo);
            vm.deleteCommand.execute(widget.todo);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Theme.of(context).cardColor,
              border: Border(
                left: BorderSide(
                  color: priorityColor,
                  width: 6.0,
                ),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.0,
                      color: colors.inversePrimary.withAlpha(50),
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StyledCheckboxWidget(
                          control: formCheckbox,
                          onChanged: (value) {
                            widget.todoViewmodel.toggleEndedAt(widget.todo);
                          },
                        ),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: formCheckbox.valueNotifier,
                            builder: (context, value, child) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    ModalActions.showAlertBottomSheet(
                                      context,
                                      title: 'Informações da Tarefa',
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (widget.todo.endedAt != null)
                                            const SizedBox(height: 8),
                                          InfoCardDetails(
                                            viewModel: widget.todoViewmodel,
                                            todoId: widget.todo.id,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        BootstrapButtonWidget(
                                          type: ButtonType.textButton,
                                          color: ButtonColor.defaultColor,
                                          icon: TablerIcons.x,
                                          text: 'Fechar',
                                          onPressed: () => Modular.to.pop(),
                                        ),
                                        editButton,
                                      ],
                                    );
                                  },
                                  child: Text(
                                    widget.todo.description,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colors.primary,
                                      decoration: !value
                                          ? TextDecoration.none
                                          : TextDecoration.lineThrough,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: -1,
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.square,
                      borderRadius: BorderRadius.circular(6),
                      badgeColor: colors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                    ),
                    badgeContent: Row(
                      children: [
                        Icon(Icons.date_range, size: 16, color: colors.onPrimary),
                        const SizedBox(width: 2),
                        Text(
                          DateFormat(
                            'dd/MM/yyyy HH:mm:ss',
                          ).format(widget.todo.createdAt),
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      toAnimate: true,
                      animationDuration: Duration(milliseconds: 300),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get editButton {
    return BootstrapButtonWidget(
      color: ButtonColor.primary,
      icon: TablerIcons.edit,
      text: 'Editar',
      onPressed: () {
        Modular.to.pop();
        ModalActions.showAlertBottomSheet(
          context,
          title: 'Editar Tarefa',
          content: TodoForm(
            formKey: formKey,
            formGroup: formGroup,
            viewmodel: widget.todoViewmodel,
            idTodo: widget.todo.id,
          ),
          actions: [
            BootstrapButtonWidget(
              type: ButtonType.textButton,
              color: ButtonColor.defaultColor,
              icon: TablerIcons.x,
              text: 'Fechar',
              onPressed: () => Modular.to.pop(),
            ),
            BootstrapButtonWidget(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await widget.todoViewmodel.saveCommand.execute(
                      widget.todo.copyFromForm(formGroup.value));
                }
                Modular.to.pop();
              },
              icon: TablerIcons.device_floppy,
              color: ButtonColor.success,
              text: 'Salvar',
            ),
          ],
        );
      },
    );
  }
}

