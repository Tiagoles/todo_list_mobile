import 'package:flutter/material.dart';
import './config_layout_footer_widget.dart';
import './config_layout_header_widget.dart';


class ConfigLayout extends StatelessWidget {

  final Widget body;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final VoidCallback onReturn;

  const ConfigLayout({
    super.key,
    required this.body,
    required this.onCancel,
    required this.onSave,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConfigLayoutHeaderWidget(
            onReturn: onReturn,
            key: const ValueKey<String>('config_layout_header_widget'),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: body,
              )
          ),
          ConfigLayoutFooterWidget(
              onCancel: onCancel,
              onSave: onSave
          )
        ],
      ),
    ));
  }
}
