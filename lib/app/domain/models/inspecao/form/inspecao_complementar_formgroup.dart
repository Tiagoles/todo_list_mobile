import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';

class InspecaoComplementarFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoComplementarFormGroup(this.validators) : super({
    'vlCorrenteMaxima':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlCorrenteMaxima']
    ),
    'vlCorrenteMaximaFim':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlCorrenteMaximaFim']
    ),
    'vlCorrenteDisjuntor':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlCorrenteDisjuntor']
    ),
    'vlChaveProtecao':  FormControl.text(
      initialValue: '',
      validator: validators.rules['vlChaveProtecao']
    ),
    //É um select
    'vlCaboEntrada':  FormControl.create<String?>(
      initialValue: null,
      validator: validators.rules['vlCaboEntrada']
    ),
  });

  @override
  fromModel(Map<String, dynamic> model) {
    textControl('vlCorrenteMaxima').setValue( model['vlCorrenteMaxima'] ?? '');
    textControl('vlCorrenteMaximaFim').setValue( model['vlCorrenteMaximaFim'] ?? '');
    textControl('vlCorrenteDisjuntor').setValue( model['vlCorrenteDisjuntor'] ?? '');
    textControl('vlChaveProtecao').setValue( model['vlChaveProtecao'] ?? '');
    control('vlCaboEntrada').setValue( model['vlCaboEntrada']);
  }

  @override
  Map<String, dynamic> toModel() {
    throw UnimplementedError('toModel is not implemented for InspecaoComplementarFormGroup');
  }
}
