import 'dart:async';

import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/checkboxs/styled_checkbox_widget.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

import '../../../domain/entities/todo/todo.dart';
import '../viewmodels/todo_viewmodel.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  final FormCheckbox? formCheckbox;
  final TodoViewmodel? todoViewmodel;

  const TodoCard({
    super.key,
    required this.todo,
    this.formCheckbox,
    this.todoViewmodel,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool lineTrough = false;
  final formCheckbox = FormCheckbox();

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);

    return ClipRRect(
      child: Dismissible(
        key: Key(widget.todo.id.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          color: Colors.red.withAlpha(200),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) {
          final vm = widget.todoViewmodel!;
          vm.todos.value = List.from(vm.todos.value)..remove(widget.todo);
          vm.deleteCommand.execute(widget.todo);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.0,
                  color: colors.inversePrimary.withAlpha(50),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StyledCheckboxWidget(
                      formGroup: formCheckbox,
                      name: 'isChecked',
                      enabled: widget.todo.endedAt == null,
                      onChanged: (value) {
                        widget.todoViewmodel!.saveCommand.execute(
                          widget.todo,
                          value,
                        );
                        setState(() {
                          lineTrough = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        widget.todo.description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.primary,
                          decoration: lineTrough
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 2,
              right: -1,
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  borderRadius: BorderRadius.circular(6),
                  badgeColor: colors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                badgeContent: Row(
                  children: [
                    Icon(Icons.date_range, size: 16, color: colors.onPrimary),
                    const SizedBox(width: 2),
                    Text(
                      DateFormat('dd/MM/yyyy').format(widget.todo.createdAt),
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.onPrimary,
                      ),
                    ),
                  ],
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  toAnimate: true,
                  animationDuration: Duration(milliseconds: 300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormCheckbox extends FormGroup {
  FormCheckbox()
    : super({
        'isChecked': FormControl.create<bool>(
          initialValue: false,
          options: FormControlOptions(isRequired: false),
        ),
      });

  @override
  void fromModel(model) {}

  @override
  FutureOr toModel() => throw UnimplementedError();
}
