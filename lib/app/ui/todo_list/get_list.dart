import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/todo_list/viewmodels/todo_viewmodel.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/todo_list_view.dart';

import '../../plugins/toastr_service.dart';

class GetList extends StatefulWidget {
  const GetList({super.key});

  @override
  State<GetList> createState() => _GetListState();
}

class _GetListState extends State<GetList> {
  final viewModel = Modular.get<TodoViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListenableBuilder(
        listenable: viewModel.getCommand,
        builder: (context, _) {
          if (viewModel.getCommand.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.getCommand.error) {
            ToastrService.error(
              context: context,
              message: 'Ocorreu um erro ao carregar as tarefas.',
            );
          }
            return TodoListView(todoViewmodel: viewModel);
        },
      ),
    );
  }
}
