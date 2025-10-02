import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/auth_viewmodel/auth_viewmodel.dart';
import 'package:smaservicos/app/ui/core/load_page.dart';

class LogoutPage extends StatelessWidget {
  final AuthViewModel viewModel;
  final Map<String, dynamic>? args;
  final Map<String, String>? queryString;

  const LogoutPage({
    super.key,
    required this.viewModel,
    this.args,
    this.queryString
  });

  @override
  Widget build(BuildContext context) {
    final logoutArgs = queryString != null &&
        queryString!.isNotEmpty &&
        queryString!['expired'] != null
        ? {'error' : 'Sua sessão expirou faça login novamente para navegar pelo sistema'}
        : args;

    viewModel.logout(logoutArgs);

    return const LoadPage();
  }
}