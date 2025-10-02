import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/auth_viewmodel/auth_viewmodel.dart';

class UserDetailsWidget extends StatelessWidget {
  final AuthViewModel viewModel = Modular.get();

  UserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Observer(builder: (_){
      final nmUsuario = viewModel.isLogged ? viewModel.user.nmUsuario : 'Usuário';
      return RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Olá',
                style: textTheme.titleMedium!.copyWith(
                    color: colors.onPrimaryContainer, fontWeight: FontWeight.normal
                )
            ),
            TextSpan(
                text: ', ',
                style: textTheme.titleMedium!.copyWith(
                    color: colors.onPrimaryContainer, fontWeight: FontWeight.normal
                )
            ),
            TextSpan(
                text: nmUsuario,
                style: textTheme.titleMedium!.copyWith(color: colors.onPrimaryContainer)
            )
          ]));
    });
  }
}
