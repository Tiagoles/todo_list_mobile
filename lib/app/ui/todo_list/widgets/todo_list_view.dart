import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/todo_list/viewmodels/todo_viewmodel.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/todo_card.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/todo_form.dart';
import '../../../domain/entities/todo/todo.dart';
import '../../../plugins/toastr_service.dart';
import '../../core/widgets/buttons/bootstrap_button/bootstrap_button_style.dart';
import '../../core/widgets/buttons/bootstrap_button/bootstrap_button_widget.dart';

class TodoListView extends StatelessWidget {
  final TodoViewmodel todoViewmodel;

  const TodoListView({super.key, required this.todoViewmodel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todoViewmodel.todos,
      builder: (context, value, child) {
        if (value.isEmpty) {
          return const SingleChildScrollView(child: EmptyWidget());
        }

        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final Todo todo = value[index];

            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => _abrirModal(context, todo),
              child: TodoCard(todo: todo, todoViewmodel: todoViewmodel),
            );
          },
        );
      },
    );
  }

  void _abrirModal(BuildContext _context, Todo todo) {
    final formKey = GlobalKey<FormState>();
    final formGroup = TodoFormGroup();

    ModalActions.showAlertBottomSheet(
      _context,
      title: 'Editar Tarefa',
      content: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(_context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: TodoForm(value: todo, formKey: formKey, formGroup: formGroup),
        ),
      ),
      actions: [
        BootstrapButtonWidget(
          type: ButtonType.textButton,
          text: 'Fechar',
          onPressed: () => Modular.to.pop(),
        ),
        BootstrapButtonWidget(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              final descricao = formGroup.textControl('descricao').value;

              await todoViewmodel.saveCommand.execute(
                todo.copyWith(description: descricao),
                false,
              );

              Modular.to.pop();
            }
          },
          icon: TablerIcons.device_floppy,
          color: ButtonColor.success,
          text: 'Salvar',
        ),
      ],
    );
  }
}
