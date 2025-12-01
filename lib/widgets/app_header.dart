import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppHeader({super.key, this.title = "BizLink"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text(title, style: AppTypography.headlineMedium),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primaryRed,
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
