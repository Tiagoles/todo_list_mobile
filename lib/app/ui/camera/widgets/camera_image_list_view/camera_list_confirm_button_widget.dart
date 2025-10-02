import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class CameraListConfirmButtonWidget extends StatefulWidget {

  final VoidCallback onConfirm;
  final String text;

  const CameraListConfirmButtonWidget({
    super.key,
    required this.onConfirm,
    required this.text
  });

  @override
  State<CameraListConfirmButtonWidget> createState() =>
      _CameraListConfirmButtonWidgetState();
}

class _CameraListConfirmButtonWidgetState
    extends State<CameraListConfirmButtonWidget>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;
  late MappedColor _mappedColor;

  @override
  void initState() {
    _controller = AnimationController(
        duration: BootstrapButtonStyle.animationDuration,
        vsync: this
    );

    _controller.addStatusListener((status){
      if(status == AnimationStatus.completed) _controller.reverse();
    });

    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    _updateTheme();
  }

  void _updateTheme(){
    if(mounted){
      _mappedColor = BootstrapButtonStyle.getMappedColor(ButtonColor.success, context);
      _colorAnimation = ColorTween(
          begin: _mappedColor.basic,
          end: _mappedColor.hover).animate(_controller);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedBuilder(animation: _controller, builder: (_, w){
      return IconButton(
          style: IconButton.styleFrom(
              backgroundColor: _colorAnimation.value,
              padding: const EdgeInsets.all(16)
          ),
          onPressed: (){
            _controller.forward();
            widget.onConfirm();
          },
          icon: Stack(
            children: [
              Icon(
                TablerIcons.check,
                color: context.customColors.success.onColorContainer,
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    widget.text,
                    style: textTheme.labelSmall!.apply(color: context.customColors.success.onColorContainer),
                  )
              )
            ],
          )
      );
    });
  }
}
