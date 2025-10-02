import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/enums/auth/user_type.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/login_viewmodel/login_viewmodel.dart';
import 'package:smaservicos/app/ui/auth/widgets/usuario_search_lov.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/ui/core/widgets/selects/select.dart';

class LoginForm extends StatelessWidget {

  final LoginViewModel viewModel;
  final bool enabled;

  const LoginForm({
    super.key,
    required this.viewModel,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          Select(
            icon: TablerIcons.user_question,
            label: 'Tipo de usuário',
            formGroup: viewModel.loginForm,
            name: 'userTypeCode',
            onChanged: (value){
              viewModel.loginForm.control('usuario').setValue('');
              viewModel.loginForm.control('nome').setValue('');
              viewModel.loginForm.control('senha').setValue('');
            },
            options: UserType.values.map(
      (e) => Option(
                e.code,
                e.description
              )).toList()
          ),
          const SizedBox(height: 24),
          ValueListenableBuilder(
              valueListenable: viewModel.loginForm.control<int,int>('userTypeCode').valueNotifier,
              builder: (context, snapshot, _){
                if(snapshot == UserType.sism.code){
                  return StyledFormField(
                    formGroup: viewModel.loginForm,
                    name: 'usuario',
                    labelText: 'Usuário',
                    prefixIcon: TablerIcons.user,
                    hintText: 'Usuário',
                  );
                }
                return UsuarioSearchLov(
                  formGroup: viewModel.loginForm,
                  onSelected: (value){
                    viewModel.loginForm.control('usuario').setValue(value.value.toString());
                  },
                );
              }),
          const SizedBox(height: 24.0),
          StyledFormField(
            labelText: 'Senha',
            formGroup: viewModel.loginForm,
            name: 'senha',
            obscureText: true,
            prefixIcon: TablerIcons.lock,
            type: TextInputType.visiblePassword,
            hintText: 'Senha',
          ),
          const SizedBox(height: 16.0),
          Align(
              alignment: Alignment.centerLeft,
              child: StyledCheckboxWidget(
                label: 'Lembrar de mim',
                control: viewModel.loginForm.control('remember'),
                onChanged: (value){
                  viewModel.loginForm.control('remember').setValue(value ?? false);
                },
              )
          ),
        ])
    );
  }
}
