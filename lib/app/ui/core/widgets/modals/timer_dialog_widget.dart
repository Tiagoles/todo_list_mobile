import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/config/viewmodels/config_viewmodel.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/timers/timer/timer_with_progress/circular/circular_timer_progress_widget.dart';

import '../shapes/shapes.d.dart';

class TimerDialogWidget extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final bool canClose;
  final String title;
  final Widget content;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;
  final VoidCallback? onDeny;
  final IconData? denyIcon;
  final ButtonColor? denyColor;
  final String? denyText;

  const TimerDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.backgroundColor,
    this.textColor,
    this.canClose = true,
    this.confirmText,
    this.onCancel,
    this.onDeny,
    this.denyIcon,
    this.denyColor,
    this.denyText
  });

  @override
  State<TimerDialogWidget> createState() => _TimerDialogWidgetState();
}

class _TimerDialogWidgetState extends State<TimerDialogWidget> {

  final ConfigViewModel viewModel = Modular.get();
  final ValueNotifier<bool> isAble = ValueNotifier(false);

  @override
  void initState() {
    if(viewModel.configs.value.timer <= 0) isAble.value = true;
    super.initState();
  }

  @override
  void dispose() {
    isAble.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return PopScope(
      canPop: widget.canClose,
      child: SafeArea(
          top: false,
          child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: widget.backgroundColor ?? colors.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(4))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(widget.canClose) ... [
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: DragDownShapeWidget(),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        widget.title,
                        style: textTheme.titleMedium!.apply(color: widget.textColor),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(children: [
                          timer,
                          widget.content
                        ])
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 32, left: 16, right: 16),
                      child: actions,
                    ),
                  ],
                ),
              )
          )
      )
    );
  }

  Widget get timer{
    final timer = viewModel.configs.value.timer;
    if(timer <= 0) return const SizedBox();
    return Column(
      children: [
        CircularTimerProgressWidget(
          inTheEnd: () => isAble.value = true,
          remainingTime: timer,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget get actions{
    return ValueListenableBuilder(
      valueListenable: isAble,
      builder: (context, snapshot, _){
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            BootstrapButtonWidget(
              type: ButtonType.outlinedButton,
              text: 'Cancelar',
              size: ButtonSize.small,
              icon: TablerIcons.x,
              color: ButtonColor.dark,
              onPressed: widget.canClose ? () {
                Navigator.of(context).pop();
                widget.onCancel?.call();
              } : null,
            ),
            if(widget.onDeny != null)
              BootstrapButtonWidget(
                type: ButtonType.elevatedButton,
                icon: widget.denyIcon ?? TablerIcons.circle_off,
                color: widget.denyColor ?? ButtonColor.danger,
                size: ButtonSize.small,
                text: widget.denyText ?? 'Negar',
                onPressed: !snapshot ? null : () {
                  Navigator.of(context).pop();
                  widget.onDeny!.call();
                },
              ),
            BootstrapButtonWidget(
                type: ButtonType.elevatedButton,
                icon: TablerIcons.check,
                color: ButtonColor.primary,
                size: ButtonSize.small,
                text: widget.confirmText ?? 'Confirmar',
                onPressed: !snapshot ? null : () {
                  Navigator.of(context).pop();
                  widget.onConfirm();
                }
            ),
          ],
        );
      }
    );
  }

}
