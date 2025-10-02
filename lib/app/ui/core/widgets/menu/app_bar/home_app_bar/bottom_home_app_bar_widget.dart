import 'package:flutter/material.dart';
import 'package:smaservicos/app/ui/auth/widgets/user_details_widget.dart';
import 'package:smaservicos/app/ui/config/widgets/pda_menu_widget.dart';

class BottomHomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  const BottomHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          UserDetailsWidget(),
          PdaMenuWidget()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
