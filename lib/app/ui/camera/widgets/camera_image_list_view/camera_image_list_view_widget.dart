import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/plugins/modal_actions.dart';
import 'package:smaservicos/app/ui/camera/widgets/camera_image_list_view/camera_image_list_control_buttons_widget.dart';
import 'package:smaservicos/app/ui/themes/colors/app_colors.dart';

class CameraImageListViewWidget extends StatefulWidget {
  final List<File> images;
  final VoidCallback onConfirm;

  const CameraImageListViewWidget({
    super.key,
    required this.images,
    required this.onConfirm,
  });

  @override
  State<CameraImageListViewWidget> createState() =>
      _CameraImageListViewWidgetState();
}

class _CameraImageListViewWidgetState extends State<CameraImageListViewWidget> {
  @override
  Widget build(BuildContext context) {

    final cardSize = MediaQuery.of(context).size.width * 0.2;

    if (widget.images.isEmpty) return Container();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 80,
              right: 64
          ),
          child: SizedBox(
            height: cardSize + 16,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                final image = widget.images[index];
                return AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(
                    width: cardSize,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: AppColors.light, width: 1),
                      ),
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  ModalActions.showGaleryModal(context,
                                      images: widget.images, initialIndex: index);
                                },
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.file(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -12,
                                right: -12,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(4),
                                    minimumSize: const Size.square(0),
                                    backgroundColor: AppColors.danger.withValues(alpha: 0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: const BorderSide(color: AppColors.white, width: 1),
                                    ),
                                  ),
                                  icon: const Icon(
                                    TablerIcons.x,
                                    size: 16,
                                  ),
                                  color: AppColors.white,
                                  onPressed: () {
                                    setState(() {
                                      if (widget.images[index].existsSync()) {
                                        widget.images[index].delete();
                                      }
                                      widget.images.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        CameraImageListControlButtonsWidget(
          onClear: (){
            setState((){
              widget.images.clear();
            });
          },
          onConfirm: widget.onConfirm,
          images: widget.images,
        )
      ],
    );
  }
}
