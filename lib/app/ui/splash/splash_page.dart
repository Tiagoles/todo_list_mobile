import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:smaservicos/app/ui/splash/widgets/splash_animation.dart';

class SplashPage extends StatefulWidget {
  final SplashViewModel viewModel;
  const SplashPage({super.key, required this.viewModel});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCommand.addListener(_onCommandChanged);
  }

  void _onCommandChanged(){
    if(widget.viewModel.loadCommand.completed) return Modular.to.navigate('/home/');
    final errorMessage = widget.viewModel.loadCommand.errorMessage;
    if(errorMessage != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ToastrService.error(context: context, message: errorMessage);
      });
    }
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.viewModel.loadCommand,
        builder: (context, _){
          return const SplashAnimation();
        }
    );
  }
}
