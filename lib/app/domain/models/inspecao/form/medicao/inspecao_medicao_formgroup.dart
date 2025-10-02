import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/domain/validators/inspecao/inspecao_validator.dart';
import 'inspecao_medicao_kw_formgroup.dart';
import 'inspecao_medicao_kvarh_formgroup.dart';
import 'inspecao_medicao_kwh_formgroup.dart';

class InspecaoMedicaoFormGroup extends FormGroup<Map<String, dynamic>> {

  final InspecaoValidator validators;

  InspecaoMedicaoFormGroup(this.validators) : super({
      'vlTc1':  FormControl.text(
          initialValue: '',
          validator: validators.rules['vlTc1']
      ),
      'vlTc2':  FormControl.text(
          initialValue: '',
          validator: validators.rules['vlTc2']
      ),
      'vlTp1':  FormControl.text(
          initialValue: '',
          validator: validators.rules['vlTp1']
      ),
      'vlTp2':  FormControl.text(
          initialValue: '',
          validator: validators.rules['vlTp2']
      ),
      'kwh': InspecaoMedicaoKWhFormGroup(validators),
      'kw': InspecaoMedicaoKwFormGroup(validators),
      'kvarh': InspecaoMedicaoKVArhFormGroup(validators),
    },
  );

  InspecaoMedicaoKWhFormGroup get kwh => group<InspecaoMedicaoKWhFormGroup>('kwh');
  InspecaoMedicaoKwFormGroup get kw => group<InspecaoMedicaoKwFormGroup>('kw');
  InspecaoMedicaoKVArhFormGroup get kvarh => group<InspecaoMedicaoKVArhFormGroup>('kvarh');

  @override
  fromModel(Map<String, dynamic> model) {
    textControl('vlTc1').setValue(model['vlTc1'] ?? '');
    textControl('vlTc2').setValue(model['vlTc2'] ?? '');
    textControl('vlTp1').setValue(model['vlTp1'] ?? '');
    textControl('vlTp2').setValue(model['vlTp2'] ?? '');
    kwh.fromModel(model);
    kw.fromModel(model);
    kvarh.fromModel(model);
  }

  @override
  Map<String, dynamic> toModel() {
    throw UnimplementedError();
  }

}
