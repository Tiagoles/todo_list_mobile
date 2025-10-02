import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:smaservicos/app/data/models/motivo_retorno/motivo_retorno_dto.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/tipo_ocorrencia/tipo_ocorrencia.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';

class ReturnForm extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  final ReturnFormGroup formGroup;
  const ReturnForm({super.key, required this.formKey, required this.formGroup});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Select(
                options: options,
                label: 'Tipo de ocorrência',
                formGroup: formGroup,
                name: 'tipoOcorrencia',
              ),
              const SizedBox(height: 32),
              StyledFormField(
                labelText: 'Motivo do retorno',
                maxLines: 5,
                formGroup: formGroup,
                name: 'motivoRetorno',
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Option> get options => TipoOcorrencia.values
    .map((o) => Option(o.code, o.description)).toList();

}

class ReturnFormGroup extends FormGroup<MotivoRetornoDTO>{

  ReturnFormGroup(Inspecao inspecao) : super({
    'nrInspecao': FormControl.create<int>(initialValue: inspecao.nrInspecao.toInt()),
    'tipoOcorrencia': FormControl.create<int?>(initialValue: inspecao.cdTipoOcorrencia, validator: FormBuilderValidators.required(
      errorText: 'Selecione o tipo de ocorrência',
    )),
    'motivoRetorno': FormControl.text(initialValue: inspecao.dsComplementarOcorrencia)
  });

  @override
  fromModel(model) {
    control('nrInspecao').setValue(model.nrInspecao);
    control('tipoOcorrencia').setValue(model.cdTipoOcorrencia);
    textControl('motivoRetorno').setValue(model.dsObservacao ?? '');
  }

  @override
  MotivoRetornoDTO toModel() {
    return MotivoRetornoDTO(
      nrInspecao: control('nrInspecao').value,
      cdTipoOcorrencia: control('tipoOcorrencia').value,
      dsObservacao: textControl('motivoRetorno').value.isEmpty ? null : textControl('motivoRetorno').value,
    );
  }

}