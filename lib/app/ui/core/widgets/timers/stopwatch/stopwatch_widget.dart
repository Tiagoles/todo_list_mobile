import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/utils/extensions/color_scheme_extension.dart';
import 'package:smaservicos/app/utils/extensions/date_time_extensions.dart';

import 'stopwatch_clock_widget.dart';
import 'stopwatch_skeleton_widget.dart';

class StopwatchWidget extends StatefulWidget {
  final bool isLoading;
  final String description;
  final VoidCallback? onTap;
  final VoidCallback? onPlayerTap;
  final DateTime startDate;
  final DateTime? endDate;

  const StopwatchWidget({
    super.key,
    required this.startDate,
    this.endDate,
    this.isLoading = false,
    required this.description,
    this.onTap,
    this.onPlayerTap,
  });

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  Timer? _timer;
  late Duration _difference;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    // Calcula a diferença inicial
    _difference = (widget.endDate ?? DateTime.now()).difference(widget.startDate);

    // Se a data de término for nula, inicia o cronômetro
    if (widget.endDate == null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _difference = DateTime.now().difference(widget.startDate);
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant StopwatchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Se a data de início ou fim mudou, reinicialize o cronômetro
    if (oldWidget.startDate != widget.startDate || oldWidget.endDate != widget.endDate) {
      _timer?.cancel();  // Cancela o timer anterior, se houver
      _initializeTimer(); // Reinicia o timer com os novos valores
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela o timer ao destruir o widget
    super.dispose();
  }

  Widget _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return StopwatchClockWidget(hours: hours, minutes: minutes, seconds: seconds);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    if (widget.isLoading) return const StopwatchSkeletonWidget();

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: colors.primaryContainer),
            borderRadius: BorderRadius.circular(4),
            gradient: colors.gradientPrimaryLight
        ),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _formatDuration(_difference),
                Text(
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  widget.description,
                  style: textTheme.bodyMedium!.apply(color: colors.tertiaryContainer),
                ),
                Text(
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  interval,
                  style: textTheme.labelMedium!.apply(color: colors.onPrimaryContainer),
                ),
              ],
            )),
            playerButton,
          ],
        ),
      ),
    );
  }

  Widget get playerButton{
    if(widget.onPlayerTap != null){
      return BootstrapButtonWidget(
        onPressed: widget.onPlayerTap,
        icon: widget.endDate != null ? TablerIcons.player_play : TablerIcons.player_pause,
        type: ButtonType.outlinedButton,
        color: ButtonColor.warning,
        paddingVertical: 12,
        paddingHorizontal: 12,
      );
    }
    return const SizedBox.shrink();
  }

  String get interval{
    return '${widget.startDate.format('dd/MM/yyyy HH:mm')} - ${widget.endDate?.format('dd/MM/yyyy HH:mm') ?? 'Agora'}';
  }

}