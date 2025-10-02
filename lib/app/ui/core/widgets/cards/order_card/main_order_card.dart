import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shimmer/shimmer.dart';
import 'package:smaservicos/app/plugins/snackbar_service.dart';
import 'package:smaservicos/app/ui/core/viewmodels/order_card_viewmodel.dart';
import 'package:smaservicos/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:smaservicos/app/ui/core/widgets/cards/order_card/order_card_content.dart';

class MainOrderCard extends StatefulWidget {
  final DateTime dateOpened;
  final String address;
  final String autor;
  final VoidCallback onTap;
  final bool isSyncing;
  final String? error;

  const MainOrderCard({
    super.key,
    required this.dateOpened,
    required this.address,
    required this.autor,
    required this.onTap,
    this.isSyncing = false,
    this.error
  });

  @override
  State<MainOrderCard> createState() => _MainOrderCardState();
}

class _MainOrderCardState extends State<MainOrderCard> {

  late final OrderCardViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = OrderCardViewModel(widget.dateOpened);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Stack(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -3, end: -3),
            badgeContent: Text(
              viewModel.differenceString,
              style: theme.textTheme.labelSmall!.copyWith(
                  color: colors.surface,
                  fontWeight: FontWeight.bold
              ),
            ),
            badgeStyle: badges.BadgeStyle(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                badgeColor: viewModel.getStatusColor(context),
                shape: badges.BadgeShape.square
            ),
            child: OrderCardContent(dateOpened: widget.dateOpened, address: widget.address, autor: widget.autor),
          ),
        ),
        if (widget.isSyncing)
          Positioned.fill(
            child: Shimmer.fromColors(
              period: const Duration(seconds: 2),
              baseColor: colors.primary.withValues(alpha: 0.3),
              highlightColor: colors.surface.withValues(alpha: 0.6),
              child: Container(
                color: colors.surface.withValues(alpha: 0.3),
              ),
            ),
          ),
        if(widget.error != null && widget.error!.isNotEmpty && !widget.isSyncing)
          Positioned(
              top: -10,
              left: -10,
              child: BootstrapButtonWidget(
                icon: TablerIcons.exclamation_circle,
                color: ButtonColor.danger,
                size: ButtonSize.small,
                paddingVertical: 8,
                paddingHorizontal: 8,
                onPressed: () => SnackBarService.error(context: context,message: widget.error!),
              )
          ),
      ],
    );
  }
}
