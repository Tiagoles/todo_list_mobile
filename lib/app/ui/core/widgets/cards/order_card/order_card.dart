import 'package:flutter/material.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';
import 'details_order_card.dart';
import 'main_order_card.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class OrderCard extends StatefulWidget {
  final VoidCallback onTap;
  final bool isSyncing;
  final String? error;
  final SyncStatus syncStatus;
  final DateTime dateOpened;
  final String address;
  final String? autor;
  final Map<String, String?> details;

  const OrderCard({
    super.key,
    required this.onTap,
    required this.syncStatus,
    required this.dateOpened,
    required this.address,
    required this.autor,
    this.isSyncing = false,
    this.error,
    this.details = const {},
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleDetails() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: context.colors.onSurface.withAlpha(100),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainOrderCard(
            dateOpened: widget.dateOpened,
            address: widget.address,
            autor: widget.autor ?? 'Indefinido',
            isSyncing: widget.isSyncing,
            error: widget.error,
            onTap: _toggleDetails,
          ),
          SizeTransition(
            sizeFactor: _expandAnimation,
            axisAlignment: -1.0,
            child: DetailsOrderCard(
              data: widget.details,
              onStartPressed: widget.onTap,
              syncStatus: widget.syncStatus,
            ),
          ),
        ],
      ),
    );
  }
}
