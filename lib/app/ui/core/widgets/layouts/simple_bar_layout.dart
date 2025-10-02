import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/app_bar/app_bar_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/menu/sidenav/sidenav_widget.dart';

class SimpleBarLayout extends StatelessWidget {
  final Widget child;
  final Future<void> Function()? onRefresh;
  final PreferredSizeWidget appBar;

  const SimpleBarLayout({
    super.key,
    required this.child,
    this.onRefresh,
    this.appBar = const AppBarWidget(),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBar,
      drawer: const SidenavWidget(),
      body: _buildBody(context)
    ));
  }

  Widget _buildBody(BuildContext context){
    if(onRefresh != null){
      return RefreshIndicator(
        onRefresh: onRefresh!,
        child: _buildChild(context),
      );
    }
    return _buildChild(context);
  }

  Widget _buildChild(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        children: [
          Expanded(child: child),
        ],
      ),
    );
  }

}
