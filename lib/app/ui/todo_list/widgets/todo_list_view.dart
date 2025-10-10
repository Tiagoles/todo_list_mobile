import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/todo_list/viewmodels/todo_viewmodel.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/todo_card.dart';
import 'package:smaservicos/app/ui/todo_list/widgets/priority_legend_widget.dart';
import '../../../domain/entities/todo/todo.dart';

class TodoListView extends StatelessWidget {
  final TodoViewmodel todoViewmodel;

  const TodoListView({super.key, required this.todoViewmodel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todoViewmodel.todos,
      builder: (context, value, child) {
        if (value.isEmpty) {
          return const SingleChildScrollView(child: EmptyWidget());
        }

        return ListView.builder(
          itemCount: value.length + 1,
          itemBuilder: (context, index) {
             if (index == 0) {
              return const PriorityLegendWidget();
            }

            final Todo todo = value[index - 1];

            return TodoCard(todo: todo, todoViewmodel: todoViewmodel);
          },
        );
      },
    );
  }
}

