import 'dart:async';

import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/search_inputs/reactive_form_search.dart';
import 'package:smaservicos/app/ui/evento_servico/viewmodel/evento_servico_viewmodel.dart';

class ApontamentoHoraForm extends StatelessWidget {

  final _formGroup = EventGroup();
  final EventoServicoViewModel _eventoViewModel = Modular.get();
  final GlobalKey<FormState> formKey;

  ApontamentoHoraForm({
    super.key,
    required this.formKey
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            ValueListenableBuilder(
              valueListenable: _eventoViewModel.eventos,
              builder: (context, _, _) {
                return ReactiveFormSearch<EventoServico>(
                  labelText: 'Evento',
                  onSearch: _eventoViewModel.findLov,
                  findOnInit: true,
                  hintText: 'Busque pela descrição ou código do evento',
                  formGroup: _formGroup,
                  name: 'evento',
                  modalTitle: 'Selecione o evento',
                );
              },
            ),
            StyledFormField(formGroup: _formGroup, name: 'obs', labelText: 'Observações', maxLines: 4),
          ],
        ),
      ),
    );
  }
}

class EventGroup extends FormGroup{
  EventGroup() : super({
    'obs': FormControl.text(initialValue: null),
    'evento': FormControl.create<EventoServico?>(initialValue: null, options: FormControlOptions(
        isRequired: true
    ))
  });

  @override
  void fromModel(model) {}

  @override
  FutureOr toModel() {}
}