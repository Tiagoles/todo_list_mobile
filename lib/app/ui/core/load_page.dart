import 'package:flutter/material.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';
import 'widgets/loaders/brand_loader.dart';

class LoadPage extends StatelessWidget {
  final String? description;
  const LoadPage({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.primaryContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BrandLoader(
                width: context.screenWidth*0.4,
                height: context.screenWidth*0.4
            ),
            if(description != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  description!,
                  style: context.textTheme.bodyLarge!.apply(color: colors.onPrimaryContainer)
                ),
              )
          ],
        ),
      ),
    );
  }
}
