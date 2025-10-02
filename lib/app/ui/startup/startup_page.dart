import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/core/load_page.dart';
import 'package:smaservicos/app/ui/startup/viewmodels/startup_viewmodel.dart';

class StartupPage extends StatefulWidget {
  final StartupViewModel viewModel;

  const StartupPage({super.key, required this.viewModel});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCommand.addListener(_onCommandChanged);
  }

  void _onCommandChanged(){
    if(widget.viewModel.loadCommand.completed) return Modular.to.navigate('/home/');
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
          return const LoadPage(
            description: 'Sincronizando dados, aguarde...',
          );
        }
    );
  }
}
