import 'package:flutter/cupertino.dart';
import 'package:smaservicos/app/ui/core/widgets/loaders/block_ui_widget.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class BlockUi {
  static OverlayEntry? _entry;
  static int _refCount = 0;

  static void show(BuildContext context) {
    _refCount++;
    if (_entry != null) return;

    final barrierColor = context.colors.primaryContainer.withAlpha(700);

    _entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          ModalBarrier(
            color: barrierColor,
            dismissible: false,
          ),
          const Center(child: BlockUiWidget()),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_entry!);
  }

  static void hide() {
    if (_refCount > 0) _refCount--;
    if (_refCount == 0 && _entry != null) {
      _entry!.remove();
      _entry = null;
    }
  }

  static bool get isOpen => _entry != null;
}
