import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/toastr_service.dart';
import 'package:smaservicos/app/ui/todo_list/viewmodels/todo_viewmodel.dart';
import '../../../domain/entities/todo/todo.dart';
import '../../../domain/enums/prioridade_enum.dart';
import '../../../utils/command.dart';
import 'field_widget.dart';

class InfoCardDetails extends StatefulWidget {
  final TodoViewmodel viewModel;
  final int todoId;

  const InfoCardDetails({
    super.key,
    required this.viewModel,
    required this.todoId,
  });

  @override
  State<InfoCardDetails> createState() => _InfoCardDetailsState();
}

class _InfoCardDetailsState extends State<InfoCardDetails> {
  Todo? todo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.findByIdCommand.execute(widget.todoId);
      widget.viewModel.findByIdCommand.addListener(onFindChanges);
    });
  }

  @override
  void dispose() {
    widget.viewModel.findByIdCommand.removeListener(onFindChanges);
    super.dispose();
  }

  void onFindChanges() {
    final cmd = widget.viewModel.findByIdCommand;
    if (cmd.error) {
      Modular.to.pop();
      ToastrService.error(
        context: context,
        message: cmd.errorMessage ?? 'Erro ao buscar tarefa',
      );
    }
    if (cmd.completed) {
      todo = cmd.result?.getOrNull();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.findByIdCommand,
      builder: (context, _) {
        final cmd = widget.viewModel.findByIdCommand;
        if (cmd.completed && todo != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FieldWidget.date(
                label: 'Data de criação',
                date: todo!.createdAt,
                icon: TablerIcons.calendar,
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              if (todo!.endedAt != null)
                FieldWidget.date(
                  label: 'Data de término',
                  date: todo!.endedAt,
                  icon: TablerIcons.clock_check,
                  maxLines: 1,
                ),
              FieldWidget.text(
                label: 'Prioridade',
                text: todo!.priority == 1
                    ? PrioridadeEnum.muitoBaixa.label
                    : todo!.priority == 2
                    ? PrioridadeEnum.baixa.label
                    : todo!.priority == 3
                    ? PrioridadeEnum.moderada.label
                    : todo!.priority == 4
                    ? PrioridadeEnum.alta.label
                    : todo!.priority == 5
                    ? PrioridadeEnum.muitoAlta.label
                    : '',
                icon: TablerIcons.alert_circle,
                maxLines: 1,
                textColor: PrioridadeEnum.values
                    .firstWhere(
                      (e) => e.code == todo!.priority,
                      orElse: () => PrioridadeEnum.muitoBaixa,
                    )
                    .color(context),
              ),
              const SizedBox(height: 8),
              FieldWidget.text(
                label: 'Descrição',
                text: todo!.description,
                icon: TablerIcons.note,
                maxLines: 3,
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
