import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/models/inspecao/form/inspecao_observacoes_formgroup.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';

class FormInspecaoObservacoes extends StatelessWidget {
  final InspecaoObservacoesFormGroup formGroup;

  const FormInspecaoObservacoes({super.key, required this.formGroup});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          StyledFormField(
            labelText: 'Observações',
            maxLines: 10,
            formGroup: formGroup,
            name: 'dsObservacao',
          ),
          FileInput(control: formGroup.control<List<File>, List<File>>('anexos'))
        ]
      )
    );
  }
}
