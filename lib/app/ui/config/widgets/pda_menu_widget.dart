import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smaservicos/app/ui/config/viewmodels/config_viewmodel.dart';

class PdaMenuWidget extends StatelessWidget {
  final ConfigViewModel viewModel = Modular.get();

  PdaMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return ValueListenableBuilder(
      valueListenable: viewModel.configs,
      builder: (context, snapshot, _) {
        final numeroPda = snapshot.numeroPda?.toString() ?? '';
        if (numeroPda.isNotEmpty) {
          return Text(
            'PDA: $numeroPda',
            style: textTheme.bodyMedium!.apply(color: colors.onPrimaryContainer),
          );
        }
        return Container();
      }
    );
  }
}
