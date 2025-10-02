import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:smaservicos/app/utils/constants.dart';

class LoginForm extends FormGroup<Credentials>{
  LoginForm() : super({
      'usuario': FormControl.text(
        initialValue: null,
        validator: FormBuilderValidators.required(errorText: 'Digite o usuário.'),
        options: FormControlOptions(
          isRequired: true
        )
      ),
      'nome': FormControl.text(
        initialValue: null,
        options: FormControlOptions(isRequired: true)
      ),
      'senha': FormControl.text(
        initialValue: null,
        validator: FormBuilderValidators.required(errorText: 'Digite a senha.'),
        options: FormControlOptions(
          isRequired: true
        )
      ),
      'empresa': FormControl.create<double>(initialValue: Constants.empresa),
      'userTypeCode': FormControl.create<int>(initialValue: Constants.userTypeCode, options: FormControlOptions(isRequired: true)),
      'remember': FormControl.create<bool>(initialValue: false),
    }
  );

  @override
  fromModel(Credentials model) {
    control('usuario').setValue(model.usuario);
    control('nome').setValue(model.nome);
    control('senha').setValue(model.senha ?? '');
    control('empresa').setValue(model.empresa);
    control('userTypeCode').setValue(model.userTypeCode);
    control('remember').setValue(model.usuario != '');
  }

  @override
  Credentials toModel() {
    return Credentials(
      usuario: control('usuario').value,
      nome: control('nome').value,
      senha: control('senha').value,
      empresa: control('empresa').value,
      userTypeCode: control('userTypeCode').value,
    );
  }

}