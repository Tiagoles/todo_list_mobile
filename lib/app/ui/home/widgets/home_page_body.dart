import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/body_card.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

import '../../todo_list/get_list.dart';

class HomePageBody extends StatefulWidget {
  final bool isLoading;

  const HomePageBody({super.key, required this.isLoading});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return BodyCard(
      icon: TablerIcons.list_check,
      title: Text('TODO LIST'.toUpperCase(), style: textTheme.titleMedium),
      child: const GetList(),
    );
  }
}
