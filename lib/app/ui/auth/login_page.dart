import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/auth/viewmodels/login_viewmodel/login_viewmodel.dart';
import 'package:smaservicos/app/ui/auth/widgets/login_form.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModel viewModel;
  final Map<String, dynamic>? args;
  const LoginPage({required this.viewModel, this.args, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    
    widget.viewModel.loginCommand.addListener(_onLoginCommandChanged);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.args != null && widget.args!['error'] != null) {
        ToastrService.error(
          context: context,
          message: widget.args!['error'],
          cancelText: 'Continuar',
        );
      }
    });
  }

  void _onLoginCommandChanged(){
    if(widget.viewModel.loginCommand.completed) return Modular.to.navigate('/startup/');
    if (widget.viewModel.loginCommand.error) {
      final result = widget.viewModel.loginCommand.result;
      widget.viewModel.loginCommand.clearResult();
      ToastrService.error(
        context: context,
        message: result?.exceptionOrNull()?.message ?? 'Não foi possível completar o login, tente novamente mais tarde.',
        title: 'Falha ao realizar o login',
        cancelText: 'Fechar',
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: ListenableBuilder(
      listenable: widget.viewModel.loginCommand,
      builder: (context, _){
        final command = widget.viewModel.loginCommand;
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: context.colors.gradientPrimaryLight,
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 88,
                        child: Image.asset(
                          'assets/images/horizontal_logo.png',
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 32),
                    Container(
                      color: context.colors.surface,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 16.0),
                          LoginForm(
                            enabled: !command.running,
                            viewModel: widget.viewModel,
                          ),
                          const SizedBox(height: 48.0),
                          command.running
                              ? const CircularProgressIndicator()
                              : BootstrapButtonWidget(
                            text: 'Entrar',
                            icon: TablerIcons.login,
                            size: ButtonSize.block,
                            onPressed: widget.viewModel.submit,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
    
  }
}
