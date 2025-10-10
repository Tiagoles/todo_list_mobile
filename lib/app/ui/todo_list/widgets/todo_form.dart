import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/entities/todo/todo.dart';
import 'package:smaservicos/app/domain/enums/prioridade_enum.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';
import 'package:smaservicos/app/ui/todo_list/viewmodels/todo_viewmodel.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TodoForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TodoFormGroup formGroup;
  final TodoViewmodel viewmodel;
  final int? idTodo;

  const TodoForm({
    super.key,
    required this.formKey,
    required this.formGroup,
    required this.viewmodel,
    this.idTodo,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  Todo? todo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.idTodo != null) {
        widget.viewmodel.findByIdCommand.addListener(onFindByIdChange);
        widget.viewmodel.findByIdCommand.execute(widget.idTodo!);
      }
    });
  }

  @override
  void dispose() {
    widget.viewmodel.findByIdCommand.removeListener(onFindByIdChange);
    super.dispose();
  }

  void onFindByIdChange() {
    final command = widget.viewmodel.findByIdCommand;
    if (command.completed) {
      todo = command.result?.getOrNull();
      if (todo == null) return;
      widget.formGroup.fromModel(todo!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.idTodo == null) {
      return Form(
        key: widget.formKey,
        child: Column(
          children: [
            StyledFormField(
              formGroup: widget.formGroup,
              name: 'descricao',
              labelText: 'Descrição',
              hintText: 'Digite a descrição da tarefa',
            ),
            const SizedBox(height: 8),
            Select(
              formGroup: widget.formGroup,
              name: 'priority',
              options: PrioridadeEnum.values
                  .map((p) => Option(p.code, p.label))
                  .toList(),
              label: 'Prioridade',
            ),
          ],
        ),
      );
    }
    return ListenableBuilder(
      listenable: widget.viewmodel.findByIdCommand,
      builder: (context, _) {
        final command = widget.viewmodel.findByIdCommand;

        if (command.running) {
          return const Center(child: CircularProgressIndicator());
        }

        if (command.error) {
          return const Center(child: Text('Erro ao carregar a tarefa'));
        }
        if (todo == null) {
          return const SizedBox.shrink();
        }

        return Form(
          key: widget.formKey,
          child: Column(
            children: [
              StyledFormField(
                formGroup: widget.formGroup,
                name: 'descricao',
                labelText: 'Descrição',
                hintText: 'Digite a descrição da tarefa',
              ),
              const SizedBox(height: 8),
              Select(
                formGroup: widget.formGroup,
                name: 'priority',
                options: PrioridadeEnum.values
                    .map((p) => Option(p.code, p.label))
                    .toList(),
                label: 'Prioridade',
              ),
            ],
          ),
        );
      },
    );
  }
}

class TodoFormGroup extends FormGroup<Todo> {
  TodoFormGroup()
    : super({
        'descricao': FormControl.text(
          initialValue: null,
          options: FormControlOptions(isRequired: true),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'A descrição é obrigatória',
            ),
            FormBuilderValidators.minLength(
              3,
              errorText: 'A descrição deve ter no mínimo 3 caracteres',
            ),
            FormBuilderValidators.maxLength(
              50,
              errorText: 'A descrição deve ter no máximo 50 caracteres',
            ),
          ]),
        ),
        'priority': FormControl.create<int>(
          initialValue: 1,
          options: FormControlOptions(isRequired: true),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'A prioridade é obrigatória',
            ),
          ]),
        ),
      'endedAt': FormControl.create<DateTime?>(initialValue: null),
      });

  @override
  void fromModel(model) {
    textControl('descricao').setValue(model.description);
    control('priority').setValue(model.priority);
    control('endedAt').setValue(model.endedAt);
   }

  @override
  Todo toModel() {
    return Todo(
      id: 0,
      createdAt: DateTime.now(),
      description: textControl('descricao').value,
      priority: control('priority').value,
      endedAt:  control('endedAt').value,
    );
  }
}
