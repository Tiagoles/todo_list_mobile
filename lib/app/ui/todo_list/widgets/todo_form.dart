import 'dart:async';
import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../domain/entities/todo/todo.dart';

class TodoForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TodoFormGroup formGroup;
  final Todo? value;

  const TodoForm({
    super.key,
    required this.formKey,
    required this.formGroup,
    this.value,
  });


  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      widget.formGroup.textControl('descricao').setValue(widget.value!.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);

    return Form(
      key: widget.formKey,
      child: SizedBox(
        child: Column(
          children: [
            StyledFormField(
              formGroup: widget.formGroup,
              name: 'descricao',
              labelText: 'Descrição',
              hintText: 'Digite a descrição da tarefa',
            ),
          ],
        ),
      ),
    );
  }
}

class TodoFormGroup extends FormGroup {
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
      });

  @override
  void fromModel(model) {
    // TODO: implement fromModel
  }

  @override
  FutureOr toModel() {
    // TODO: implement toModel
    throw UnimplementedError();
  }
}
