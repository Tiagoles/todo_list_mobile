import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/layouts/form_layout/form_layout.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_form_viewmodel.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/inspecao_form_page_body.dart';
import 'package:smaservicos/app/ui/inspecao/widgets/form/placeholder/inspecao_form_placeholder.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

class InspecaoFormProtectedView extends StatefulWidget {
  final InspecaoFormViewModel viewmodel;
  final Inspecao inspecao;

  const InspecaoFormProtectedView({
    super.key,
    required this.inspecao,
    required this.viewmodel,
  });

  @override
  State<InspecaoFormProtectedView> createState() => _InspecaoFormProtectedViewState();
}

class _InspecaoFormProtectedViewState extends State<InspecaoFormProtectedView> {

  @override
  void initState() {
    super.initState();
    widget.viewmodel.loadFormCommand.execute();
    widget.viewmodel.loadFormCommand.addListener(onLoad);
    widget.viewmodel.concludeCommand.addListener(onConcludeCalled);
  }

  void onLoad(){
    if(widget.viewmodel.loadFormCommand.error){
      final errorMessage = widget.viewmodel.loadFormCommand.result?.exceptionOrNull()?.message;
      if(errorMessage != null){
        Modular.to.pop();
        ToastrService.error(context: context, message: errorMessage);
      }
    }
  }

  void onConcludeCalled(){
    if(widget.viewmodel.concludeCommand.error){
      final errorMessage = widget.viewmodel.concludeCommand.result?.exceptionOrNull()?.message;
      if(errorMessage != null){
        ToastrService.error(context: context, message: errorMessage);
      }
    }
  }

  @override
  void dispose() {
    widget.viewmodel.loadFormCommand.removeListener(onLoad);
    widget.viewmodel.concludeCommand.removeListener(onConcludeCalled);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.viewmodel.loadFormCommand,
        builder: (context, _){
          if(widget.viewmodel.loadFormCommand.running){
            return const InspecaoFormPlaceholder();
          }
          if(widget.viewmodel.loadFormCommand.completed){
            return InspecaoFormPageBody(
              formKey: widget.viewmodel.formKey,
              concludeCommand: widget.viewmodel.concludeCommand,
              saveCommand: widget.viewmodel.saveCommand,
              returnCommand: widget.viewmodel.returnCommand,
              formGroup: widget.viewmodel.formGroup!,
              inspecao: widget.inspecao,
            );
          }
          return const FormLayout(title: 'Registro não encontrado', footerItems: [], body: EmptyWidget());
        }
    );
  }
}
